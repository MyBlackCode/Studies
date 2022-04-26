using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions; // potrzebne do funkcji wyszukującej

namespace CS_L3
{
    public class Library
    {
        //pola dostepowe
        public string Address { get; set; }
        public IList<Librarian> Librarians { get; set; }
        public IList<Catalog> Catalogs { get; set; }

        //konstruktor parametryczny
        public Library(string address, IList<Librarian> librarians, IList<Catalog> catalogs)
        {
            Address = address;
            Librarians = new List<Librarian>(librarians);
            Catalogs = new List<Catalog>(catalogs);
        }

        //dodawnie czytelnika
        public void AddLibrarian(Librarian librarian)
        {
            Librarians.Add(librarian);
        }

        //wyswietla wszystkich czytelnikow
        public void ShowAllLibrarians()
        {
            foreach (Librarian i in Librarians)
                Console.WriteLine(i); ;
        }

        //dodawanie katalogu
        public void AddCatalog(Catalog catalog)
        {
            Catalogs.Add(catalog);
        }

        //dodawanie
        public void AddItem(Item item, string thematicDepartment) 
        {
            foreach (var i in Catalogs)
                if (i.ThematicDepartment == thematicDepartment)
                    i.Items.Add(item);
        }

        //wyswietla wszystkie katalogi
        public void ShowAllItems()
        {
            foreach (var i  in Catalogs)
                i.ShowAllItems();
        }

        //funkcje do wyszukiwania w katalogach
        public Item FindItemBy(int id)
        {
            foreach (var i in Catalogs)
                foreach (var j in i.Items)
                    if (j.Id == id)
                        return j;

            return default;//tworzy wartość domyślną typu
        }

        public Item FindItemBy(string title)
        {
            foreach (var i in Catalogs)
                foreach (var j in i.Items)
                    if (j.Title == title)
                        return j;

            return default;//tworzy wartość domyślną typu
        }

        public Item FindItem(Expression<Func<Item,bool>> predicate)
        {
            foreach(var i in Catalogs)
                foreach(var j in i.Items)
                    if(predicate.Compile()(j))
                        return j;

            return default;//tworzy wartość domyślną typu
        }

        //nadpisana metoda ToString

        public override string ToString()
        {
            string a = "";
            foreach (var i in Catalogs)
                a += i.ToString();
            foreach (var j in Librarians)
                a += j.ToString();

            return $"LIBRARY | Address: {Address}, {a}";
        }
    }
}
