
public class Rectangle extends Figure
{
	////////////////////////////POLA KLASY BEGIN///////////////////////////////////////////////////////
	private double a;
	private double b;
	////////////////////////////POLA KLASY END///////////////////////////////////////////////////////


	//////////////////////////// KONSTRUKTORY BEGIN ///////////////////////////////////////////////////////
	public Rectangle()
	{
		super();
		a = 0.0;
		b = 0.0;
	}

	public Rectangle(String Color, double A, double B)
	{
		super(Color,0.0, 0.0);
		a = A;
		b = B;
		count_Circumference();
		count_Surface();
	}
	////////////////////////////KONSTRUKTORY END ///////////////////////////////////////////////////////


	////////////////////////////FUNKCJE OBLICZJACE POLE I OBWOD BEGIN ///////////////////////////////////////////////////////
	public void count_Circumference() 
	{
		double obwod = 2*a+2*b;
		super.setCircumference(obwod);
	}

	public void  count_Surface()
	{
		double pole = a*b;
		super.setSurface(pole);

	}
	////////////////////////////FUNKCJE OBLICZJACE POLE I OBWOD END ///////////////////////////////////////////////////////


	////////////////////////////WYSWIETLANIE DANYCH BEGIN ///////////////////////////////////////////////////////
	public void viewData()
	{
		System.out.print("Prostokat w kolorze: ");
		super.viewData();
	}
	////////////////////////////WYSWIETLANIE DANYCH END ///////////////////////////////////////////////////////

}
