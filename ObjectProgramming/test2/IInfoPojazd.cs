using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test2
{
    public interface IInfoPojazd : IInfo
    {
        public float MasaCalkowita();
        public int Pasazerow();
    }
}
