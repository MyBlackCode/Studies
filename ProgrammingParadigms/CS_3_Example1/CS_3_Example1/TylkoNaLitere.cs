using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_3_Example1
{
    internal class TylkoNaLitere: IWarunek<string>
    {
        char znak;

        public TylkoNaLitere(char znak)
        {
            this.znak = znak;
        }

        public bool Sprawdz(string wartosc) => wartosc[0] == znak;
    }
}
