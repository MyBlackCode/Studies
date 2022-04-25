using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_L2
{
    public class Player : Person //klasa dziedzicząca po klaseie Person
    {
        //zmienne klasy Player:
        private string _position;
        private string _club;
        private int _scoredGoals;

        //pola dostępowe:
        public string Position { get { return _position; } set { _position = value; } }
        public string Club { get { return _club; } set { _club = value; } }
        public int ScoredGoals { get { return _scoredGoals; } set { _scoredGoals = value; } }

        //konstroktor domyślny
        public Player()
        {
            _position = "brak";
            _club = "brak";
            _scoredGoals = 0;
        }

        //konstruktor parametryczny
        public Player(string firstname, string lastname, DateTime dateOfBrith, string position, string club, int scoreGoals) 
            : base(firstname, lastname, dateOfBrith)
        {
            _position = position;
            _club = club;
            _scoredGoals = scoreGoals;

        }

        //nadpisana metoda ToString
        public override string ToString()
        {
            return $"Player| FirstName: {_firstName}, LastName {_lastName}, DateTime: {_dateOfBrith}, Position: {_position}, Club: {_club}, ScoredGoals: {_scoredGoals} \n";
        }

        //wirtualna funkcja zliczająca punkty
        public virtual void ScoreGoal() { _scoredGoals++; }
    }
}
