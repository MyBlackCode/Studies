
public class lab1 {
	public static void main(String[] args) {
		//Zad1
		//Napisz program "w stylu Hello World".
		System.out.println("Zad1");
		System.out.println("Witaj. To  pierwszy program w Javie");
		System.out.println();
		
		//Zad2
		//Napisz program, w ramach którego:
			//a zastosuj przynajmniej po jednej zmiennej typów int, double i String,
			//b wyświetl wynik (ze stosownym komentarzem) dowolnej operacji matematycznej 
			//(z zastosowaniem zmiennych).
		System.out.println("Zad2");
		//2.a
		int a = 3;
		double b = 4.0;
		String suma = "Suma to: ";
		//2.b
		System.out.println(suma+(a+b));
		System.out.println();
		
		//Zad3
		//Napisz program, w ramach którego zostaną wykorzystane
		//przynajmniej 3 wybrane metody z zakresu klasy String (patrz 38
		//strona wykładu nr 1).
		System.out.println("Zad3");
		//3.1
		int c = suma.length();
		System.out.println("1)"+ c);
		//3.2
		String pies ="Azor";
		System.out.println("orginal: " + pies);
		System.out.println("2) "+ pies.toLowerCase());
		//3.3
		System.out.println("3) " + pies.toUpperCase());
		System.out.println();
		
		//Zad4
		//Napisz program, w ramach którego dokonane zostaną przynajmniej dwie konwersje (różne metody) 
		//łańcuchów na wartości liczbowe oraz dokonane zostaną przynajmniej dwie operacje rzutowania 
		//(patrz kolejno strony 43 i 42 w wykładzie nr 1).
		System.out.println("Zad4");
		//4.1
		String liczba = "3";
		float LP = Float.parseFloat(liczba);
		//4.2
		String liczbaD = "3.5";
		double LD = Double.parseDouble(liczbaD);
		//4.3
		int x;
		x = (int)LD;
		//4.4
		double y;
		y = (double) LP;
	}

}
