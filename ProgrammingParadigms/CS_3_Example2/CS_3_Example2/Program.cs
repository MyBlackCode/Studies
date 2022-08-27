using System;
using System.Collections.Generic;

namespace CS_3_Example2
{
    internal class Program
    {
        static bool TylkoDlugie(string wartosc) => wartosc.Length > 18;

        static Func<string, bool> TylkNaLitere(char litera) => (string wartosc) => wartosc[0] == litera;
        static void Main(string[] args)
        {
            List<string> przedmioty = new List<string>
            {
                "Paradygmaty programowania",
                "Programowanie Stron internetowych",
                "Algebra",
                "Logika dla informatyków",
                "Sieci komputerowe"
            };

            List<string> dlugieNazwy = OperacjeNaLiscie.Filtr(przedmioty, TylkoDlugie);
            List<string> przedmiotyNaLitereP = OperacjeNaLiscie.Filtr(przedmioty, TylkNaLitere('P'));
            List<string> przedmiotyNaLitereA = OperacjeNaLiscie.Filtr(przedmioty, TylkNaLitere('A'));

        }
    }
}
