using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//2.1, 2.2
namespace CS_2
{
    public readonly struct Zad1i2Autor
    {
        public readonly string Imie;
        public readonly string Nazwisko;

        public Zad1i2Autor(string Imie, string Nazwisko)
        {
            this.Imie = Imie;
            this.Nazwisko = Nazwisko;
        }

        public override string ToString()
        {
            return $"{Imie} {Nazwisko}";
        }
    }
}
