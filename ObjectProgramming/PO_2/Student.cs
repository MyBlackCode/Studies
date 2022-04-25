using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L2
{
    public class Student : Person //klasa dziedziczy po klasie person
    {
        //zmienne klasy Student
        private int _year;
        private int _group;
        private int _indexId;
        private List<Grade> _grades = new List<Grade>(); //lista ocen studenta

        //pola dostepowe
        public int Year { get { return _year; } set { _year = value; } }
        public int Group { get { return _group; } set { _group = value; } }
        public int IndeXId { get { return _indexId; } set { _indexId = value; } }

        public List<Grade> Grades { get {return _grades;} }

        //konstuktor domyslny
        public Student()
        {
            _year = 0;
            _group = 0;
            _indexId = 0;
        }


        //konstruktor parametryczny
        public Student(string firstname, string lastname, DateTime dateOfBrith, int year, int group, int indexId)
            : base(firstname, lastname, dateOfBrith)
        {

            _year = year;
            _group = group;
            _indexId = indexId;
        }

        //nadpisana metoda to string
        public override string ToString()
        {
            this.DisplayGrades();
            return $"Student| FirstName: {_firstName}, LastName {_lastName}, DateTime: {_dateOfBrith}, Year: {_year}, " +
                  $"Group: {_group}, IndexId: {_indexId} \n";
        }

        //funkcje dodające ocene
        public void AddGrade (string subjectName, double value, DateTime date)
        {
            _grades.Add(new Grade(subjectName, value, date));

        }


        public void AddGrade(Grade grade)
        {
            _grades.Add(grade);
        }

        //funkcje wyświetlające oceny:
        public void DisplayGrades()
        {
            foreach (var element in this._grades)
            { Console.WriteLine($"{element}"); }
        }

        public void DisplayGrades( string subjectName)
        {
            foreach (var element in Grades)
            { Console.WriteLine($"{element}"); }
        }

        //funkcje usuwające ocene:
        public void DeleteGrade(string subjectName, double value, DateTime date)
        {
            var found = _grades.FirstOrDefault(i => i.SubjectName == subjectName
                        && i.Value == value && i.Date == date);
            if (_grades.Contains(found))
                _grades.Remove(found);
        }
        
        public void DeleteGrade(Grade grade)
        {
            _grades.Remove(grade);
        }

        public void DeleteGrades()
        {
            _grades.Clear();
        }

        //funkcja usuwająca oceny:
        public void DeleteGrades(string subjectName)
        {
            _grades.RemoveAll(i => i.SubjectName.Contains(subjectName));
        }
    }
}
