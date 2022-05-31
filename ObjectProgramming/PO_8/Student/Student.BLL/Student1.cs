using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Text;


namespace Student.BLL
{
    public class Student1
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Faculty { get; set; }
        public int Id { get; set; }
        public List<Grade> Grades { get; set; }

        public Student1(string firstName ="brak", string lastName = "brak" , string faculty = "brak", int id =0 )
        {
            FirstName = firstName;
            LastName = lastName;
            Faculty = faculty;
            Id = id;
            Grades = new List<Grade>();
        }

    }
}
