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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Entity;

namespace PW21Factory
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        FactoryEntities db;
        private void RequirementOnOutput_Click(object sender, RoutedEventArgs e)
        {
            OutputRequirement win = new OutputRequirement()
            {
                Owner = this
            };
            win.ShowDialog();
        }

        private void Help_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Данная программа имеет следующие особенности:\n" +
                "1) Имеется возможность работать с несколькими таблицами", "Справка", MessageBoxButton.OK, MessageBoxImage.Question);
        }

        private void AboutProgram_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Developer: Lopatkin Sergey ISP-31 (GitHub.Name = 'Hapro Bishop')", "О программе", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void Invoice_Click(object sender, RoutedEventArgs e)
        {
            InputInvoice win = new InputInvoice()
            {
                Owner = this
            };
            win.ShowDialog();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db = DBContext.GetContext();
            db.PriceDictionaries.Load();
            db.Movements.Load();
            MainTable.ItemsSource = db.MainDetailInfo();
        }

        private void Searcher_Click(object sender, RoutedEventArgs e)
        {
            SearcherWin win = new SearcherWin()
            {
                Owner = this
            };
            if (win.ShowDialog() == true)
            {
                var items = win.Que.ToListAsync().Result;
                MainTable.ItemsSource = items;
                if (items.Count == 0) MessageBox.Show("Значение не было найдено", "Поиск", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void AddRecord_Click(object sender, RoutedEventArgs e)
        {
            Recording win = new Recording()
            {
                Owner = this
            };
            if (win.ShowDialog() == true)
            {
                MainTable.ItemsSource = db.MainDetailInfo();
            }
        }

        private void UpdateRecord_Click(object sender, RoutedEventArgs e)
        {
            int iRow = MainTable.SelectedIndex;
            if (iRow != -1)
            {
                Recording win = new Recording(db.Movements.Local.ElementAt(iRow))
                {
                    Owner = this
                };
                if (win.ShowDialog() == true)
                {
                    MainTable.ItemsSource = db.MainDetailInfo();
                }
            }
            else SelectMessage();
            
        }
        private void SelectMessage()
        {
            MessageBox.Show("Для выполнения действия необходимо выбрать запись, кликнув по ней", "Выполнение действия", MessageBoxButton.OK, MessageBoxImage.Warning);
        }

        private void RemoveRecord_Click(object sender, RoutedEventArgs e)
        {
            int iRow = MainTable.SelectedIndex;
            if (iRow != -1)
            {   
                Movement detail = db.Movements.Local.ElementAt(iRow);
                db.Movements.Remove(detail);
                db.SaveChanges();
                db = DBContext.UpdateContext();//Каскадное удаление ломает. При нем не обновляется локальная DB и происходит исключение,
                db.Movements.Load();//если мы пытаемся добавить запись с тем же кодом, что был удален ранее
                db.PriceDictionaries.Load();
                MainTable.ItemsSource = db.MainDetailInfo();
            }
            else SelectMessage();
        }

        private void RefreshMainTable_Click(object sender, RoutedEventArgs e)
        {
            MainTable.ItemsSource = db.MainDetailInfo();
        }
    }
}
