using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L3
{
    public class Journal: Item
    {
        //pole dostepowe
        public int Number { get; set; }
        //konstruktor domyslny
        public Journal(){
            Number = 0;
        }
        //konstruktor parametryczny
        public Journal(string title, int id, string publisher,DateTime dateOfIssue, int number )
            : base(title, id,  publisher, dateOfIssue) 
        { Number = number; }

        public override string ToString()
        {
            return $"Journal|  Title:{_title} Id:{_id} Publisher:{_publisher} DateOffIssue: {_dateOfIssue} Number: {Number}";
        }

        public override string GenerateBarCode() { return Guid.NewGuid().ToString(); }


    }
}
