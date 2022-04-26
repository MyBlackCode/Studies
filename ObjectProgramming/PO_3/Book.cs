using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L3
{
    public class Book : Item
    {
        //pola dostępowe
        public int PageCount { get; set; }
        public IList<Author> Authors { get; set; }

        //konstruktor parametryczny
        public Book(string title, int id, string publisher, DateTime dateOfIssue, int pageCount, IList<Author> authors)
            :base (title, id, publisher, dateOfIssue) 
        {
            PageCount = pageCount;
            Authors = new List<Author>(authors);
        }

        //metoda ToString
        public override string ToString()
        {
            string i = "";
            foreach (Author element in Authors)
            {
                i += $"\n{element}";
            }
            return $"Book| Title:{_title} Id:{_id} Publisher:{_publisher} DateOffIssue: {_dateOfIssue} " +
                $"PageCount: {PageCount} + Authors: {i} ";
        }


        public override string GenerateBarCode() { return Guid.NewGuid().ToString(); }

        //dodawanie obiektu do listy
        public void AddAuthor(Author author) {
            Authors.Add(author);
        }
    }
}
