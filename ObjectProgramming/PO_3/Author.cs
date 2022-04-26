using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L3
{
    public class Author: Person
    {
        //pola dostępowe
        public string Nationality { get; set; }

        //konstruktor domyślny
        public Author()
        {
            Nationality = "brak";
        }
        //konstruktor parametryczny
        public Author(string firstName, string lastName, string nationality) : base(firstName, lastName)
        {
            Nationality = nationality;
        }

        //nadpisana metoda ToString
        public override string ToString()
        {
            return $"AUTHOR | FirstName: {FirstName}, LastName: {LastName}, Nationality: {Nationality}";
        }


    }
}
