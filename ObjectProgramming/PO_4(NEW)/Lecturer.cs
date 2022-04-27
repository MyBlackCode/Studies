using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L4_NEW_
{
    public  class Lecturer: Person
    {
        public string AcademicTitle { get; set; }
        public string Position { get; set; }

        public Lecturer(string firstName, string lastName, DateTime dateOfBrith, string academicTitle, string position) :
           base(firstName, lastName, dateOfBrith)
        {
            AcademicTitle = academicTitle;
            Position = position;
        }



        public override string ToString()
        {
            return $"Lectrurer| FirstName: {FirstName}, LastName: {LastName}, DateOfBrith: {DateOfBrith}, AcademicTitle: {AcademicTitle}, Position: {Position}\n";
        }
    }
}
