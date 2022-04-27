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

        public void AddOsobowy(Osobowy osobowy)
        {
            _wagony.Add(osobowy);
        }

        public void AddCysterna(Cysterna cysterna)
        {
            _wagony.Add(cysterna);

        }

        public void AddPlatforma (Platforma platforma)
        {
            _wagony.Add(platforma);
        }

        public void DeleteWagonOsobowy(Osobowy osobowy)
        {
            _wagony.Remove(osobowy);
        }

        public void DeleteWagonCysterna(Cysterna cysterna)
        {
            _wagony.Remove(cysterna);

        }

        public void DeleteWagonPlatforma(Platforma platforma)
        {
            _wagony.Remove(platforma);
        }

        public void Wypisz()
        {
            Console.WriteLine("\nSklad:");
            foreach(var item in _wagony)
                item.Wypisz();
        }
    }
}
