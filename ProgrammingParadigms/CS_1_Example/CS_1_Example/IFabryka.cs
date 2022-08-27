using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal interface IFabryka< T> 
    {
        T Stworz();
        bool RozpatrzReklamacje( T pojazd);
    }
}
