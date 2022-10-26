
public class Circle extends Figure
{

	////////////////////////////POLA KLASY BEGIN///////////////////////////////////////////////////////
	private double radius;
	////////////////////////////POLA KLASY END///////////////////////////////////////////////////////
	
	
	//////////////////////////// KONSTRUKTORY BEGIN ///////////////////////////////////////////////////////
	public Circle()
	{
		super();
		radius = 0.0;
	}
	
	public Circle(String Color, double Radius)
	{
		super(Color,0.0, 0.0);
		radius = Radius;
		count_Circumference();
		count_Surface();
	}
	////////////////////////////KONSTRUKTORY END ///////////////////////////////////////////////////////
	
	
	////////////////////////////FUNKCJE OBLICZJACE POLE I OBWOD BEGIN ///////////////////////////////////////////////////////
	public void count_Circumference() 
	{
		double obwod = 2* Math.PI * radius;
		super.setCircumference(obwod);
	}
	
	public void  count_Surface()
	{
		double pole = Math.PI * Math.pow(radius,2.0);
		super.setSurface(pole);
		
	}

	////////////////////////////FUNKCJE OBLICZJACE POLE I OBWOD END ///////////////////////////////////////////////////////
	
	
	////////////////////////////WYSWIETLANIE DANYCH BEGIN ///////////////////////////////////////////////////////
	public void viewData()
	{
		System.out.print("Kolo w kolorze: ");
		super.viewData();
	}
	////////////////////////////WYSWIETLANIE DANYCH END ///////////////////////////////////////////////////////
}