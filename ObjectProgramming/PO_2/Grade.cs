using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L2
{
    public class Grade
    {
        //zmienne klasy Grade
        private string _subjectName;
        private DateTime _date;
        private double _value;

        //pola dostepowe
        public string SubjectName { get { return _subjectName; } set { _subjectName = value; } }
        public DateTime Date { get { return _date; } set { _date = value; } }
        public double Value { get { return _value; } set { _value = value; } }

        //konstruktor domyslny
        public Grade()
        {
            _subjectName = "brak";
            _date = DateTime.Now;
            _value = 0;
        }

        //konstruktor parametryczny
        public Grade(string subjectName, double value, DateTime date) {
            _subjectName = subjectName;
            _date = date;
            _value = value;
        }

        //nadpisana metoda ToString
        public override string ToString()
        {
            return $"Grade| Subject name: {_subjectName}, Date: {_date}, Value: {_value}";
        }

        //metoda wypisująca na ekranie konsoli wartości wszystkich pól klasy
        public void Details() { Console.WriteLine(this); }
    }
}
