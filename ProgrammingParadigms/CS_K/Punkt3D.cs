using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_K
{
    public class Punkt3D
    {
        public double X { get; set; }
        public double Y { get; set; }
        public double Z { get; set; }
        public Punkt3D(double x = 0.0, double y = 0.0, double z = 0.0)
        {
            X = x;
            Y = y;
            Z = z;
        }

        public override string ToString()
        {
            return $"x = {X}, y = {Y}, z = {Z}";
        }
    }
}
