using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_K
{
    public static class Z7
    {
        public static IEnumerable<Punkt3D> LosujPunkty3D (this int licznik)
        {
            var wylosowana = new Random();
            for (int i = 0; i < licznik; i++)
            {
                var x = wylosowana.Next(-20,20);
                var y = wylosowana.Next(-20, 20);
                var z = wylosowana.Next(-20, 20);

                yield return new Punkt3D(x, y, z);
            }
        }

        public static IEnumerable<Punkt3D> LosujPunkty3DZPrzerwaniemGenerowania(this int licznik)
        {
            var wylosowana = new Random();
            for (var i = 0; i < licznik; ++i)
            {
                var z = wylosowana.Next(-20, 20);
                if (z < 0)
                    yield break;
                var y = wylosowana.Next(-20, 20);
                var x = wylosowana.Next(-20, 20);
                yield return new Punkt3D(x, y, z);
            }
        }


    }
}
