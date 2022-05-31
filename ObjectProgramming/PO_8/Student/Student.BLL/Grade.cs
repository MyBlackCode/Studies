using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Student.BLL
{
    public class Grade
    {
        public string SubjectName { get; set; }
        public string Date { get; set; }
        public string Value { get; set; }

       public  Grade(string subjectName, string date, string value)
        {
            SubjectName = subjectName;
            Date = date;
            Value = value;
        }
       public Grade()
        {
            SubjectName = "brak";
            Date = DateTime.Now.ToString();
            Value = "3.00";
        }

    }
}
