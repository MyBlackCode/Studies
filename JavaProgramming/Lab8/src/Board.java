import java.util.Random;
import java.util.Scanner;
import java.lang.Math;


public class Board implements GameScoring {
	public class Point {
		private int x;
		private int y;
		private int  score = 0;
		private int num_rounds = 0;
		
		
		public Point(int x, int y){
			this.x = x;
			this.y = y;
		}
		public int getX() {
			return x;
		}
		public int getY() {
			return y;
		}
		
		public void setScore(int newScore) 
		{
			score = newScore;
		}
		public int getScore() 
		{
			return score;
		}
		public void setNumRounds(int newNumRounds) 
		{
			num_rounds = newNumRounds;
		}
		public int getNumRounds() 
		{
			return num_rounds;
		}
		
		public String toString() {
            return "(" + x + ", " + y +")"; 
        }
		
	}
	
	private Point A;
	private Point B;
	private Point X;
	Scanner in = new Scanner (System.in);
	
	public Board()
	{
		Random r = new Random();
		X =new Point ( r.nextInt(9), r.nextInt(9));;
		
		setA();			
		setB();
	}
	public Point getWinX()
	{
		return X;
	}
	public void setA() {
		X.setNumRounds(X.getNumRounds()+1);
		System.out.println("Runada "+ X.getNumRounds());
		System.out.println("Podaj wspolrzedne punktu A");
		int ax = Integer.parseInt(in.next());
		int ay = Integer.parseInt(in.next());
		in.nextLine();
		A = new Point(ax, ay);
		
	}
	
	public void setB() {
		System.out.println("Podaj wspolrzedne punktu B");
		int bx = Integer.parseInt(in.next());
		int by = Integer.parseInt(in.next());
		in.nextLine();
		B = new Point(bx, by);
	}
	
	public boolean check(){
		if(
				(	(X.getX()==A.getX())	&&	(X.getY()==A.getY())	)
				||
				(	(X.getX()==B.getX())	&&	(X.getY()==B.getY())	)
			) 
		{
			X.setScore(X.getScore()+(roundScoring[X.getNumRounds()-1]));
			return true;
		}
		else 
		{
			int XA = (int) Math.sqrt((Math.pow(X.getX()-A.getX(),2)+ Math.pow(X.getY()- A.getY(),2)));
			int XB = (int) Math.sqrt((Math.pow(X.getX()-B.getX(),2)+ Math.pow(X.getY()- B.getY(),2)));
			if(XA<XB)
			{
				System.out.println("Punt A="+A.toString()+" znajduje się bliżej odl="+XA);
				if(XA<10)
					X.setScore(X.getScore()+(10-XA));
			}
			else {
				System.out.println("Punt B="+B.toString()+" znajduje się bliżej odl="+XB);
				if(XB<10)
					X.setScore(X.getScore()+(10-XB));
			}
			
			return false;
		}
	}
	
	public String Win() {
		return "Gratulacje! Cel "+ X.toString()+" trafiony w rundzie: "+ X.getNumRounds() + " liczba zdobytuch punktów: " + X.getScore();
	}
	
	public String Lose() {
		return ", liczba zdobytuch punktów: " + X.getScore()+"\n Szukany punkt:"+ X.toString();
	}
	
}
