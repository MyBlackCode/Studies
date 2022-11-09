import java.util.ArrayList;

public class Purchase {
	private int id;
	private String name;
	private int number;
	private double amount;
	
	public Purchase(int Id, String Name, int Number, double Amount, ArrayList<Customer> customers)
	{
		
		for(int i = 0; i < customers.size(); i++)
		{
			if((customers.get(i).getId()) == Id)
				break;
			else if (i==customers.size()-1)
				throw new IllegalArgumentException(String.valueOf(Id)+ " pomijam ten wpis:" + Name + " " + Number + " " + Amount );
		}
		id = Id;
		name = Name;
		number = Number;
		amount = Amount;
	}
		
	public double getAmount () {return amount;}
	
	@Override
	public String toString()
	{
		 return "Purchase| id=" + id + ", name=" + name + ", number=" + number + ", amount: " +amount;
	}
	

}
