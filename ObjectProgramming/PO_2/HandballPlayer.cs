using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L2
{
    public class HandballPlayer: Player
    {
        // konstruktor parametryczny 
        public HandballPlayer(string firstname, string lastname, DateTime dateOfBrith, string position, string club, int scoreGoals) 
            : base(firstname, lastname, dateOfBrith, position, club, scoreGoals) { }
       
        //nadpisuje wirtualną metode ToString z Klasy Player
        public override void ScoreGoal() { ScoredGoals++;
            Console.WriteLine("Handball player scored goal!");
        }
    }
}
