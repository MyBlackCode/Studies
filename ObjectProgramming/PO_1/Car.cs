using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L1_Z1
{
    public class Car
    {
        //zmienne klasy Car
        private string _brand, _model;
        private int _doorCount;
        private float _engineVolume; 
        private double _avgConsump;
        private string _registrationNumber;
        private static int _carCount = 0; //pole tak oznaczone jest częścią stanu klasy, nie jej obiektów. Można się do niego odwołać
        //stosując konstrukcję „nazwaKlasy.nazwaPola” bez konieczności tworzenia obiektu danej klasy

        //Statyczna wlasciwosc
        // public static int CarCount => _carCount;


        // wlasciwosci dostepowe pol:
        public string Brand { get { return _brand; } set { _brand = value; } }
        public string Model { get { return _model; } set { _model = value; } }
        public int DoorCount { get { return  _doorCount; } set { _doorCount = value; } }
        public float EngineVolume { get { return _engineVolume; } set { _engineVolume = value; } }
        public double AvgConsump { get { return _avgConsump; } set { _avgConsump = value; } }
        public string RegistrationNumber { get { return _registrationNumber; } set { _registrationNumber = value;} }
       

        //konstruktor domyslny
        public Car()
        {
            _brand = "none";
            _model = "none";
            _doorCount = 0;
            _engineVolume = 0F;
            _avgConsump = 0D;
            _registrationNumber = "none";
            _carCount++;
        }

        //konstruktor parametryczny
        public Car(string marka, string modell, int liczbaDrzwi, float pojemnoscSilnika, double SredniaSpalania, string registrationNumber)
        {
            _brand = marka;
            _model = modell;
            _doorCount = liczbaDrzwi;
            _engineVolume = pojemnoscSilnika;
            _avgConsump = SredniaSpalania;
            _registrationNumber = registrationNumber;
            _carCount++;
        }

        //metoda oblicza spalanie samochodu na podstawie podanej wartości długości trasy i wartości pola
        public double CalculateConsump(double roadLength) { return _avgConsump * roadLength / 100.00; }

        //metoda oblicza koszt przejazdu na trasie o podanej długości, zakładając podaną cenę paliwa za litr
        public double CalculateCost(double petrolCost, double roadLength) { return CalculateConsump(roadLength) * petrolCost; }

        //nadpisana metoda ToString
        public override string ToString() { return $"Car | Brand: {_brand}, Model: {_model}, NumOfDoors: {_doorCount}, " +
         $"EngineVol: {_engineVolume}, AvgConsump: {_avgConsump}, RegistrationNumber: {_registrationNumber}"; }
        
        //metoda wypisuje na ekranie konsoli wartości wszystkich pól klasy „Car”.
        public void Details() {
            Console.WriteLine(this.ToString()); //używa referencji „this” a przez to nie jawnie korzysta z wcześniej napisanej metody „ToString”
        }

        //metoda umożliwia wypisanie na ekran konsoli informacji o liczbie utworzonych obiektów
        public static void DisplayCarCount() { Console.WriteLine(_carCount); }
    }
}
