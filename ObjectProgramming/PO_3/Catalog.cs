using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions; // dodane ze wzgledu na Expression

namespace CS_L3
{
    public class  Catalog : IItemManagement
    {
        //metody dostepowa
       public IList<Item> Items { get; set; }
       public string ThematicDepartment { get; set; }
        
        //konstruktor domyślny
        public Catalog (IList<Item> items )
        { 
            Items = new List<Item> (items);
            ThematicDepartment = "brak";
        }

        //konstruktor parametryczny
        public Catalog (string thematicDepartament, IList<Item> items) 
        { 
            ThematicDepartment = thematicDepartament;
            Items = new List<Item>(items);
        }

        //dodaje obiekt do listy
        public void AddItem(Item item)
        {
            Items.Add (item);
        }

        //funkcja dziedziczy po interface IItemManagemet
        public Item FindItemBy(int id)
        {
            foreach (Item i in Items)
                if (i.Id == id)
                    return i;
            return default;//tworzy wartość domyślną typu
        }
        public Item FindItemBy(string title)
        {
            foreach (Item i in Items)
                if (i.Title == title)
                    return i;
            return default;//tworzy wartość domyślną typu
        }
        public Item FindItem(Expression<Func<Item, bool>> predicate)
        {
            foreach (Item i in Items)
                if (predicate.Compile()(i))
                    return i;
            return default;//tworzy wartość domyślną typu
        }

        //ndpisana metoda ToString
        public override string ToString()
        {
            string i = "";

            foreach (Item element in Items)
            {
                i  += $"\n{element}";
            }

            return $"Catalog | ThematicDepartment: {ThematicDepartment} Items: {i}" ;
        }

        public void ShowAllItems()
        { Console.WriteLine(this); }

    }
}
