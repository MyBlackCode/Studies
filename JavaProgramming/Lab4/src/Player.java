import java.util.ArrayList;

public class Player {
	
	//////////////////////POLA KLASY PLAYER BEGIN///////////////////////
	private String name;
	private String team_name;
	private int age;
	private int n_goals;
	private float ave_n_minutes;
	static ArrayList<String> teams = new ArrayList<String>();
	//////////////////////POLA KLASY PLAYER END///////////////////////
	
	

	////////////////////////KONSTRUKTOR  KLASY PLAYER BEGIN ////////////////////////////////
	
	public Player(String Name, String Team_name, int Age, int N_goals, float Ave_n_minutes)
	{
		//////////// WYJATEK IMIE PERSONALIA NIEPUSTE BEGIN /////////////
		if(Name == null || Name == "")
			throw new NullPointerException();
		name = Name;
		////////////WYJATEK IMIE PERSONALIA NIEPUSTE END /////////////
		
		////////////WYJATEK DRUZYBA Z KOLEKCJI BEGIN /////////////
		for(int i = 0; i < teams.size(); i++)
		{
			if(Team_name.equals(teams.get(i)))
				break;
			else if (i==teams.size()-1)
				throw new IllegalArgumentException("Brak informacji o danym klubie");
		}
		team_name = Team_name;
		////////////WYJATEK DRUZYBA Z KOLEKCJI END /////////////
		
		////////////WYJATEK WIEK 16-60 BEGIN /////////////
		if( (Age < 16) || (Age>60))
			throw new IllegalArgumentException("Dopuszczalny wiek zawodnika to od 16 do 60 lat ");
		age = Age;
		////////////WYJATEK WIEK 16-60 END /////////////
		
		////////////WYJATEK BRAMKI NIEUJEMNE BEGIN /////////////
		if( N_goals < 0)
			throw new IllegalArgumentException("Podano wastosc ujemna");
		n_goals = N_goals;
		////////////WYJATEK BRAMKI NIEUJEMNE END /////////////
				
		////////////WYJATEK SREDNIA Z ZAKRESU 0-90 BEGIN /////////////
		if((Ave_n_minutes < 0) || (Ave_n_minutes > 90))
			throw new IllegalArgumentException("Czas spedzony na boisku musi się mieścić w przedziale: <0,90>"); 
		ave_n_minutes = Ave_n_minutes;
		////////////WYJATEK SREDNIA Z ZAKRESU 0-90 END /////////////
	}
	////////////////////////KONSTRUKTOR  KLASY PLAYER END ////////////////////////////////
	
	
	////////////////////////PRZESLONIETA METODA toString KLASY PLAYER BEGIN ////////////////////////////////
	@Override
	public String toString()
	{
		 return "Player| name=" + name + ", team=" + team_name + ", age=" + age + ", goals: " +n_goals+", avg. minutes="+  ave_n_minutes;
	}
	////////////////////////PRZESLONIETA METODA toString KLASY PLAYER END ////////////////////////////////
	
	
	//////////////////////USTAW KOLEKCJE DRUZYN BEGIN/////////////////////////////////////
	public static void setTeams(ArrayList<String> druzyny)
	{
		for(int i = 0; i < druzyny.size(); i++)
		{
			teams.add(druzyny.get(i));
			System.out.println(teams.get(i));
		}
	}
	//////////////////////USTAW KOLEKCJE DRUZYN END/////////////////////////////////////
	
}
