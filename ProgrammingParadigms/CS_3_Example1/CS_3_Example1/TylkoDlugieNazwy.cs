using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_3_Example1
{
    internal class TylkoDlugieNazwy : IWarunek<string>
    {
        public bool Sprawdz(string wartosc) => wartosc.Length > 18;
    }
}
