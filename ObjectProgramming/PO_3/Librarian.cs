using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L3
{
    public class Librarian: Person
    {
        //pola dostepowe
        public DateTime HireDate { get; set; }
        public decimal Salary { get; set; }

        //konstruktor domyślny
        public Librarian()
        {
            HireDate = DateTime.Now;
            Salary = 0;
        }

        //konstruktor parametryczny
        public Librarian(string firstName, string lastName, DateTime hireDate, decimal salary): base (firstName, lastName)
        { 
            HireDate = hireDate; 
            Salary = salary; 
        }

        //nadpisana metoda ToString
        public override string ToString()
        {
            return $"LIBRARIAN | FirstName: {FirstName}, LastName: {LastName}, HireDate: {HireDate}, Salary: {Salary}";
        }
    }
}
