using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test3
{
    internal class Dom: Mieszkalny
    {
        public float Rozmiar_dzialki { get; set; }

        public Dom(string adres, bool prad, bool woda, int pokoi, float rozmiar_dzialki): base (adres, prad, woda, pokoi)
        {
            Rozmiar_dzialki = rozmiar_dzialki;
        }

        public override void Wypisz()
        {
            Console.WriteLine($"Dom| : Adres {Adres}, Prad {Prad}, Woda: {Woda}, Wynajety: {Wynajety}, Pokoi: {Pokoi}, Rozmiar_dzialki: {Rozmiar_dzialki}");
        }

    }
}
