using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace PW21Factory
{/// <summary>
/// true для методов, если имеется, false - отсутствует
/// </summary>
    public static class IDContainer
    {
        public static bool? CheckDetailContain(int id)
        {
            FactoryEntities db = DBContext.GetContext();
            try
            {
                if (db.Movements.Find(id) == null) throw new Exception();
                return true;
            }
            catch 
            {
                MessageBox.Show("Код детали не найден!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return false; 
            }
        }
        public static bool? CheckInvoiceContain(int id)
        {
            FactoryEntities db = DBContext.GetContext();
            try
            {
                if (db.InvoiceOnInputs.Find(id) == null) throw new Exception();
                return true;              
            }
            catch { return false; }
        }
        public static bool? CheckRequirementContain(int id)
        {
            FactoryEntities db = DBContext.GetContext();
            try
            {
                if (db.RequiermentOnOutputs.Find(id) == null) throw new Exception();
                return true;
            }
            catch { return false; }            
        }
    }
}
