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

namespace PW21Factory
{
    /// <summary>
    /// Логика взаимодействия для SearcherWin.xaml
    /// </summary>
    public partial class SearcherWin : Window
    {
        public SearcherWin()
        {
            InitializeComponent();
        }
        public IQueryable Que;
        FactoryEntities db;
        private void Find_Click(object sender, RoutedEventArgs e)
        {
            if (FindVal.Text != "")
            {
                Que = from p in db.Movements
                      where p.DetailName == FindVal.Text
                      select p;
                DialogResult = true;
                Close();
            }
            else MessageBox.Show("Для начала введите значение перед выполнением поиска", "Поиск", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private void Window_Activated(object sender, EventArgs e)
        {
            FindVal.Focus();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db = DBContext.GetContext();
        }
    }
}
