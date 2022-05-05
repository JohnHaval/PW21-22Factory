using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.Entity;

namespace PW21Factory
{
    /// <summary>
    /// Логика взаимодействия для InputInvoice.xaml
    /// </summary>
    public partial class InputInvoice : Window
    {
        public InputInvoice()
        {
            InitializeComponent();
        }
        FactoryEntities db;
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db = DBContext.GetContext();
            db.InvoiceOnInputs.Load();
            InvoiceOnInput.ItemsSource = db.InvoiceOnInputs.Local.ToBindingList();
        }
        InvoiceOnInput obj;
        private void InvoiceOnInput_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                obj = (InvoiceOnInput)InvoiceOnInput.Items[InvoiceOnInput.SelectedIndex];
                InvoiceID.Text = obj.InvoiceID.ToString();
                DetailID.Text = obj.DetailID.ToString();
                InputCount.Text = obj.InputCount.ToString();
                DateOfInput.Text = obj.DateOfInput.ToString();
                DetailInfo.ItemsSource = db.Movements.Local.ToList().Where(p => p.DetailID == obj.DetailID);
            }
            catch { }
        }

        private void AddRecord_Click(object sender, RoutedEventArgs e)
        {
            if (ToDataRecord() == true)
            {
                if (IDContainer.CheckInvoiceContain(invoiceID) == false)
                {
                    db.AddInvoice(invoiceID, detailID, inputCount, dateOfInput);
                    db.SaveChanges();
                    db.InvoiceOnInputs.Load();
                    InvoiceOnInput.Items.Refresh();
                }
                else CommonMessages.MessageAboutIDHas("Добавление");
            }
        }

        private void ChangeRecord_Click(object sender, RoutedEventArgs e)
        {
            if (ToDataRecord() == true)
            {
                try
                {
                    if (IDContainer.CheckInvoiceContain(invoiceID) == true)
                    {
                        obj.InvoiceID = invoiceID;
                        obj.DetailID = detailID;
                        obj.InputCount = inputCount;
                        obj.DateOfInput = dateOfInput;
                    }
                    else
                    {
                        CommonMessages.MessageAboutIDNotHas("Изменение");
                        return;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                db.SaveChanges();
                InvoiceOnInput.Items.Refresh();
            }
        }
        int invoiceID, detailID, inputCount;

        private void RemoveRecord_Click(object sender, RoutedEventArgs e)
        {
            if (InvoiceOnInput.SelectedIndex != -1)
            {
                if (CommonMessages.MessageBeforeRemove() == true)
                {
                    db.InvoiceOnInputs.Remove(obj);
                    db.SaveChanges();
                    InvoiceOnInput.Items.Refresh();
                }
            }
            else CommonMessages.MessageAboutSelectBeforeRemove();
        }

        DateTime dateOfInput;
        private bool? ToDataRecord()
        {
            try
            {
                invoiceID = Convert.ToInt32(InvoiceID.Text);
                if (invoiceID < 1) throw new Exception();                
            }
            catch
            {
                CommonMessages.MessageAboutUncorrectVal("InvoiceID");
                return false;
            }
            try
            {
                detailID = Convert.ToInt32(DetailID.Text);
                if (detailID < 1) throw new Exception();
                if (IDContainer.CheckDetailContain(detailID) == false) return false;
            }
            catch
            {
                CommonMessages.MessageAboutUncorrectVal("DetailID");
                return false;
            }
            try
            {
                inputCount = Convert.ToInt32(InputCount.Text);
                if (inputCount < 0) throw new Exception();
            }
            catch
            {
                CommonMessages.MessageAboutUncorrectVal("InputCount");
                return false;
            }
            try
            {
                dateOfInput = Convert.ToDateTime(DateOfInput.Text);
            }
            catch
            {
                CommonMessages.MessageAboutUncorrectVal("DateOfInput");
                return false;
            }            
            return true;
        }
    }
}
