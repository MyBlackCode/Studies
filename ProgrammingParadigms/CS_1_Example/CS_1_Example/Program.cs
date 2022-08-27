using System;

namespace CS_1_Example
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var sw = new SwiatWirtualny();

            var fso = new FabrykaSamochodowOsobowych();
            var fsc = new FabrykaSamochodowCiezarowych();
            var fs = new FabrykaSamochodow();
            /*
             sw.PotrzebnySamochod(fso);// aby to się kompilowało trzeba było zaimpletować Interfejs 
            sw.PotrzebnySamochod(fsc);// IFabryka <out T> (kowariancja) inaczej typ T jest inwariantny. 
            */
            sw.PotrzebnySamochod(fs);

            SamochodOsobowy so = new SamochodOsobowy();

            so.Napraw(new SerwisSamochodowOsobowych());
            //so.Napraw(new SerwisSamochodCiezarowy());
            so.Napraw(new SerwisSamochodow());
        }
    }
}
