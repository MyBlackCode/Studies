using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test2
{
    public abstract class Towarowy: Wagon
    {
    public float Ladunek { get; set; }

    public Towarowy(float masa, float ladunek): base (masa)
    {
        Ladunek = ladunek;
    }


    }
}
