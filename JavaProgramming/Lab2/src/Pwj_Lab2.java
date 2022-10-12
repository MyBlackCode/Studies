//Lab2 Zad2
//Utwórz klasę o nazwie PwJ_Lab2 zwierającą:
//1. metodę main a w niej definicję i inicjalizację tablicy obiektów typu Human
//(przynajmniej 5-cio elementową),
//2. definicję metody o nazwie valueChange przyjmującej parametr określajacy
//zakres dla zwracanej wartości (metoda ma zwracać wartość z przedziału
//[-parametr, parametr]),
//3. definicję metody o nazwie avgWeight przyjmującej dwa parametry w
//postaci tablicy obiektów typu Human oraz zmiennej wskazującej na płeć
//(Mr, Ms, all); rolą metody będzie obliczanie średniej wagi ciała dla kobiet,
//męższczyzn i wszystkich,
//4. definicję metody o nazwie viewAvgWeight prezentującej informacje o
//średnich wagach osób przynależących do danej grupy,

import java.util.Random;
import java.util.ArrayList;
import java.util.List;


public class Pwj_Lab2 {
	
	//2.2 /////////////////////////////////////////////////
	public static int valueChange(int a)
	{
		Random b = new Random();
		int c = b.nextInt(2*a+1)-a;
		return c;
	}
	//END 2.2//////////////////////////////////////////////
	
	//2.3 ///////////////////////////////////////////////////////
	public static double avgWeight (Human[] ludzie, String  plec)
	{
		double masa =0.0;
		int suma = 0;
		for(int i= 0; i < ludzie.length; i++)
		{
			if(plec == "all")
			{
				masa+= ludzie[i].getWeight();
				suma+= 1;
			}
			else if(ludzie[i].getGender() == plec)
			{
				masa+= ludzie[i].getWeight();
				suma+= 1;
			}
		}
		
		return masa/suma;
	}
	//END 2.3//////////////////////////////////////////////////////
	
	//2.4 //////////////////////////////////////////////////////////////////////////////
	public static void viewAvgWeight (Human[] ludzie, String plec)
	{
		System.out.println("Srednia waga " + plec + ": " + avgWeight(ludzie, plec));
	}
	//END 2.4 /////////////////////////////////////////////////////////////////////////
	
	//////////////////////////////////////// MAIN ////////////////////////////////////////////////////////
	public static void main(String[] args)
	{
		//2.1 ///////////////////////////////////////////////////////////////////
		Human[] humans = new Human[5];
	
		humans[0] = new Human(22, 50.0, 170.0, "Jola Kowalska", "Ms");
		humans[1] = new Human(27, 70.0, 190.0, "Konrad Nowak", "Mr");
		humans[2] = new Human(30, 55.0, 165.0, "Honorata Kwiatkowska", "Ms");
		humans[3] = new Human(25, 50.0, 170.0, "Katarzyna Kowalska", "Ms");
		humans[4] = new Human(24, 65.0, 170.0, "Jan Polanski", "Mr");
		//END 2.1 //////////////////////////////////////////////////////////////
		
		//W wyniku (wyświetlone stosowne informacje na konsoli) należy kolejno uzyskać:
			//I pierwotne dane osób (tablica obiektów typu Human),
		for(Human p: humans)
		{
		 p.view();
		}
		
			//I pierwotne średnie wagi kolejno w grupach: Mr, Ms i all,
		viewAvgWeight(humans, "Mr");
		viewAvgWeight(humans,"Ms");
		viewAvgWeight(humans,"all");
		
			//I zaktualizowane dane osób, po zrealizowanej za pośrednictwem metody
			///valueChange aktualizacji w zakresie wartości pól weight (+-10kg) i height
			//(+-20cm) ,
		System.out.println();
		System.out.println("Po aktualizacji wagi i wzrostu:");
		for(int i=0; i < humans.length ;i++) 
		{
		humans[i].setWeight(humans[i].getWeight()+valueChange(10));
		humans[i].setHeight(humans[i].getHeight()+valueChange(20));
		}
		
		for(Human p: humans)
		{
		 p.view();
		}
		
			//I zaaktualizowane średnie wagi kolejno w grupach: Mr, Ms i all,
		viewAvgWeight(humans, "Mr");
		viewAvgWeight(humans,"Ms");
		viewAvgWeight(humans,"all");
			//I opcjonalnie (rozszerzenie zadania) listę zawierajacą dane osób uporządkowaną
			//wg wartości height w trybie nierosnącym (bez stosowania metody
			///Arrays.sort(), interfesjów itd.; kolejność w ramach tabeli obiektów należy
			//zmienić za pośrednictwem metod iteracyjnych).
		
		for(int i=0; i < humans.length;i++) 
		{
			for(int j=0; j < humans.length-1 ;j++) 
			{
			  if(humans[j+1].getHeight()>humans[j].getHeight())
			  {
				  double a = humans[j].getHeight();
				  humans[j].setHeight(humans[j+1].getHeight());
				  humans[j+1].setHeight(a);	  
			  }
			}	
		}
		
		List <Human> lista = new ArrayList<Human>(humans.length);
		
		for(int i= 0; i < humans.length ;i++) 
		{
			lista.add(humans[i]);
		}
		
		System.out.println("Posortowana lista:");
		for (Human p: lista)
		{
			p.view();
		}
		
		
	//////////////////////////////////////////END MAIN /////////////////////////////////////////////////////
	}
}