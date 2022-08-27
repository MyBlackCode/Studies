using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//1
namespace CS_K
{
    public class Autor
    {
        public int id { get; set; }
        public string Imie { get; set; }
        public string Nazwisko { get; set; }

        public Autor(int id = 0, string imie = "brak", string nazwisko = "brak")
        {
            this.id = id;
            Imie = imie;
            Nazwisko = nazwisko;
        }
    }
}
