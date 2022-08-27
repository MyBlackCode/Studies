using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_3_Example2
{
    internal class OperacjeNaLiscie
    {
        public static List<T> Filtr<T> (List<T> lista, Func<T,bool> warunek)
        {
            List<T> result = new List<T>();
            for(int i = 0; i < lista.Count; i++)
                if(warunek(lista[i]))
                    result.Add(lista[i]);   
            return result;
        }
    }
}
