
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace CS_K
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //1.Napisz funkcję obliczjącą wartość silni w taki sposób, aby możliwe wywołanie jej w nasepujący sposób
            //100.Silnia()
            Console.WriteLine("1");
            // funkcja w Z1.cs =>
            Console.WriteLine($"{5.Silnia()}");

            //2.Napisz funkcję Curry, która przyjmie jako parametr funkcję o trzech parametrach oraz o dowolnym typie
            //zwracanym. Funkcja  powinna zamieniać ją na ciąg  wywołań funkcji jednoparametrowych.
            Console.WriteLine("\n2");
            static bool TylkoNaLitere(char znak, string wyraz) => wyraz[0] == znak;
            var curried1 = Z2.Curry<char, string, bool>(TylkoNaLitere);
            Func<char, string, bool> funkcja = TylkoNaLitere;
            var curried = Z2.Curry(funkcja);

            //3.Stwórz klasę Motocykl zawierającą pola Marka, Model, PojemnoscSilnika i RokProdukcji.
            //Zaimplementuj w niej interfejs IComparable, który pozwoli sortować instancje tej klasy wg.
            //właściwości RokProdukcji. Jeżeli ten będzie taki sam, to wg. właściwości PojemnośćSilnika.
            //SortedList<Temperature, string> temps =
            //new SortedList<Temperature, string>();
            Console.WriteLine("\n3");
            SortedList<Motocykl, string> motocykle = new SortedList<Motocykl, string>();
            motocykle.Add(new Motocykl("model1", "marka2", 2000, 2020), "1");
            motocykle.Add(new Motocykl("model1", "marka2", 2000, 2019), "2");
            motocykle.Add(new Motocykl("model1", "marka2", 1900, 2020), "3");

            foreach (var i in motocykle)
                Console.WriteLine(i);

            //####################################    LENIWE KOLEKCJE    ####################################

            //4.Napisz funkcję wczytującą od użytkownika kolejne liczby całkowite i zwracała je w formie leniwej kolekcji.
            //Następnie napisz funkcję, która pozwoli na dowolne przekształcenie każdej z tych liczb. Sposób przekształcenia
            //przekaż jako parametr funkcji. Przykładowo:
            //WczytajLiczby().ZamienWg(x => x.ToString()).
            //W funkcji main zademnostruj działanie tego kodu.
            Console.WriteLine("\n4");
            // klasy Punkty3D i Z4 =>
            var a = Z4.WczytajLiczby().ZamienWg(x => x.ToString());
            var b = a;
            Console.WriteLine($"Przeksztalcona lista:");
            b.ToList().ForEach(Console.WriteLine);

            //5.Napisz funkcję generującą leniwą kolekcję losowych punktów w przestrzeni trójwymiarowej.
            //Funkcja powinna być napisana w taki sposób, aby możliwe było następujące wywołanie:
            //var kolekcja = 100.LosowychPunktow2D()
            //gdzie liczba określa ilość punktów koniecznych do wygenerowania
            Console.WriteLine("\n5");
            //klasy  Punkty#D i Z5
            var kolekcja = 100.LosowychPunktow2D().ToList();
            kolekcja.ForEach(Console.WriteLine);

            //6.Napisz funkcję wczytującą od użytkownika kolejne liczby całkowite i zwracała je w formie leniwej kolekcji.
            //Następnie napisz funkcję, która pozwoli na przekazanie tylko takich wartości, które będą spełniały określony warunek.
            //Warunek przekaż jako parametr funkcji. Przykładowo:
            //WczytajLiczby().Tylko(x => x > 0).
            //W funkcji main zademonstruj działanie tego kodu
            Console.WriteLine("\n6");
            var c = Z6.WczytajLiczby2().Tylko(x => x > 0);
            var d = c;
            Console.WriteLine($"Zwrocona lista:");
            d.ToList().ForEach(Console.WriteLine);

            //7.Napisz funkcję generującą leniwą kolekcję punktów w przestrzeni trójwymiarowej. 
            //Każda składowa powinna być losową liczbą całkowitą z przedziału -20 do 20. 
            //Punkty możesz reprezentować w dowolny sposób np. jako tablicę lub obiekty klasy Tuple.
            //Następnie napisz funkcję, która pozwoli przerwać generowanie tych wartości, gdy pojawi
            //się punkt, którego trzecia składowa będzie ujemna oraz funkcję zwracającą punkt, którego
            //poszczególne składowe będą sumą składowych wygenerowanych punktów. Zademonstruj ich działanie.
            Console.WriteLine("\n7");
            //klasy  Punkty#D i Z7
            Console.WriteLine("Lista:");
            var kolekcja3D = 4.LosujPunkty3D().ToList();
            kolekcja3D.ForEach(Console.WriteLine);
            Console.WriteLine("\nLista z przerwaniem:");
            var kolekcja3DZPrzerwaniem = 4.LosujPunkty3D().ToList();
            kolekcja3DZPrzerwaniem.ForEach(Console.WriteLine);


            //####################################    DRZEWO    ####################################

            //Zdefiniuj w C# klasę reprezentującą drzewo binarne. Następnie napisz metodę, która policzy
            //która policzy, ile węzłów (wartości w nich przechowywanych) spełnia warunek określony w funkcji
            //przekazanej jako parametr. Zademonstruj działanie swojego kodu.
            Console.WriteLine("\n8");

            //Zdefiniuj w C# klasę reprezentującą drzewo binarne. Następnie napisz metodę, która policzy
            //która policzy sumę  wartości przechowywanych  w węłąch, spełniających warunek określony w funkcji
            //przekazanej jako parametr. Zademonstruj działanie swojego kodu.
            Console.WriteLine("\n9");

            //Zdefiniuj w C# klasę reprezentującą drzewo binarne. 
            //Następnie napisz metodę, która policzy która policzy, ile węzłów (wartości w nich przechowywanych) 
            //spełnia warunek określony w funkcji przekazanej jako parametr. Zademonstruj działanie swojego kodu.
            //class BTNode
            //{
            //    BTNode* up;
            //    BTNode* left;
            //    BTNode* right;
            //    typ_danych data;
            //}
            Console.WriteLine("\n10");
            //####################################    LINQ    ####################################

            //Napisz zapytanie LINQ, które dla tablicy dowolnych wyrazów, określi ile było wyrazów zaczynających się
            //na każdą z liter.
            Console.WriteLine("\n11");
            //Napisz zapytanie LINQ, które dla dowolnej policzalnej kolekcji punktów dwuwymiarowych określi ile
            //punktów znajduje się w poszczególnych ćwiartkach układu współrzędnych.Wyniki wyświetl w kolejności
            //określonej numerem ćwiartki malejąco. Punkty mogą być reprezentowane w dowolny sposób
            Console.WriteLine("\n12");
            //Napisz zapytanie LINQ, które dla dwóch tablic wyrazów określi ile razy w obu tablicach ten sam wyraz
            //występił w tej samej pozycji. Np. dla kolekcji: ("Ala","Ela,"Tomek"), ("Ala","Marek","Tomek") 
            //funkcja powinna zwracać wartość 2.
            Console.WriteLine("\n13");


            //Stwórz klasy na podstawie przykładów:
            //var ksiazki = new[] {
            //    new Ksiazka {Tytul = "Pan Tadeusz", RokWydania = 1998, Gatunek = 1, Cena = 30},
            //    new Ksiazka {Tytul = "Potop", RokWydania = 1991, Gatunek = 1, Cena = 40},
            //    new Ksiazka {Tytul = "W pustyni i w puszczy", RokWydania = 1990, Gatunek = 2, Cena = 30},
            //    new Ksiazka {Tytul = "Lalka", RokWydania = 1990, Gatunek = 1, Cena = 50},
            //    new Ksiazka {Tytul = "Programowanie funkcyjne w języku C#", RokWydania = 2019, Gatunek = 3, Cena = 71.20},
            //    new Ksiazka {Tytul = "Programowanie funkcyjne z JavaScriptem", RokWydania = 2017, Gatunek = 3, Cena = 29.40},
            //    };

            //var gatunki = new[] {
            //    new Gatunek { id = 1, Nazwa = "Literatura piękna" },
            //    new Gatunek { id = 2, Nazwa = "Przygodowa" },
            //    new Gatunek { id = 3, Nazwa = "Programowanie" },
            //    new Gatunek { id = 4, Nazwa = "Projektowanie stron WWW" }
            //    };

            //Napisz zapytanie Linq, które dla każdego gatunku określi cenę najdroższej książki, która do niego należy. 
            //Jeżeli nie ma książek w danym gatunku zapytanie powinno zwrócić 0.
            Console.WriteLine("\n14");


            //Stwórz klasy na podstawie przykładów:
            Console.WriteLine("");
            var ksiazki = new[] {
            new Ksiazka {Tytul = "Pan Tadeusz", RokWydania = 1998, Autor = 1, Cena = 30},
            new Ksiazka {Tytul = "Potop", RokWydania = 1991, Autor = 2, Cena = 40},
            new Ksiazka {Tytul = "W pustyni i w puszczy", RokWydania = 1990, Autor = 2, Cena = 30},
            new Ksiazka {Tytul = "Lalka", RokWydania = 1990, Autor = 3, Cena = 50},
            new Ksiazka {Tytul = "Programowanie funkcyjne w języku C#", RokWydania = 2019, Autor = 4, Cena = 71.20},
            new Ksiazka {Tytul = "Programowanie funkcyjne z JavaScriptem", RokWydania = 2017, Autor = 5, Cena = 29.40},
            };

            var autorzy = new[] {
            new Autor { id = 1, Imie = "Adam", Nazwisko = "Mickiewicz" },
            new Autor { id = 2, Imie = "Henryk", Nazwisko = "Sienkiewicz" },
            new Autor { id = 3, Imie = "Bolesław", Nazwisko = "Prus" },
            new Autor { id = 4, Imie = "Enrico", Nazwisko = "Buonanno" },
            new Autor { id = 5, Imie = "Luis", Nazwisko = "Atencio" },
            new Autor { id = 6, Imie = "Robert C.", Nazwisko = "Martin" },
            };
            //Napisz zapytanie Linq, które dla autora określi cenę najtańszej książki, którą napisał.
            //Jeżeli autor nie napisał książek zapytanie powinno zwrócić 0.
            Console.WriteLine("\n15");
            var zlaczenie = (from Autor in autorzy
                             join Ksiazka in ksiazki on Autor.id equals Ksiazka.Autor
                             select new
                             {
                                 id = Autor.id,
                                 imie = Autor.Imie,
                                 nazwisko = Autor.Nazwisko,
                                 cena = Ksiazka.Cena
                             }).GroupBy(x => x.id,
                                                   y => y.cena,
                                                    (ID, NajtanszaKsiazka) => new
                                                    {
                                                        Id = ID,
                                                        Najtansza = NajtanszaKsiazka.Min()
                                                    });

            var zapytanie = ksiazki.GroupBy(x => x.Autor,
                                            x => x.Cena,
                                            (id, najmniejszaWartosc) => new
                                            {
                                                Id = id,
                                                Min = najmniejszaWartosc.Min()
                                            });

            foreach (var x in zlaczenie)
            {
                Console.WriteLine(x);
            }
            
        }
    }
}
