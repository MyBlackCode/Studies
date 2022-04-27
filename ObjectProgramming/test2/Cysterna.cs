using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test2
{
    public class Cysterna: Towarowy
    {
        public float Pojemnosc { get; set; }

        public Cysterna(float masa, float ladunek, float pojemnosc): base (masa,ladunek)
        {
            Pojemnosc = pojemnosc;
        }

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
            Console.WriteLine($"Cysterna| Masa: {Masa}, Ładunek {Ladunek}, Pojemność {Pojemnosc}");
        }


    }
}
