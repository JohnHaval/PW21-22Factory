using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PW21Factory
{
    public static class DBContext
    {
        static FactoryEntities _context;
        public static FactoryEntities GetContext()
        {
            if (_context == null) _context = new FactoryEntities();
            return _context;
        }
        public static FactoryEntities UpdateContext()
        {
            return _context = new FactoryEntities();
        }
    }
}
