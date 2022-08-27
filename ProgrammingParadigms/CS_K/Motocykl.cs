using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_K
{
    public class Motocykl: IComparable<Motocykl>
    {
        public string Marka { get; set; }
        public string Model { get; set; }
        public float PojemnoscSilnika { get; set; }
        public int RokProdukcji { get; set; }

        public Motocykl (string model, string marka, float pojemnoscSilnika, int rokProducji)
        {
            Model = model;
            Marka = marka;
            PojemnoscSilnika = pojemnoscSilnika;
            RokProdukcji = rokProducji;
        }

        public int CompareTo( Motocykl inny)
        {
            if (this.RokProdukcji < inny.RokProdukcji)
                return -1;
            else if (this.RokProdukcji > inny.RokProdukcji)
                return 1;
            else
                if (this.PojemnoscSilnika < inny.PojemnoscSilnika)
                    return -1;
                else if (this.PojemnoscSilnika > inny.PojemnoscSilnika)
                    return 1;
                else
                    return 0;
        }

        public override string ToString()
        {
            return $"Motocykl| Marka: {Marka}, Model {Model}, Pojemność silnika: {PojemnoscSilnika}, Rok produkcji: {RokProdukcji}";
        }


    }
}
