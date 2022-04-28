using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test3
{
    internal class Zarzad
    {
        public IList<Lokal> Lokale { get; set; }

        public Zarzad(IList<Lokal> lokale)
        {
            Lokale= new List<Lokal>(lokale);
        }

        public void AddLokal(Lokal lokal)
        {
            Lokale.Add(lokal);
        }

        public void DeleteLokal(Lokal lokal)
        {
            Lokale.Remove(lokal);
        }

        public void Wypisz()
        {
            Console.WriteLine("Lista:");
            foreach(Lokal lokal in Lokale)
                lokal.Wypisz();
        }
    }
}
