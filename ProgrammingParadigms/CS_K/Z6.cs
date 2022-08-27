using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_K
{
    public static class Z6
    {
        public static IEnumerable<int> WczytajLiczby2()
        {
            while (true)
            {
                Console.WriteLine("Podaj liczbe:");
                if (!int.TryParse(Console.ReadLine(), out int a))
                {
                    yield break;
                }
                else yield return a;
            }
        }

        public static IEnumerable<int> Tylko(this IEnumerable<int> licznik, Func<int, bool> fun)
        {
            foreach (var i in licznik)
                if (fun(i))
                    yield return i;
        }
    }
}
