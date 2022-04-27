using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L4_NEW_
{
    public class Department
    {
        public string Name { get; set; }
        public Person Dean { get; set; }
        public IList<OrganizationUnit> Organizations { get; set; }

        public IList<Subject> Subjects { get; set; }
        public IList<Student> Students { get; set; }

        public Department(string name, Person dean, IList<Subject> subjects, IList<Student> students)
        {
            Name = name;
            Dean = dean;
            Subjects = new List <Subject>(subjects);
            Students = new List<Student>(students);
        }

        public override string ToString()
        {
            string a = "";
            foreach(var item in Subjects)
                a+=item.ToString();

            string b = "";
            foreach(var item in Students)
                b+=item.ToString();

            return $"Department| Name: {Name}, Dean: {Dean}, Subject: \n{a}Sudents: \n{b}\n";
        }


    }
}
