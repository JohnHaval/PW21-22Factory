using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace PW21Factory
{
    public class CommonMessages
    {
        public static void MessageAboutIDHas(string action)
        {
            MessageBox.Show("Запись с указанным ID существует", action, MessageBoxButton.OK, MessageBoxImage.Error);
        }
        public static void MessageAboutIDNotHas(string action)
        {
            MessageBox.Show("Запись с указанным ID не существует", action, MessageBoxButton.OK, MessageBoxImage.Error);
        }
        public static void MessageAboutSelectBeforeRemove()
        {
            MessageBox.Show("Необходимо выбрать запись для выполнения удаления!", "Удаление", MessageBoxButton.OK, MessageBoxImage.Error);
        }
        public static void MessageAboutUncorrectVal(string text)
        {
            MessageBox.Show($"Некорректно введено значение {text}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
        }
        public static bool? MessageBeforeRemove()
        {
            MessageBoxResult result = MessageBox.Show("Вы действительно хотите удалить выбранную запись?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes) return true;
            return false;
        }
    }
}
