import java.util.*;
import java.util.ArrayList;

public class Lab4 {
	
	///////////////////////////////////FUNKCJA DODAJACA GRACZA BEGIN ////////////////////////////////////
	public static void InputPlayer(ArrayList<Player> team) 	
	{
		///////ZMIENNE BEGIN /////////////
		String personalia = null, druzyna;
		int wiek, gole;
		float czas;
		Scanner in = new Scanner (System.in);
		///////ZMIENNE END /////////////
		
		////////////PETLA DODODAJACA NOWYCH UZYTKOWNIKOW NA ZYCZENIE BEGIN ////////////
		do
		{
			////////////// WPROWADZENIE DANYCH GRACZA BEGIN ////////////////////////////////////
			System.out.print("Podaj personalia gracza: ");
			personalia = in.nextLine();
			
			System.out.print("Podaj nazwe druzyny gracza: ");
			druzyna = in.nextLine();
	
		
			/////////////// WYJATEK FORMATU WIEK BEGIN /////////////////////////////
			try
			{
				System.out.print("Podaj wiek gracza: ");
				wiek =Integer.parseInt(in.next());
			}
			catch(NumberFormatException e) {
				System.out.println("Uwaga! Zastosowano nieprawidlowy format danych!");
				try
				{
					System.out.print("Jeszcze raz podaj wiek (inaczej zostanie przypisana wartosc 16):");
					wiek =Integer.parseInt(in.next());
				}
				catch(NumberFormatException f) 
				{
					System.out.println("Uwaga!!! Po drugiej blednej wartosci wiek ustalono na poziomie domyslnym 16 lat.");
					wiek = 16;
				}
			}
			/////////////// WYJATEK FORMATU WIEK END /////////////////////////////
			
			
			/////////////// WYJATEK FORMATU BRAMEK BEGIN /////////////////////////////
			try
			{
				System.out.print("Podaj liczbe zdobytych bramek przez zawodnika: ");
				gole = Integer.parseInt(in.next());
			}
			catch(NumberFormatException e) {
				System.out.println("Uwaga!!! Zastosowano nieprawidlowy format danych.");
				try
				{
					System.out.print("Jeszcze raz podaj liczbe bramek zawodnika (inaczej zostanie przypisana wartosc 0): ");
					gole = Integer.parseInt(in.next());
				}
				catch(NumberFormatException f) 
				{
					System.out.println("Uwaga!!! Po drugiej blednej wartosci liczbe zdobytych bramek ustalono na 0.");
					gole = 0;
				}
			}
			/////////////// WYJATEK FORMATU BRAMEK END /////////////////////////////
			
			
			/////////////// WYJATEK FORMATU SREDNI CZAS BEGIN /////////////////////////////
			try {
				System.out.print("Podaj srednia liczbe minut spedzonych przez zawodnika na boisku: ");
				czas = Float.parseFloat(in.next());
			}
			catch(NumberFormatException e) {
				System.out.println("Uwaga!!! Zastosowano nieprawidlowy format danych.");
				try
				{
					System.out.print("Jeszcze raz podaj liczbe minut (inaczej zostanie przypisana wartosc 0): ");
					czas = Integer.parseInt(in.next());
				}
				catch(NumberFormatException f) 
				{
					System.out.println("Uwaga!!! Po drugiej blednej wartosci liczbe minut ustalono na 0.");
					czas = 0;
				}
			}
			/////////////// WYJATEK FORMATU SREDNI CZAS CZAS /////////////////////////////
			in.nextLine();
			
			//////////////WPROWADZENIE DANYCH GRACZA END ////////////////////////////////////
			
			
			//////////// DODANIE GRACZA DO KOLEKCJI Z UWZGLEDNIENIEM WYJATKOW BEGIN//////////////////
			try
			{
				team.add( new Player (personalia,druzyna,wiek,gole,czas));
			}
			catch (NullPointerException e)
			{
				System.err.println("Anulowanie wpisu! Niepoprawne dane uzytkownika: Personalia nie mogą być puste!!!");
			}
			catch (IllegalArgumentException e)
			{
				System.err.println("Anulowanie wpisu! Niepoprawne dane uzytkownika: " + e.getMessage());
			}
			////////////DODANIE GRACZA DO KOLEKCJI Z UWZGLEDNIENIEM WYJATKOW END//////////////////
			
			
			System.out.print("Chcesz wprowadzic dane kolejnego zawodnika (t/n): ");
		}
		while(in.nextLine().equals("t"));
		////////////PETLA DODODAJACA NOWYCH UZYTKOWNIKOW NA ZYCZENIE END ////////////	
		in.close();
	}
	///////////////////////////////////FUNKCJA DODAJACA GRACZA END ////////////////////////////////////
	
	
	//////////////////////////////////////////////MAIN BEGIN/////////////////////////////////////////////
	public static void main(String[] args)
	{
		
		ArrayList<String> teams = new ArrayList<String>();
		teams.add("Warta Czestochowa");
		teams.add("Gryf Poznan");
		teams.add("Wisla Katowice");
		teams.add("Pilica Piotrkow Trybunalski");
		teams.add("San Krakow");
		
		System.out.println("Lista (referencyjna) klubów:");
		for(String team:teams)
			System.out.println(team);
		
		System.out.println("\nPo sortowaniu:");
		Collections.sort(teams);
		for(String team:teams)
			System.out.println(team);
		
		
		ArrayList<Player> team = new ArrayList<Player>();
		Player.setTeams(teams);		
		InputPlayer(team);
		
		System.out.println("\nZawodnicy:");
		team.forEach(System.out::println);
		
	}
	//////////////////////////////////////////////MAIN END/////////////////////////////////////////////

}
