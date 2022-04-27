using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L4_NEW_
{
   public abstract class Person
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateOfBrith { get; set; }

        public Person(string firstName, string lastName, DateTime dateOfBrith)
        {
            FirstName = firstName;
            LastName = lastName;
            DateOfBrith = dateOfBrith;
        }

        public abstract string ToString();
    }
}
