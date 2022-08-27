using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_K
{
    public static  class Z1
    {
        public static int Silnia(this int a)
        {
            var b = 1;
            for (var i = 1; i <= a; i++) { b = b * i; }
            return b;
        }
    }
}
