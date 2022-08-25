using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
//2.3
namespace CS_2
{
    public record Zad3Ksiazka
    {
        public Zad3Ksiazka (string id, Zad1i2Autor[] autorzy, string tytul, int rok, string cena) => 
            (Id,Autorzy,Tytul,Rok,Cena) = (id,autorzy,tytul,rok,cena);
        string _id;
        public string Id { get =>_id; init
            {
                if (!Regex.IsMatch(value, @"^[A-Z]-[0-9]{2}-[0-9]{3}$"))
                    throw new Exception("Złe dane");
                _id = value;
            } 
        }

        Zad1i2Autor[] _autorzy;
        public Zad1i2Autor[] Autorzy { get => _autorzy; init 
            { 
                if (value.Length == 0)
                    throw new Exception("Złe dane");
                    _autorzy = value;
            } 
        }

        string _tytul;
        public string Tytul { get => _tytul; init
            {
                if (value.Length > 50)
                    throw new Exception("Złe dane");
                _tytul= value;
            }
        }
        
        int _rok;
        public int Rok { get => _rok; init
            {
                if(value < 2015 || value > DateTime.Now.Year)
                     throw new Exception("Złe dane");
                _rok = value;
            }
        }
        public string Cena { get; init; }

    }
}
