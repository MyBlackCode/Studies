using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L3
{
    public class Person
    {
        //pola dostepowe
        public string FirstName { get; set; }
        public string LastName { get; set; }

        //konstruktor domyslny
        public Person() 
        {
            FirstName = "brak";
            LastName = "brak";        
        }

        //konstruktor parametryczny
        public Person(string firstName, string lastName)
        {
            FirstName = firstName;
            LastName = lastName;
        }

        //nadpisana metoda Tostring
        public override string ToString()
        {
            return $"PERSON | FirstName: {FirstName}, LastName: {LastName}";
        }

        //metoda wypisuje na ekranie konsoli wartości wszystkich pól klasy
        public void Details() { Console.WriteLine(this); }
    }
}
