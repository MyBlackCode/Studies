using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kolokwium1_przyklad
{
    public class Towarowy: Wagonik
    {
        public string Ladunek;

        public Towarowy(float masa, string nazwa, string ladunek):base (masa, nazwa)
        {
            Ladunek = ladunek;
        }

        public override string Typ()
        {
            return "Towarowy";
        }

        public override void WypiszInfo()
        {
            Console.WriteLine($"{Typ()} | Masa: {Masa}, Nazwo: {Nazwa}, Ladunek: {Ladunek}");
        }
    }
}
