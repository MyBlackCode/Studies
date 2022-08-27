using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_3_Example1
{
    internal class OperacjeNaLiscie
    {
        public static List<T> Filtruj<T>(List<T> lista, IWarunek<T> warunek)
        {
            List<T> rezultat = new List<T>();
            for (int i = 0; i < lista.Count; i++)
                if (warunek.Sprawdz(lista[i])) 
                    rezultat.Add(lista[i]);
            return rezultat;
        }
    }
}
