using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_K
{
    public static class Z5
    {
        public static IEnumerable<Punkt3D> LosowychPunktow2D(this int licznik)
        {
            var wylosowana = new Random();
            for (var i = 0; i < licznik; ++i)
            {
                var x = ((double)wylosowana.Next(-100, 100)) / 10;
                var y = ((double)wylosowana.Next(-100, 100)) / 10;
                var z = ((double)wylosowana.Next(-100, 100)) / 10;
                yield return new Punkt3D(x, y, z);
            }
        }
    }
}
