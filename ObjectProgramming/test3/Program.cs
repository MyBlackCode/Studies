using System;
using System.Collections.Generic;

namespace test3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Lokal lokal1 = new Komercyjny("Brzoza 34", false, true);
            Console.WriteLine($"{lokal1.Wynajmowalne()}");
            lokal1.Wypisz();

            Mieszkalny lokal2 = new Mieszkalny("Kosciuszki 45", true, true, 14);
            Console.WriteLine($"{lokal2.Wynajmowalne()}");
            lokal2.Wypisz();

            Mieszkalny lokal3 = new Mieszkanie("Kosciuszki 45", true, true, 14,2);
            Console.WriteLine($"{lokal3.Wynajmowalne()}");
            lokal3.Wypisz();

            Mieszkalny lokal4 = new Dom("Kosciuszki 45", true, true, 14, 20);
            Console.WriteLine($"{lokal4.Wynajmowalne()}");
            lokal4.Wypisz();

            List <Lokal> l_lokali = new List<Lokal>();
            l_lokali.Add(lokal1);
            l_lokali.Add(lokal2);

            Zarzad lokale = new Zarzad (l_lokali);
            lokale.Wypisz();
            lokale.AddLokal (lokal3);
            lokale.AddLokal (lokal4);
            lokale.Wypisz ();
            lokale.DeleteLokal(lokal1);
            lokale.Wypisz();



        }
    }
}
