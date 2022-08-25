using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_2
{
    internal class Zad4i5Komentarz
    {
        private string _tresc;
        private DateTime _data;
        private Zad4i5Komentarz[] _odpowiedzi;
        private string _nick;

        public string tresc { get => _tresc; }
        public DateTime data { get => _data; }
        public string nick { get => _nick; }

        public Zad4i5Komentarz(string tresc, string nick)
        {
            _tresc = tresc;
            _nick = nick;
            _data = DateTime.Now;
            _odpowiedzi = new Zad4i5Komentarz[1000];
        }

        public void dodajOdpowiedz (Zad4i5Komentarz odpowiedz)
        {
            for (int i = 0; i<1000; i++)
            {
                if (_odpowiedzi[i] == null)
                {
                    _odpowiedzi[i] = new Zad4i5Komentarz(odpowiedz._tresc, odpowiedz._nick);
                    break;
                }
            }
        }

        public Zad4i5Komentarz[] pobierzOdpowiedz()
        {
            return _odpowiedzi;
        }
        public string WypiszOdpowiedzi(Zad4i5Komentarz[] odpowiedzi)
        {
            var t ="";
            foreach (var i in odpowiedzi)
            {
                if (i == null)
                    break;
                t += $"{i._nick}\t{i._data}\n{i._tresc}" + "\n\n";
            }
            return t;
        }

        public override string ToString()
        {
            return $"{_nick}\t{_data}\n{_tresc}\n\n Odpowiedzi:{WypiszOdpowiedzi(_odpowiedzi)}";
        }
        
    }
}
