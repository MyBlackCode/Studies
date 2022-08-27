using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CS_K
{
    public static class Z4
    {
        public static IEnumerable<int> WczytajLiczby()
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

        public static IEnumerable<string> ZamienWg(this IEnumerable<int> licznik, Expression<Func<int, string>> lambda)
        {
            var decompiled = lambda.Compile();
            return licznik.Select(decompiled);
        }
    }
}
