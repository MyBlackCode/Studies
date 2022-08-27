using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal interface ISerwis<in T>
    {
        void Napraw(T obiekt);
    }
}
