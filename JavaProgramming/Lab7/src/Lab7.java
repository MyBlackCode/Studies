import java.io.FileNotFoundException;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;


public class Lab7 {
	public static void insertEmployee(ArrayList<Employee> tab) throws FileNotFoundException
	{
		String name;
		double fte, salaryFTE;
		int age;
		String position;
		File file = new File("odczyt.txt");
		try {
			Scanner inputFile = new Scanner(file);
			while(inputFile.hasNext())
			{
				String lineread = (inputFile.nextLine()).strip();
				name = lineread.substring(0,lineread.indexOf(' '));
				lineread = lineread.substring(lineread.indexOf(' ')+1);
				name = name+" "+lineread.substring(0,lineread.indexOf(' '));
				lineread = lineread.substring(lineread.indexOf(' ')+1);
				fte = Double.parseDouble(lineread.substring(0,lineread.indexOf(' ')));
				lineread = lineread.substring(lineread.indexOf(' ')+1);
				salaryFTE = Double.parseDouble(lineread.substring(0,lineread.indexOf(' ')));
				lineread= lineread.substring(lineread.indexOf(' ')+1);
				age = Integer.parseInt(lineread.substring(0,lineread.indexOf(' ')));
				position = lineread.substring(lineread.indexOf(' ')+1);
			
			
				tab.add(new Employee(name, fte, salaryFTE, age, position));
			}
		 inputFile.close();
		}
		catch (FileNotFoundException e){
			javax.swing.JOptionPane.showMessageDialog(null, "Brak pliku!!! ");
		}
	}
	
	public static void main (String args[]) throws FileNotFoundException
	{
		System.out.println("  Na starcie");
		var eTab = new ArrayList<Employee>();
		//eTab.add( new Employee("Nowak Jan", 1.0, 5200.0, 24, "Kierowca"));
		//eTab.add( new Employee("Piech Anna", 0.7, 4800.0, 29, "Ksiegowa"));
		//eTab.add( new Employee("Jach Ewa", 1.2, 6000.0, 27, "Ksiegowa"));
		//eTab.add( new Employee("Rak Piotr" , 1.25, 4000.0, 21, "Kierowca"));
		//eTab.add( new Employee("Maj Jan", 0.5, 7000.0, 52, "Kierownik"));
		//eTab.add( new Employee("Bak Olga", 1.0, 6000.0, 29, "Ksiegowa"));
		insertEmployee(eTab);
		eTab.forEach((p)->System.out.println(p));
		
		System.out.println("\n  Po policzeniu pensji");
		eTab.forEach((p)-> p.countSalary());
		eTab.forEach((p)->System.out.println(p));
		
		System.out.println("\n  Po sortowaniu wg pensji(od najnizszej)");
		Collections.sort(eTab,(o1,o2) -> Double.compare(o1.getNetSalary(), o2.getNetSalary()));
		eTab.forEach((p)->System.out.println(p));
		
		System.out.println("\n  Po sortowaniu wg stanowiska(alfabetycznie), wieku (nierosnaco) i pensji (nierosnaco)");
		Collections.sort(eTab,(o1,o2) ->{ 
			if(o1.getPosition().compareTo(o2.getPosition())==0)
			{	if(Integer.compare(o1.getAge(), o2.getAge()) * -1 == 0)
					return Double.compare(o1.getNetSalary(), o2.getNetSalary())*-1;
				else
					return Integer.compare(o1.getAge(), o2.getAge()) * -1;
			}
			else 
				return o1.getPosition().compareTo(o2.getPosition());
			});
		eTab.forEach((p)->System.out.println(p));
		
		System.out.println("\n  Po sortowaniu wg wieku(nierosnaco), stanowiska(alfabetycznie) i placy brutton");
		Comparator <Employee> ComparatorAgeReversed = Comparator.comparingInt(Employee::getAge).reversed();
		Comparator <Employee> ComparatorPosition = Comparator.comparing(Employee::getPosition);
		Comparator <Employee> ComparatorSalaryFteReversed = Comparator.comparingDouble(Employee::getSalaryFTE).reversed();
		Comparator <Employee> ComparatorAR_P_SFR = (ComparatorAgeReversed.thenComparing(ComparatorPosition)).thenComparing(ComparatorSalaryFteReversed);
		Collections.sort(eTab,ComparatorAR_P_SFR);
		eTab.forEach((p)->System.out.println(p));
		
		try
		{
			PrintWriter outputFile = new PrintWriter("Lambda.txt");
			eTab.forEach((p)->{
				outputFile.println("**** zapis lambda ****");
				outputFile.println(p.getName()+ " lat: "+ p.getAge());
				outputFile.println("\t" +p.getPosition() + " etat: "+ p.getFte());
				outputFile.println("\tplaca_pod=" +p.getSalaryFTE() + "PLN -> pensja="+ p.getNetSalary());
				outputFile.println("--------------------------------------");
			});
			outputFile.close();
		}
		catch(FileNotFoundException a)
		{
			javax.swing.JOptionPane.showMessageDialog(null, "Nie da się utworzyć pliku!");
			System.exit(0);		
		}
	}

}
