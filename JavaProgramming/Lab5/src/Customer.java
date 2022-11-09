import java.util.ArrayList;

public class Customer {
	private int id;
	private String firstName;
	private String lastName;
	private String address;
	private ArrayList<Purchase> purchases;
	
	
	public Customer(int Id, String FirstName, String LastName, String Address)
	{
		id = Id;
		firstName = FirstName;
		lastName = LastName;
		address = Address;
		purchases = new ArrayList<Purchase>();
	}
	
	public int getId() { return id; }
	public int getPurchases() { return purchases.size(); }
	
	// dodawanie zakupu klienta do listy
	public void addPurchase(Purchase purchase)
	{
		purchases.add(purchase);
	}
	
	//tworzenie faktury
	public String outputInvoices()
	{
		String result = null;
		
		result = "Invoice. id customer: " + id + "\n" + 
				firstName+ " " + lastName + " " + address;
		double sum = 0;
		for (int i = 0 ; i < purchases.size(); i++)
		{
			sum += purchases.get(i).getAmount();
		}
			
		result  += "\n number trans. " + purchases.size() +", sum amount " + sum  + " PLN";
		
		return result;
	}
	
	@Override
	public String toString()
	{
		
		return "Customer| id=" + id + ", name=" + firstName + ", last_name=" + lastName + ", adress: " +address;
	}

}
