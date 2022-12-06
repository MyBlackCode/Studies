import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

public class Lab8 {
	public static void main(String[] args) throws IOException
	{
		
		int m = 3;
		int n = 5;
		Board[]gry= new Board[m];
		for(int i=0; i<m; i++)
		{
			System.out.println("***** Gra nr "+ (i+1)+" *****");
			gry[i] =new Board();
			for (int j=0; j<n; j++) {
				if(j!=0) {
					gry[i].setA();
					gry[i].setB();
				}
				if(gry[i].check()==true) {
					System.out.println(gry[i].Win());
					break;
				}
				else if(j==n-1){
					System.out.println("Koniec run w grze nr:"+(i+1)+gry[i].Lose());
				}
			}
			System.out.print("\n\n");
		}
		
		try
		{
			PrintWriter outputFile = new PrintWriter("Wynik.txt");
			
			outputFile.println("##### PODSUMOWANIE #####");
			int najlepszy = 0;
			for(int i=0; i<m; i++)
			{
				outputFile.println("Gra nr " + (i+1) + ", liczba zdobytych punktów: "+ gry[i].getWinX().getScore()+
						" Liczba rund: "+ gry[i].getWinX().getNumRounds());
				najlepszy+=gry[i].getWinX().getScore();
			}
			outputFile.println("Laczna liczba punktow:" + najlepszy + " pkt");
			outputFile.close();
			outputFile.close();
		}
		catch(FileNotFoundException a)
		{
			javax.swing.JOptionPane.showMessageDialog(null, "Nie da się utworzyć pliku!");
			System.exit(0);		
		}
	}

}
