using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal class Samochod
    {
        //public bool PrzetestujSamochod()
        //{
        //    throw new NotImplementedException();
        //}

        public void Napraw(ISerwis<Samochod> serwis)
        {
            serwis.Napraw(this);
        }
    }
}
