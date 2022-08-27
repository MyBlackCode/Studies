using System;
using System.Collections.Generic;

namespace CS_3_Example1
{
    internal class Program
    {

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

            var sprawdzDlugie = new TylkoDlugieNazwy();
            var sprawdzNaLitereA = new TylkoNaLitere('A');
            var sprawdzNaLitereP = new TylkoNaLitere('P');

            var dlugieNazwy = OperacjeNaLiscie.Filtruj(przedmioty, sprawdzDlugie);
            var przedmiotyNaLitereP = OperacjeNaLiscie.Filtruj(przedmioty, sprawdzNaLitereP);
            var przedmiotyNaLitereA = OperacjeNaLiscie.Filtruj(przedmioty, sprawdzNaLitereA);
            Console.WriteLine($"{przedmiotyNaLitereA.ToString()}");
        }
    }
}
