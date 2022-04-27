using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test2
{
    public class Osobowy: Wagon
    {
        public int Miejsc { get; set; }

        public Osobowy(float masa, int miejsc ): base (masa)
        {
            Miejsc = miejsc;
        }

        public override float MasaCalkowita()
        {
            return Masa;
        }

        public override int Pasazerow()
        {
            return Miejsc;
        }

        public override void Wypisz() 
        {
            Console.WriteLine($"Osobowy| Masa: {Masa} Miejsc: {Miejsc}");
        }
    }
}
