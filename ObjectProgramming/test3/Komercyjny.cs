using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test3
{
    public class Komercyjny: Lokal
    {
        public Komercyjny(string adres, bool prad, bool woda): base (adres, prad, woda){}

        public override void Wypisz()
        {
            Console.WriteLine($"Komercyjny| : Adres {Adres}, Prad {Prad}, Woda: {Woda}, Wynajety: {Wynajety}");
        }

        public override bool Wynajmowalne()
        {
            if (base.Wynajmowalne() == true && Prad == true)
                return true;
            else
                return false;
        }

    }
}
