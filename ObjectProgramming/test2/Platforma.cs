using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test2
{
    public class Platforma: Towarowy
    {
        public Platforma(float masa, float ladunek) : base(masa, ladunek) { }

        public override float MasaCalkowita()
        {
            return Masa + Ladunek;
        }

        public override int Pasazerow()
        {
            return 0;
        }

        public override void Wypisz()
        {
            Console.WriteLine($"Platgorma| Masa: {Masa}, Ładunek {Ladunek}");
        }

    }
}
