using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace CS_2
{
 //2.1; 2.2
    internal class Zad1i2Ksiazka
    {
        readonly string _ID;
        readonly Zad1i2Autor[] _Autorzy;
        readonly string _Tytul;
        readonly int _Rok;
        readonly string _Cena;

        public string ID { get => _ID; }
        public Zad1i2Autor[] Autorzy { get => _Autorzy; }
        public string Cena { get => _Cena; }
        public string Tytul { get => _Tytul; }
        public int Rok { get => _Rok; }

        public Zad1i2Ksiazka(string ID, Zad1i2Autor[] Autorzy, string Tytul, int Rok, string Cena)
        {
            if (!Regex.IsMatch(ID, @"^[A-Z]-[0-9]{2}-[0-9]{3}$")
            || Autorzy.Length == 0
            || Tytul.Length < 50
            || Rok < 2015 || Rok > DateTime.Now.Year)
                throw new Exception("Złe dane");
            this._ID = ID;
            this._Autorzy = Autorzy;
            this._Tytul = Tytul;
            this._Rok = Rok;
            this._Cena = Cena;
        }

        public override string ToString()
        {
            var i = "";
            foreach (var item in _Autorzy)
                i = item.ToString() + ", ";
            return $"Ksiazka: Id:{_ID}, Autorzy:{i}Tytul:{_Tytul}, Rok:{_Rok}, Cena:{_Cena}";
        }
    }
}
