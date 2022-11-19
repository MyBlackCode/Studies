import java.util.Arrays;
import java.util.Comparator;

public class Lab6 {
	public static void main(String[] args)
	{
		Dietician[] tabP = new Dietician[]
		{
			new Person("Kowalski Jan", 45, 178, 83),
			new Dog("Yeti", 6.0, 4, 2),
			new Dog("Sonia",5.1,7,2),
			new Person("Mucha Joanna", 24, 169,61),
			new Dog("Azor", 11.3, 5, 3),
			new Person("Gala Piotr", 34,184,91),
			new Person("Piech Anna", 56, 163, 88),
			new Dog("Meps", 16.9, 8, 3),
			new Person("Adamus Jacek", 21, 176, 94),
			new Dog("Reks", 2.8, 3, 1)		
		};
		
		System.out.println("Lista w pierwszej kolejnosci \n");
		for(int i= 0;i <tabP.length; i++)
		{
			System.out.println(tabP[i].toString());
		}
		
		System.out.println("\n\nLista uporzadkowana wg wartosci BMI \n");
		Arrays.sort(tabP, new Comparator<Dietician>() {
            public int compare(Dietician ob1, Dietician ob2) {
                return Double.compare(ob1.getBMI(), ob2.getBMI());
            }
		});
		for(int i= 0;i <tabP.length; i++)
		{
			System.out.println(tabP[i].viewAlarm()+tabP[i].toString());
		}
		
		System.out.println("\n\nLista uporzadkowana wg gatunku i wieku \n");
		Arrays.sort(tabP, new Comparator<Dietician>(){
			public int compare(Dietician ob1, Dietician ob2) {
				int result = (ob1.getClass().getName()).compareTo(ob2.getClass().getName());
				if(result==0)
				{
					result = Integer.compare(ob1.getAge(), ob2.getAge());
				}
				return result;
	            }
	        });

		for(int i= 0;i <tabP.length; i++)
		{
			System.out.println(tabP[i].viewAlarm()+tabP[i].toString());
		}	
	}
}
