using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L1_Z1
{
    public class Garage
    {
        //zmienne klasy Garage
        private string _address;
        private int _capacity; //pojemnosc
        private int _carsCount = 0;
        private Car[] _cars;

        //pola dostepowe
        public string Address { get { return _address; } set { _address = value; } }
        public int Capacity
        {
            get { return _capacity; }
            set
            {
                _capacity = value;
                _cars = new Car[value];
            }
        }

        //konstruktor domyslny
        public Garage()
        {
            _address = "none";
            _capacity = 0;
            _cars = null;
        }

        //konstruktor parametryczny
        public Garage(string address, int capacity)
        {
            _address = address;
            _capacity = capacity;
            _cars = new Car[capacity];
        }

        // funkcja wypisz jesli garaz jest pelny w przeciwnym razie dodaj auto
        public void CarIn(Car auto)
        {
            if (_carsCount == _capacity)
            { Console.WriteLine("Garaz jest pelny \n"); }
            
                for (int i = 0; i < this._capacity; ++i)
                {
                    if (_cars[i] == null)
                    {
                        _cars[i] = auto;
                        _carsCount++;
                         break;
    
                    }
                }
            
        }

        //funkcja sprawdza czy garaz pusty w przeciwnym wypisz ostatni wprowadzany samochod
        public Car CarOut() 
        { 
            if(_carsCount==0)
            { Console.WriteLine("Garaz pusty \n");
          
            }
            else
            {
                for(int i = _carsCount -1; i >= 0; i--) 
                {
                    if(this._cars[i] != null)
                    {
                        Car sam = new Car ();
                        sam = _cars[i];
                        _cars[i] = null;
                        _carsCount--;
                        return sam;
                    }
                }
            }
            return null;
       
        }

        //nadpisana metoda ToString
        public override string ToString() 
        {
            string samochody="";
           
                foreach (Car element in _cars)
                {
                   samochody += $"\n{ element}";
                };

            return $"Garage | adres: {_address},count :{_carsCount}, capacity: {_capacity} Cars: {samochody} \n ";
        }

        //metoda wypisuje na ekranie konsoli wartości wszystkich pól klasy „Garage”.
        public void Details() { Console.WriteLine(this); }



    }
}
