using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_2
{
    internal class Zad4i5Blog
    {
        private int _id = 0;
        private string _nazwa;
        private Zad4i5Autor _autor;
        private Zad4i5Artykul[] _artykuly;

        public string nazwa {get => _nazwa;}
        public Zad4i5Autor autor { get => _autor; }

        //      *pole nazwa nie może być puste
        //      *autor musi być podany
        public Zad4i5Blog( string nazwa, Zad4i5Autor autor)
        {
            if ((nazwa == null) || autor ==null)
            { 
                throw new Exception("Złe dane"); 
            }
            _nazwa = nazwa;
            _autor = autor;
            _artykuly = new Zad4i5Artykul[1000];
            _id++;
        }

        public void  dodajArtykul (Zad4i5Artykul artykul)
        {
            for (int i = 0; i < _artykuly.Length; i++)
            {
                if (_artykuly[i] == null)
                {
                    _artykuly[i] = new Zad4i5Artykul(artykul.Tytul, artykul.Tresc);
                    break;
                }
            }
        }

        public string[] pobierzTytulyAtykulow()
        {
            string[] t = new string[_artykuly.Length];
            for (int i = 0; i < t.Length; i++)
                t[i] = _artykuly[i].Tytul;
            return t;
        }

        public Zad4i5Artykul pobierzArtykul(string tytul)
        {
            foreach (var i in _artykuly)
                if (i.Tytul == tytul)
                    return i;

            return default;
        }

        public override string ToString()
        {
            var t = "";
            foreach (var i in _artykuly)
            {
                if (i == null)
                    break;
                t = t + i.ToString()+"\n\n\n";
            }
            return $"Blog {_id}: {_nazwa} {autor.ToString()} \n{t}";
        }
    }
}
