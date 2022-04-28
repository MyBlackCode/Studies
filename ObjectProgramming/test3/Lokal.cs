using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test3
{
    public abstract class Lokal: IInfo, ILokal
    {
        public string Adres { get; set; }
        public bool Prad { get; set; }
        public bool Woda { get; set; }
        public bool Wynajety { get; set; }

        public Lokal( string adres, bool prad, bool woda)
        {
            Adres = adres;
            Prad = prad;
            Woda = woda;
        }

        public abstract void Wypisz();

        public virtual bool Wynajmowalne()
        {
            if (Wynajety == true)
            {
                return false;
            }
            return true;
        }

    }
}
