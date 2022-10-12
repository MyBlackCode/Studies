// Lab2 Zad1
//Utwórz klasę o nazwie Human, która będzie posidała takie atrybuty jak age,
//weight, height, name i gender. Definicja klasy powinna zawierać:
	//1. przynajmniej dwa konstruktory,
	//2. definicje metod getAge, getWeight, getHeight, getName, getGender, setWeight i setHeight,
	//3. przynajmniej dwie definicje metody o nazwie view.

public class Human {
	
	private int age;
	private double weight;
	private double height;
	private String name;
	private String gender;

	//1.1 /////////////////////////////////////////////////////////
	public Human ()
	{
		age = 0;
		weight = 0.0;
		height = 170.0;
		name = "brak";
		gender = "brak";
	}
	
	
	public Human(int a, double w, double h, String n, String g)
	{
		age = a;
		weight = w;
		height = h;
		name = n;
		gender = g;
	}
	//END 1.1 ////////////////////////////////////////////////////
	
	//1.2 ///////////////////////////////////////////////////////
	public int getAge() {return age;}
	public double getWeight(){return weight;}
	public double getHeight (){return height;}
	public String getName (){return name;}
	public String getGender( ) {return gender;}
	public void setWeight (double newWeight) { weight= newWeight;}
	public void setHeight (double newHeight) { height= newHeight;}
	//END 1.2 //////////////////////////////////////////////////
	
	//1.3 /////////////////////////////////////////////////////////////////////////////////////////////////////////
	public void view()
	{
		System.out.println("OSOBA| Wiek: " + age+", Waga: "+weight+", Wzrtost:"+height+", Personalia: "+name+"Plec: "+  gender);
	}
	
	public void viewAge()
	{
		System.out.println("Wiek: "+ age);
	}
	//END 1.3 /////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
}
