using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L4_NEW_
{
    public class Subject
    {
        public string Name { get; set; }
        public string Specialization { get; set; }
        public int Semestr { get; set; }
        public int HoursCount { get; set; }

        public Subject(string name, string specjalization, int semestr, int hoursCount)
        {
            Name = name;
            Specialization = specjalization;
            Semestr = semestr;
            HoursCount = hoursCount;
        }

        public override string ToString()
        {
            return $"Subject| Name: {Name}, Specialization: {Specialization}, Semest: {Semestr}, HourCount: {HoursCount}\n";
        }

    }
}
