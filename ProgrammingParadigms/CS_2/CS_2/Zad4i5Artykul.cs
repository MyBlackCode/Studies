using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_2
{
    internal class Zad4i5Artykul
    {
        private int _id=0;
        private string _tytul;
        private string _tresc;
        private DateTime _dataUtworzenia;
        private Zad4i5Komentarz[] _komentarze;

        public string Tytul { get => _tytul;}
        public string Tresc { get => _tresc;}

        public Zad4i5Artykul(string tytul, string tresc)
        {
            if (tytul == null)
                throw new Exception("Zle dane");
            _tytul = tytul;
            _tresc = tresc;
            _dataUtworzenia = DateTime.Now;
            _komentarze = new Zad4i5Komentarz[1000];
            _id++;
        }

        public void dodajKomentarz(Zad4i5Komentarz komentarz)
        {
            for (int i = 0; i < _komentarze.Length; i++)
            {
                if (_komentarze[i] == null)
                {
                    _komentarze[i] = new Zad4i5Komentarz(komentarz.tresc, komentarz.nick);
                    break;
                }
            }
        }

        public Zad4i5Komentarz[] pobierzKomentarze()
        { 
            return _komentarze; 
        }

        public override string ToString()
        {
            var i = "";
            foreach (var item in _komentarze)
            {
                if (item == null)
                    break;
                i += item.ToString() + "\n\n";
            }

            return $"Arykuł {_id}: {_tytul} {_dataUtworzenia} \n\t{_tresc}\n\nKomentarze:\n{i}" ;
        }
    }
}
