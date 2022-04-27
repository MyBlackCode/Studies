using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L4_NEW_
{
    public class Student: Person
    {
        //private int id ;
        public int Semester { get; set; }
        public int Group { get; set; }
        public int IndexId { get; set; }
        public string Specialization { get; set; }
        public double AverageGrades { get; }

        public Student(string firstName, string lastName, DateTime dateOfBrith, string specialization, int group, int semestr): 
            base(firstName,lastName,dateOfBrith) 
        {
            Semester = semestr;
            Group = group;
            Specialization = specialization;
        }

        public override string ToString()
        {
            return $"STUDENT| FirstName: {FirstName}, LastName: {LastName}, DateOfBrith: {DateOfBrith}, Specialization: {Specialization}, " +
                $"Group: {Group}, Semestr: {Semester}\n";
        }
    }
}
