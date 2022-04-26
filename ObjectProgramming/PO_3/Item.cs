using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L3
{
    public abstract class Item
    {   //zmienne
        protected int _id;
        protected string _title;
        protected string _publisher;
        protected DateTime _dateOfIssue;

        //pola dostępowe
        public int Id { get { return _id; } set { _id = value; } }
        public string Title { get { return _title; }  set { _title = value;  } }
        public string Publisher { get { return _publisher; } set { _publisher = value; } }
        public DateTime DateOfIssue { get { return _dateOfIssue; } set { _dateOfIssue = value; } }

        //konstruktor domyślny
        public Item() { 
            _id = 0;
            _title = "brak";
            _publisher = "brak";
            _dateOfIssue = new DateTime(2022, 03, 17);
        }

        //konstruktor parametryczny
        public Item(string title, int id, string publisher, DateTime dateOffIssue)
        {
            
            _title = title;
            _id = id;
            _publisher = publisher;
            _dateOfIssue = new DateTime();
            _dateOfIssue = dateOffIssue;
        }

        //nadpisana metoda ToString
        public override string ToString()
        {
            return $"Item| Id:{_id} Title:{_title} Publisher:{_publisher} DateOffIssue: {_dateOfIssue}";
        }

        //metoda wypisuje na ekranie konsoli wartości wszystkich pól klasy
        public void Details() { Console.WriteLine(this); }

        public abstract string GenerateBarCode();

    }
}
