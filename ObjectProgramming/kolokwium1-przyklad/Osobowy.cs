using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kolokwium1_przyklad
{
    public class Osobowy : Wagonik
    {
        
        public int Miejsca;
        public int Zajete;

        public Osobowy(float masa, string nazwa, int miejsce, int zajete) : base(masa, nazwa)
        {
            Miejsca = miejsce;
            Zajete = zajete;
        }

        public override string Typ()
        {
            return "Osobowy";
        }

        public override void WypiszInfo()
        {
            Console.WriteLine($"{Typ()} | Masa: {Masa}, Nazwo: {Nazwa}, Miejsca: {Miejsca}, Zajete {Zajete}");
        }
    }
}
