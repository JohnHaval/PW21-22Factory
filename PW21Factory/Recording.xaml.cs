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
    /// Логика взаимодействия для Recording.xaml
    /// </summary>
    public partial class Recording : Window
    {
        bool _isEdit;
        Movement _detail;
        PriceDictionary _price;
        FactoryEntities db = DBContext.GetContext();
        public Recording()
        {
            InitializeComponent();
        }
        public Recording(Movement detail)
        {
            InitializeComponent();
            DetailID.IsReadOnly = true;
            _isEdit = true;
            DoIt.Content = "Изменить";
            Title = "Редактировать записи";
            _detail = detail;
            try
            {
                _price = db.PriceDictionaries.Find(detail.DetailID);
            }
            catch { }
        }

        private void DoIt_Click(object sender, RoutedEventArgs e)
        {
            if (_detail == null) _detail = new Movement();
            if (_price == null) _price = new PriceDictionary();
            int detailID, detailCount;
            decimal money;
            try
            {
                detailID = Convert.ToInt32(DetailID.Text);
                if (detailID < 1) throw new Exception();
            }
            catch
            {
                MessageForCorrect("'Код детали'");
                DetailID.Focus();
                return;
            }
            if (DetailName.Text == "")
            {
                MessageForEmpty("'Имя детали'");
                DetailName.Focus();
                return;
            }
            try
            {
                detailCount = Convert.ToInt32(DetailCount.Text);
                if (detailCount < 0) throw new Exception();
            }
            catch
            {
                MessageForCorrect("'Кол-во деталей'");
                DetailCount.Focus();
                return;
            }
            try
            {
                money = Convert.ToDecimal(DetailPrice.Text);
                if (money < 0) throw new Exception();
            }
            catch
            {
                MessageForCorrect("'Цена детали'");
                DetailPrice.Focus();
                return;
            }           
            ToSubject(detailID, DetailName.Text, detailCount, money);
            if (!_isEdit)
            {
                try
                {
                    db.Movements.Add(_detail);
                }
                catch
                {
                    MessageBox.Show("Деталь с указанным ID существует", "Ошибка добавления детали", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                try
                {
                    db.SaveChanges();//Дополнительное сохранение во имя исключения по связям
                    db.PriceDictionaries.Add(_price);
                }
                catch
                {
                    MessageBox.Show("Цена с указанным ID детали существует", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Warning);                    
                }
            }
            db.SaveChanges();
            DialogResult = true;
            Close();            
        }
        private void ToSubject(int id, string name, int count, decimal price)
        {
            _detail.DetailID = id;
            _detail.DetailName = name;
            _detail.DetailCount = count;
            _price.DetailID = id;
            _price.Price = price;
        }
        private void MessageForCorrect(string text)
        {
            MessageBox.Show($"Некорректно введено значение для {text}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
        }
        private void MessageForEmpty(string text)
        {
            MessageBox.Show($"Не может быть пустого значения для {text}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            DetailID.Focus();
            if (_isEdit)
            {
                DetailID.Text = _detail.DetailID.ToString();
                DetailName.Text = _detail.DetailName;
                DetailCount.Text = _detail.DetailCount.ToString();
                try
                {
                    DetailPrice.Text = _price.Price.ToString();
                }
                catch
                {
                    MessageBox.Show("Отсутствует цена для указанного ID детали", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }
        }
    }
}
