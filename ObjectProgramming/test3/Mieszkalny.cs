using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test3
{
    public  class Mieszkalny: Lokal
    {
        public int Pokoi { get; set; }

        public Mieszkalny(string adres, bool prad, bool woda, int pokoi) : base(adres, prad, woda)
        {
            Pokoi = pokoi;
        }

        public override void Wypisz()
        {
            Console.WriteLine($"Mieszkalny| : Adres {Adres}, Prad {Prad}, Woda: {Woda}, Wynajety: {Wynajety}, Pokoi: {Pokoi}");
        }

        public override bool Wynajmowalne()
        {
            if (base.Wynajmowalne() == true && Woda == true && Prad == true)
                return true;
            else
                return false;
        }


    }
}
