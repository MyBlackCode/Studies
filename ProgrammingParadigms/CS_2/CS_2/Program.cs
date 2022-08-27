
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace CS_2
{

    internal class Program
    {

        static void Main(string[] args)
        {
            //2.1 Napisz klasę niemutowalną, która będzie reprezentować książkę. Powinna
            //mieć następujące pola:
            //1. ID - identyfikator książki w formacie: B-00-001
            //2. Autorzy - kolekcja zawierająca imię i nazwisko autora ( musi być co najmniej jeden)
            //3. Tytuł ( do 50 znaków )
            //4. Rok publikacji - rok nie mniejszy niż 2015, i nie większy niż rok następujący
            //po obecnym
            //5. Cena książki - kwota i waluta
            //Zastanów się, jakie typy wartościowe zdefiniować. Jak zamodelować dodawanie autora,
            //skora klasa jest niemutowalna.
            Console.WriteLine("2.1");
            try
            {
                var k = new Zad1i2Ksiazka("B-10-001",
                    new Zad1i2Autor[] { new Zad1i2Autor("Imie", "Nazwisko") },
                    "123456789 123456789 123456789 123456789 1234567890",
                    2017, "12,21 zł");
                Console.WriteLine(k.ToString());

                // zmiana autora
                k = new Zad1i2Ksiazka(k.ID,
                    new Zad1i2Autor[] { new Zad1i2Autor("Imie2", "Nazwisko2") },
                    k.Tytul, k.Rok, k.Cena);
                Console.WriteLine(k.ToString());


                var k_err = new Zad1i2Ksiazka("B-10-001",
                new Zad1i2Autor[] { new Zad1i2Autor("Imie", "Nazwisko") },
                "123456789 123456789 123456789 123456789 1234567890",
                207, "12,21 zł");
                Console.WriteLine(k_err.ToString());
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            //2.2 Zapisz klasę Książka jako klasę tylko do odczytu. Właściwości  pojedynczych
            //wartości powinny być zamodelowane jako tylko do odczytu. Do zdefiniowania kolekcji
            //wykorzystaj interfejs IReadOnlyList.
            Console.WriteLine("\n2.2");
            //Zmian dokonano w zapisie klas Autor i Ksiazka
            Console.WriteLine("Zmian dokonano w zapisie klas Autor i Ksiazka");

            //2.3 Zapisz klasy z zadania 1 za pomocą rekordów.
            Console.WriteLine("\n2.3");
            try
            {
                Zad3Ksiazka k1 = new Zad3Ksiazka("B-10-001",
                        new Zad1i2Autor[] { new Zad1i2Autor("Imie", "Nazwisko") },
                        "Kot",
                        2017, "12,21 zł");
                Console.WriteLine(k1);

                Zad3Ksiazka k2 = new Zad3Ksiazka("B-1-001",
                        new Zad1i2Autor[] { new Zad1i2Autor("Imie", "Nazwisko") },
                        "Kot",
                        2017, "12,21 zł");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            //2.4 Zaimplementuj klasy zgodne ze schematem przedstawionym na rys. 2.1.
            Console.WriteLine("\n2.4");
            var autor = new Zad4i5Autor("Wojtek", "Nowak", "Wojtek_Nowak@gmail.com");
            var blog = new Zad4i5Blog("Swiat Wojtka", autor);
            var artykul = new Zad4i5Artykul("Poranna rosa", "bla bla bla bla, bla blaa, aaaaaa a aa a a\n" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");


            var komentarz = new Zad4i5Komentarz("Bardzo dobry artykuł. \nCzekam na więcej", "Ula");
            var komentarz2 = new Zad4i5Komentarz("Moim zdaniem autor od samego początku był stronniczy co sprawiło, że negatywnie odebrałem ten artykuł.", "Grzegorz");
            var komentarz3 = new Zad4i5Komentarz("Nie zauważyłam, żeby Autor był stronniczy. Może źle to odbierasz", "Ula");

            artykul.dodajKomentarz(komentarz);
            artykul.dodajKomentarz(komentarz2);
            komentarz2.dodajOdpowiedz(komentarz3);
            blog.dodajArtykul(artykul);
            Console.WriteLine($"{blog} {komentarz} \n {komentarz2}");

            //2.5 Proszę zmodyfikować poprzednie zadanie w taki sposób, aby utworzenie obiektów
            //niezgodnych z poniższymi wymaganiami było niemożliwe:
            //  1. Dla klasy Autor:
            //      *pola imie, nazwisko, email są wymagane
            //      *pole email powinno zawierać poprawny adres (pod względem składniowym)
            //  2. Dla klasy Blog:
            //      *pole nazwa nie może być puste
            //      *autor musi być podany
            //  3. Dla klasy Artykul:
            //      *pole tytuł nie może być puste
            //      * w momencie tworzenia data powinna być ustalona na aktualną
            // Jakie są możliwości rozwiązania tego zadania
            Console.WriteLine("\n2.5");
            try
            {
                //var zlyAutor = new Zad4Autor("paula", "mly", "paulamlyn");
                //var zlyBlog = new Zad4Blog("ro", null);
                var zlyTytul = new Zad4i5Artykul(null, "cos");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            //2.6 Napisz program, który będzie pozwalał przechowywać następujące informacje 
            //o osobie: imie, nazwisko, wiek. Przygotuj odpowiedni typ danych. Napisz program,
            //który będzie pozwalał na wprowadzenie informacji o osobie, modyfikowanie ich oraz
            //wyświetlenie. Po uruchomieniu programu użytkownik powinien zobaczyć menu:
            //WYBIERZ OPCJE
            //1 - utworzenie rekordu
            //2 - modyfikacja rekordu
            //3 - pokaz rekord
            //4 - zakończenie programu
            //Po wybraniu odpowiedniej opcji użytkownik powinien mieć możliwość wprowadzenia danych
            //(program powinien wyświetlać informacje o jakie dane prosi użytkownika), lub ich zobaczenia.
            //Podczas modyfikowania danych jeżeli użytkownik wprowadzi łańcuch pusty ( w przypadku imienia
            //lub nazwiska ) lub 0 ( w przypadku wieku ) program powinien  zachowyać  wcześniejsze dane. 
            //Po zakończeniu wprowadzania lub przeglądania danych oraz w przypadku, gdy użytkownik
            //wybierze inną opcję niż od 1 do 4 program powinien wracać do menu głównego.
            Console.WriteLine("\n2.6");
            Zad6Osoba osoba = null;
            while (true)
            {   //Console.Clear();
                Console.WriteLine("WYBIERZ OPCJE");
                Console.WriteLine("1 - utworzenie rekordu");
                Console.WriteLine("2 - modyfikowanie rekordu");
                Console.WriteLine("3 - pokaz rekord");
                Console.WriteLine("4 - zakoncz program");
                int i = Int32.Parse(Console.ReadLine());

                switch (i)
                {
                    case 1:
                        Console.WriteLine("Podaj imie:");
                        var imie = Console.ReadLine();
                        Console.WriteLine("Podaj nazwisko:");
                        var nazwisko = Console.ReadLine();
                        Console.WriteLine("Podaj wiek:");
                        int wiek = Int32.Parse(Console.ReadLine());
                        osoba = new Zad6Osoba(imie, nazwisko, wiek);
                        break;
                    case 2:
                        Console.WriteLine("Podaj nowe imie:");
                        var imie2 = Console.ReadLine();
                        Console.WriteLine("Podaj nazwisko:");
                        var nazwisko2 = Console.ReadLine();
                        Console.WriteLine("Podaj wiek:");
                        int wiek2 = Int32.Parse(Console.ReadLine());
                        if((imie2 != null) && (nazwisko2 != null) && (wiek2 !=0 ))
                            osoba = new Zad6Osoba(imie2, nazwisko2, wiek2);
                        break;
                    case 3:
                        Console.WriteLine($"{osoba.ToString()}");
                        Console.ReadKey();
                        break;
                    case 4:
                        Console.WriteLine($"Exit");
                        Environment.Exit(0);
                        break;
                    default:
                        Console.WriteLine($"Bledny parametr");
                        Console.ReadKey();
                        break;
                }
            }
        }
           
    }
}
