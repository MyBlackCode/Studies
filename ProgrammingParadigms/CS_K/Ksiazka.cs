using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_K
{
    public class Ksiazka
    {
        public string Tytul { get; set; }
        public int RokWydania { get; set; }
        public int Autor { get; set; }
        public double Cena { get; set; }

        public Ksiazka(string tytul = "brak", int rokWydania = 0, int autor = 0, double cena = 0)
        {
            Tytul = tytul;
            RokWydania = rokWydania;
            Autor = autor;
            Cena = cena;
        }
    }
}
