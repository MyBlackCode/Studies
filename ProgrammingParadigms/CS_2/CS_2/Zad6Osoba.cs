using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_2
{
    //o osobie: imie, nazwisko, wiek. Przygotuj odpowiedni typ danych. Napisz program,
    //który będzie pozwalał na wprowadzenie informacji o osobie, modyfikowanie ich oraz
    //wyświetlenie. Po uruchomieniu programu użytkownik powinien zobaczyć menu:
    internal class Zad6Osoba
    {
        private string _imie;
        private string _nazwisko;
        private int _wiek;

        public string Imie { get => _imie; } 
        public string Nazwisko { get => _nazwisko; }
        public int Wiek { get => _wiek; }

        public Zad6Osoba (string imie, string nazwisko, int wiek)
        {
            _imie = imie;
            _nazwisko = nazwisko;
            _wiek = wiek;
        }
        public override string ToString()
        {
            return $"Imie: {_imie}, Nazwisko: {_nazwisko}, Wiek: {_wiek}";
        }
    }
}
