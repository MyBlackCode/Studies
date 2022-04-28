using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace test2
{
    public class MenadzerZarzadzaniaSkladem
    {
        private IList<Wagon> _wagony;
        public IList<Wagon> Wagony { get { return _wagony; } set { _wagony = value; } }

        public MenadzerZarzadzaniaSkladem(IList<Wagon> wagony)
        {
            _wagony = new List<Wagon>(wagony);
        }
        public void AddWagon(Wagon wagon)
        {
            _wagony.Add(wagon);
        }
        public void AddWagon(float masa, int miejsc)
        {
            _wagony.Add(new Osobowy(masa, miejsc));
        }

        public void AddWagon(float masa, float ladunek, float pojemnosc)
        {
            _wagony.Add(new Cysterna(masa, ladunek, pojemnosc));
        }

        public void AddWagon(float masa, float ladunek)
        {
            _wagony.Add(new Platforma(masa, ladunek));
        }

        public void DeleteWagon(Wagon wagon)
        {
            _wagony.Remove(wagon);
        }

        public void Wypisz()
        {
            Console.WriteLine("\nSklad:");
            foreach(var item in _wagony)
                item.Wypisz();
        }
    }
}
