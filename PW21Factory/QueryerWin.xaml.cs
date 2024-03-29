﻿using System;
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
    /// Логика взаимодействия для QueryerWin.xaml
    /// </summary>
    public partial class QueryerWin : Window
    {
        public QueryerWin()
        {
            InitializeComponent();
        }
        FactoryEntities db = DBContext.GetContext();
        private void DoQuery_Click(object sender, RoutedEventArgs e)
        {
            if (CountDetailOnMonth.IsChecked == true)
            {
                if (MonthNumber.Text != "")
                {
                    try
                    {
                        int month = Convert.ToInt32(MonthNumber.Text);
                        Queryer.ItemsSource = db.GetInputCountOnMonth(month);
                    }
                    catch
                    {
                        MessageBox.Show("Некорректно введенное значение месяца!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else MessageBox.Show("Введите номер месяца!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            if (RequirementDetailCost.IsChecked == true)
            {
                if (ReqID.Text != "")
                {
                    try
                    {
                        int req = Convert.ToInt32(ReqID.Text);
                        Queryer.ItemsSource = db.GetDetailCostOnRequirement(req);
                    }
                    catch
                    {
                        MessageBox.Show("Некорректно введенное значение номера требования!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else MessageBox.Show("Введите номер требования!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);                
            }
            if (Remaining.IsChecked == true)
            {
                Queryer.ItemsSource = db.CountRemaining();
            }
            if (MovementOnDate.IsChecked == true)
            {
                try
                {
                    Queryer.ItemsSource = db.MovementOnDate(Date.SelectedDate);
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            if (AllCost.IsChecked == true)
            {
                Queryer.ItemsSource = db.GetDetailCost();
            }
            if (MostPopularDetail.IsChecked == true)
            {
                ResultName.Text = db.GetNameOfDetail().First();
            }
        }
    }
}
