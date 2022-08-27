using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal class SamochodOsobowy:Samochod
    {
        public void Napraw(ISerwis<SamochodOsobowy> serwis)
        {
            serwis.Napraw(this);
        }
    }
}
