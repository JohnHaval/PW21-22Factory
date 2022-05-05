using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace PW21Factory
{
    /// <summary>
    /// Логика взаимодействия для OutputRequirement.xaml
    /// </summary>
    public partial class OutputRequirement : Window
    {
        public OutputRequirement()
        {
            InitializeComponent();
        }
        FactoryEntities db;
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db = DBContext.GetContext();
            db.RequiermentOnOutputs.Load();
            RequirementOnOutput.ItemsSource = db.RequiermentOnOutputs.Local.ToBindingList();
        }
        RequiermentOnOutput obj;
        private void RequirementOnOutput_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                obj = (RequiermentOnOutput)RequirementOnOutput.Items[RequirementOnOutput.SelectedIndex];
                RequirementID.Text = obj.RequirementID.ToString();
                DetailID.Text = obj.DetailID.ToString();
                OutputCount.Text = obj.OutputCount.ToString();
                DateOfOutput.Text = obj.DateOfOutput.ToString();
                DetailInfo.ItemsSource = db.Movements.Local.ToList().Where(p => p.DetailID == obj.DetailID);
            }
            catch { }
        }

        private void AddRecord_Click(object sender, RoutedEventArgs e)
        {
            if (ToDataRecord() == true)
            {
                if (IDContainer.CheckRequirementContain(requirementID) == false)
                {
                    db.AddRequirement(requirementID, detailID, outputCount, dateOfOutput);
                    db.SaveChanges();
                    db.RequiermentOnOutputs.Load();
                    RequirementOnOutput.Items.Refresh();
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
                    if (IDContainer.CheckRequirementContain(requirementID) == true)
                    {
                        obj.RequirementID = requirementID;
                        obj.DetailID = detailID;
                        obj.OutputCount = outputCount;
                        obj.DateOfOutput = dateOfOutput;
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
                RequirementOnOutput.Items.Refresh();
            }
        }
        int requirementID, detailID, outputCount;

        private void RemoveRecord_Click(object sender, RoutedEventArgs e)//------------------------------------------------WARNING! NEED MULTISELECT REMOVING
        {
            if (RequirementOnOutput.SelectedIndex != -1)
            {
                if (CommonMessages.MessageBeforeRemove() == true)
                {
                    db.RequiermentOnOutputs.Remove(obj);
                    db.SaveChanges();
                    RequirementOnOutput.Items.Refresh();
                }
            }
            else CommonMessages.MessageAboutSelectBeforeRemove();
        }

        DateTime dateOfOutput;
        private bool? ToDataRecord()
        {
            try
            {
                requirementID = Convert.ToInt32(RequirementID.Text);
                if (requirementID < 1) throw new Exception();                
            }
            catch
            {
                CommonMessages.MessageAboutUncorrectVal("RequirementID");
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
                outputCount = Convert.ToInt32(OutputCount.Text);
                if (outputCount < 0) throw new Exception();
            }
            catch
            {
                CommonMessages.MessageAboutUncorrectVal("OutputCount");
                return false;
            }
            try
            {
                dateOfOutput = Convert.ToDateTime(DateOfOutput.Text);
            }
            catch
            {
                CommonMessages.MessageAboutUncorrectVal("DateOfOutput");
                return false;
            }
            return true;
        }
    }
}
