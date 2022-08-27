using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal class FabrykaSamochodowOsobowych: IFabryka<SamochodOsobowy>
    {
        public SamochodOsobowy Stworz()
        {
            throw new NotImplementedException();
        }

        public bool RozpatrzReklamacje(SamochodOsobowy pojazd)
        {
            throw new NotImplementedException();
        }
    }
}
