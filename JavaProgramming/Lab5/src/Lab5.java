
import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;
import javax.swing.JOptionPane;
import java.io.PrintWriter;
import java.io.IOException;




public class Lab5 {
	
	//Funkcja wprowadzjąca dane z pliku customers.txt do listy klientów
	public static void insertCustomers(Scanner file, ArrayList<Customer> _customers)
	{
		int id;
		String firstName, lastName, address;
		
		while(file.hasNext())
		{
			id = file.nextInt();
			String lineread = (file.nextLine()).strip();
			firstName = lineread.substring(0,lineread.indexOf(' '));
			lineread = lineread.substring(lineread.indexOf(' ')+1);
			lastName = lineread.substring(0,lineread.indexOf(' '));
			address= lineread.substring(lineread.indexOf(' ')+1);			
			
			_customers.add(new Customer(id,firstName,lastName,address));
		}
	}
	
	//Funkcja wprowadzjąca dane z pliku purchases.txt do listy zakupów w liście klientów
		public static void insertPurchases(Scanner file,  ArrayList<Customer> _customers)
		{
			int id, number;
			String name;
			double amount;
			
			System.out.println();
			while(file.hasNext())
			{
				id = file.nextInt();
				String lineread = (file.nextLine()).strip();
				name = lineread.substring(0,lineread.indexOf(' '));
				lineread = lineread.substring(lineread.indexOf(' ')+1);
				number = Integer.parseInt(lineread.substring(0,lineread.indexOf(' ')));
				lineread = lineread.replace(',', '.');
				amount= Double.parseDouble(lineread.substring(lineread.indexOf(' ')+1));			
				
				try
				{
					Purchase currentPurchase = new Purchase(id,name,number, amount, _customers);
					System.out.println(currentPurchase.toString());
					for(int i =0; i <_customers.size(); i++)
					{
						if(_customers.get(i).getId()==id)
						{
							_customers.get(i).addPurchase(currentPurchase);
						}
					}
					
				}catch(IllegalArgumentException f)
				{
					System.err.println("Wyjatek. Uwaga! Brak kupującego o id=" + f.getMessage());
				}
			}
		}
		
	
/////////////////////////////////////////////////////////MAIN BEGIN////////////////////////////////////////////////////////////
	public static void main(String[] args) throws IOException
	{
		
		///////////////////// CUSTOMERS BEGIN /////////////////////
		ArrayList<Customer> customers = new ArrayList<Customer>();
		String fileCustomers = javax.swing.JOptionPane.showInputDialog("Podaj nazwę pliku zawierającego dane klientów: ");
		Scanner inputFileCustomers = null;
		//pierwsza próba wczytania pliku customers.txt
		try {
			File newFileCustomers = new File(fileCustomers);
			inputFileCustomers = new Scanner(newFileCustomers);
			insertCustomers(inputFileCustomers, customers);
			customers.forEach(System.out::println);	
		}
		catch(FileNotFoundException e)
		{
			javax.swing.JOptionPane.showMessageDialog(null, "Brak podanego pliku "+fileCustomers);
			fileCustomers = javax.swing.JOptionPane.showInputDialog("Podaj jeszcze raz nazwę pliku zawierającego dane klientów: ");
			//druga próba wczytania pliku customers.txt
			try {
				File newFileCustomers = new File(fileCustomers);
				inputFileCustomers = new Scanner(newFileCustomers);
				insertCustomers(inputFileCustomers, customers);
				customers.forEach(System.out::println);
			}
			catch(FileNotFoundException a)
			{
				javax.swing.JOptionPane.showMessageDialog(null, "Brak podanego pliku "+fileCustomers);
				System.exit(0);		
			}
			catch(NullPointerException b)
			{
				System.exit(0);	
			}
		}
		catch(NullPointerException c)
		{
			System.exit(0);	
		}
		inputFileCustomers.close();
		///////////////////// CUSTOMERS END /////////////////////
		
		///////////////////// PURCHASES BEGIN /////////////////////
		String filePurchases = javax.swing.JOptionPane.showInputDialog("Podaj nazwę pliku zawierającego dane zakupów:");
		Scanner inputFilePurchases = null;
		//pierwsza próba wczytania pliku purchases.txt
		try {
			File newFilePurchases = new File(filePurchases);
			inputFilePurchases = new Scanner(newFilePurchases);
			insertPurchases(inputFilePurchases, customers);
		}
		catch(FileNotFoundException e)
		{
			javax.swing.JOptionPane.showMessageDialog(null, "Brak podanego pliku "+filePurchases);
			filePurchases = javax.swing.JOptionPane.showInputDialog("Podaj jeszcze raz nazwę pliku zawierającego dane zakupów: ");
			//druga próba wczytania pliku purchases.txt
			try {
				File newFilePurchases = new File(filePurchases);
				inputFilePurchases = new Scanner(newFilePurchases);
				insertPurchases(inputFilePurchases,customers);
			}
			catch(FileNotFoundException a)
			{
				javax.swing.JOptionPane.showMessageDialog(null, "Brak podanego pliku "+filePurchases);
				System.exit(0);
			}
			catch(NullPointerException b)
			{
				System.exit(0);	
			}
		}
		catch(NullPointerException c)
		{
			System.exit(0);	
		}
		inputFilePurchases.close();
		///////////////////// PURCHASES END /////////////////////
		
		///////////////////// INVOICES BEGIN /////////////////////
		String fileInvoices = javax.swing.JOptionPane.showInputDialog("Podaj nazwę pliku do zapisu faktur:");
		try
		{
			PrintWriter outputFile = new PrintWriter(fileInvoices);
			System.out.println();
			for(int i = 0; i< customers.size();i++ )
			{
				if(customers.get(i).getPurchases()>1)
				{
					System.out.println(customers.get(i).outputInvoices());
					outputFile.println(customers.get(i).outputInvoices());
					outputFile.println("--------------------------------------");
					outputFile.println();
				}
			}
			outputFile.close();
		}
		catch(FileNotFoundException a)
		{
			javax.swing.JOptionPane.showMessageDialog(null, "Nie da się utworzyć pliku!");
			System.exit(0);		
		}
		catch(NullPointerException b)
		{
			System.exit(0);	
		}
		
		///////////////////// INVOICES END /////////////////////	 
	}
	/////////////////////////////////////////////////////////MAIN END////////////////////////////////////////////////////////////
}
