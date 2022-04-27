using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kolokwium1_przyklad
{
    public class Lokomotywa: Wagonik
    {
        private float _ciag;

        public float  Ciag { get => _ciag; set => _ciag = value; }

        public Lokomotywa(float masa, string nazwa, float ciag):base(masa, nazwa)
        {
            _ciag = ciag;
        }

        public override string Typ()
        {
            return "Lokomatywa";
        }

        public override void WypiszInfo()
        {
            Console.WriteLine($"{Typ()} | Masa: {Masa}, Nazwo: {Nazwa}, Ciag: {Ciag}");
        }

    }
}
