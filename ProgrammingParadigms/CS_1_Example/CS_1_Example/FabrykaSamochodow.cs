using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal class FabrykaSamochodow : IFabryka<Samochod>
    {
        public Samochod Stworz()
        {
            throw new NotImplementedException();
        }

        public bool RozpatrzReklamacje (Samochod pojazd)
        {
            throw new NotImplementedException ();
        }
    }
}
