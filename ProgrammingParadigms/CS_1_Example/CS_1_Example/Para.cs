using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal class Para<T> where T:IComparable<T>
    {
        public T Pierwszy { get; set; }
        public T Drugi { get; set; }

        public Para(T pierwszy, T drugi)
        {
            Pierwszy = pierwszy;
            Drugi = drugi;
        }

        public T Max ()
        {
            if(Pierwszy.CompareTo(Drugi) < 0)
                return Drugi;
            return Pierwszy;
        }
    }
}
