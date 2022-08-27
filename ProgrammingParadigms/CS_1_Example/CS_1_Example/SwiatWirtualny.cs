using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal class SwiatWirtualny
    {
        private Samochod samochod;

        public void PotrzebnySamochod(IFabryka<Samochod> fabryka)
        {
            samochod = fabryka.Stworz();
           // if(samochod.PrzetestujSamochod() == false)
                fabryka.RozpatrzReklamacje(samochod);
        }

        private bool PrzetestujSamochod()
        {
            throw new NotImplementedException();
        }
    }
}
