import java.util.*;

public class Lab3 {
	public static void main(String[] args)
	{
		Scanner in = new Scanner (System.in);
		
		//KOLO
		System.out.println("KOLO ////////////////////////////////////////////////////////////////////////");
		System.out.print("Podaj kolor kola: ");
		String kolor = in.nextLine();
		System.out.print("Podaj promien kola: ");
		double promien = in.nextDouble();
		Circle kolo = new Circle(kolor, promien);
		kolo.viewData();
		
		//PROSTOKAT
		System.out.println("\nPROSTOKAT ////////////////////////////////////////////////////////////////////////");
		System.out.print("Podaj kolor prostokata: ");
		in.nextLine();
		String kolorP = in.nextLine();
		System.out.print("Podaj bok a prostokata :");
		double bokA = in.nextDouble();
		System.out.print("Podaj bok b prostokata: ");
		double bokB = in.nextDouble();
		Rectangle prostokat = new Rectangle (kolorP, bokA, bokB);
		prostokat.viewData();
		
		//TROJKAT
		System.out.println("\nTROJKAT ////////////////////////////////////////////////////////////////////////");
		System.out.print("Podaj kolor prostokata: ");
		in.nextLine();
		String kolorT = in.nextLine();
		System.out.print("Podaj bok a trojkata: ");
		bokA = in.nextDouble();
		System.out.print("Podaj bok b trojkata: ");
		bokB = in.nextDouble();
		System.out.print("Podaj bok c trojkata: ");
		double bokC = in.nextDouble();
		if ((bokA+bokB>bokC)&& (bokB+bokC>bokA) && (bokC+bokA>bokB)) 
		{
			Triangle trojkat = new Triangle (kolorT, bokA, bokB, bokC);
			trojkat.viewData();
		}
		else
		{
			System.out.println("Z podanyvh bokow nie da sie zbudowac trojkata");
		}
		
	}

}
