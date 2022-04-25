using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L2
{
    public class Person
    {
        //zmienne klasy Person
        protected string _firstName;
        protected string _lastName;
        protected DateTime _dateOfBrith;

        //wlasnosci dostepowe pol
        public string FirstName { get { return _firstName; } set { _firstName = value; } }
        public string LastName { get { return _lastName; } set { _lastName = value; } }
        public DateTime DateOfBrith { get { return _dateOfBrith; } set { _dateOfBrith = value; } }

        //konstruktor domyslny
        public Person()
        { _firstName = "none";
          _lastName = "none";
          _dateOfBrith = new DateTime(2020, 03, 10);
        }

        //konstruktor parametryczny 
        public Person(string firstName, string lastName, DateTime dateOfBrith)
        {
            _firstName = firstName;
            _lastName = lastName;
            _dateOfBrith = dateOfBrith;
        }

        //metoda ToString()
        public override string ToString()
        {
            return $"Person| FirstName: {_firstName}, LastName {_lastName}, DateTime: {_dateOfBrith} \n";
        }

        //Details - ma wypisywać na ekranie konsoli wartości wszystkich pól klasy
        public void Details() { Console.WriteLine(this); }
    }
}
