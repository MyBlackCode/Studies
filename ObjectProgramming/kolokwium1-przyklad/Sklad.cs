using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kolokwium1_przyklad
{
    public class Sklad : IInfo
    {
        IList<Lokomotywa> lokomotywy;
        IList<Wagonik> wagoniki;

        public Sklad (IList<Lokomotywa> _lokomotywy, IList<Wagonik> _wagoniki)
        {
            lokomotywy= new List<Lokomotywa>(_lokomotywy);
            wagoniki= new List<Wagonik>(_wagoniki);
        }

        public void WypiszInfo()
        {
            Console.WriteLine("LOKOMOTYWY:");
            foreach (var l in lokomotywy)
                l.WypiszInfo();

            Console.WriteLine("WAGONIKI:");
            foreach (var w in wagoniki)
                w.WypiszInfo();
        }

        public bool MozeJechac()
        {
            return lokomotywy.Sum(l => l.Ciag) > wagoniki.Sum(i => i.Masa);
        }
    }
}
