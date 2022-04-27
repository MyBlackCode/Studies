using System;
using System.Collections.Generic;

namespace kolokwium1_przyklad
{
    class Program
    {
        static void Main(string[] args)
        {
            Wagonik wagon1 = new Towarowy(34, "PKO", "wegiel");
            Console.WriteLine("\nWagon1");
            wagon1.WypiszInfo();
            Lokomotywa wagon2 = new Lokomotywa(12, "LKL", 165);
            Console.WriteLine("\nWagon2");
            wagon2.WypiszInfo();
            Console.WriteLine("\nWagon3");
            Wagonik wagon3 = new Osobowy(27, "OS", 5,1);
            wagon3.WypiszInfo();

            List <Lokomotywa> l_lokomotyw = new List<Lokomotywa>();
            l_lokomotyw.Add(wagon2);

            List <Wagonik> l_wagonikow = new List<Wagonik>();
            l_wagonikow.Add(wagon3);
            l_wagonikow.Add(wagon1);
            l_wagonikow.Add(wagon2);

            Sklad sklad1 = new Sklad(l_lokomotyw, l_wagonikow);
            Console.WriteLine("\nSklad1");
            sklad1.WypiszInfo();
            Console.WriteLine("\nMozeJechac:");
            Console.WriteLine($"{sklad1.MozeJechac()}");





        }
    }
}
