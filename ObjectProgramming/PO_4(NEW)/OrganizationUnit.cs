using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L4_NEW_
{
    public class OrganizationUnit
    {
        //pola dostępowe
        public string Name { get; set; }
        public string Address { get; set; }
        public  IList<Lecturer> Lecturers { get; set; }
        
        // konstruktor pararmetryczny
        public OrganizationUnit(string name, string address, IList<Lecturer> lecturers)
        {
            Name = name;
            Address = address;
            Lecturers = new List<Lecturer>(lecturers);
        }

        //nadpisana metoda ToString
        public override string ToString()
        {
            string a = "";
            foreach(var item in Lecturers)
                a+=item.ToString();

            return $"OrganizationUnit| Name: {Name}, Address: {Address}, Lecturers: \n{a} \n";
        }


    }
}
