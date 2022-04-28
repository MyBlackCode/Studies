using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test3
{
    public class Mieszkanie: Mieszkalny
    {
        int Pietro { get; set; }

        public  Mieszkanie (string adres, bool prad, bool woda, int pokoi, int pietro): base (adres,prad,woda, pokoi)
        {
            Pietro = pietro;
        }

        public override void Wypisz()
        {
            Console.WriteLine($"Mieszkanie| : Adres {Adres}, Prad {Prad}, Woda: {Woda}, Wynajety: {Wynajety}, Pokoi: {Pokoi}, Pietro: {Pietro}");
        }



    }
}
