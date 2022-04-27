using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kolokwium1_przyklad
{
    public abstract class Wagonik: IInfo
    {
        
        public float Masa;
        public string Nazwa;
        
        //pola dostepowe
        //public float Masa { get; set; }
        //public string Nazwa { get; set; }
        public Wagonik(float masa, string nazwa)
        {
            Masa = masa;
            Nazwa = nazwa;
        }



        //abstrakcyjne metody
        public abstract string Typ();
        public abstract void WypiszInfo();
    }
}
