using System;
using System.Collections.Generic;

namespace test2
{
    public class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Wagon1");
            Cysterna wagon1 = new Cysterna(1000, 567, 800);
            wagon1.Wypisz();
            Console.WriteLine($"MasaCalkowita:{wagon1.MasaCalkowita()}");
            Console.WriteLine($"Pasazerow:{wagon1.Pasazerow()}");
            
            Console.WriteLine("\nWagon2");
            Wagon wagon2 = new Platforma(1120,723);
            wagon2.Wypisz();
            Console.WriteLine($"MasaCalkowita:{wagon2.MasaCalkowita()}");
            Console.WriteLine($"Pasazerow:{wagon2.Pasazerow()}");

            Console.WriteLine("\nWagon3");
            Wagon wagon3 = new Osobowy(890, 300);
            wagon3.Wypisz();
            Console.WriteLine($"MasaCalkowita:{wagon3.MasaCalkowita()}");
            Console.WriteLine($"Pasazerow:{wagon3.Pasazerow()}");
            
            List<Wagon> lista_wagonow = new List<Wagon>();
            lista_wagonow.Add(wagon1);
            lista_wagonow.Add(wagon2);
            lista_wagonow.Add(wagon3);
            MenadzerZarzadzaniaSkladem sklad = new MenadzerZarzadzaniaSkladem(lista_wagonow);
            sklad.Wypisz();
            Osobowy wagon4 = new Osobowy(890, 550);
            sklad.AddOsobowy(wagon4);
            sklad.Wypisz();
            sklad.DeleteWagonCysterna(wagon1);
            sklad.Wypisz();
        }
    }
}
