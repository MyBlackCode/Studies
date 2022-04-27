using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test2
{
    public abstract class Wagon: IInfoPojazd
    {
        public float Masa { get; set; }

        public Wagon(float masa)
        {
            Masa = masa;
        }

        public abstract float MasaCalkowita();
        public abstract int Pasazerow();
        public abstract void Wypisz();

    }
}
