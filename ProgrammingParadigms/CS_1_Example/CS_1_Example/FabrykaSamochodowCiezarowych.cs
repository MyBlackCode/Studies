using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_1_Example
{
    internal class FabrykaSamochodowCiezarowych: IFabryka<SamochodCiezarowy>
    {
        public SamochodCiezarowy Stworz()
        {
            throw new NotImplementedException();
        }

        public bool RozpatrzReklamacje(SamochodCiezarowy pojazd)
        {
            throw new NotImplementedException();
        }
    }
}
