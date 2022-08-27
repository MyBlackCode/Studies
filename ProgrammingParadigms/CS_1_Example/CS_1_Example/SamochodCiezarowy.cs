using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal class SamochodCiezarowy : Samochod
    {
        public void Napraw(ISerwis<SamochodCiezarowy> serwis)
        {
            serwis.Napraw(this);
        }
    }
}
