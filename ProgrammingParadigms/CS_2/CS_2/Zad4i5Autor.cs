using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

//2.4
namespace CS_2
{
    internal class Zad4i5Autor
    {
        private int _id=0;
        private string _imie;
        private string _nazwisko;
        private string _email;
        
        public string imie { get => _imie; }
        public string nazwisko { get => _nazwisko; }
        public string email { get => _email; }

        public Zad4i5Autor(string imie, string nazwisko, string email)
        {
            if((imie == null) || (nazwisko == null) || (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$")))
                throw new Exception("Złe dane");
            _imie = imie;
            _nazwisko = nazwisko;
            _email = email;
            _id++;
        }

        public override string ToString()
        {
            return $"Autor {_id}: {_imie}   {_nazwisko}";
        }
    }
}
