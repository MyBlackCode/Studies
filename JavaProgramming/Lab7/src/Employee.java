
public class Employee implements Accountant {
	private String name;
	private double fte;// (wymiar etatu),
	private double salaryFTE;//(płaca podstawowa)
	private double netSalary;//(pensja netto)
	private int age;
	private String position;// (stanowisko pracy)
	
	public Employee(String Name, double Fte, double SalaryFTE, int Age, String Position)
	{
		name = Name;
		fte =Fte;
		salaryFTE = SalaryFTE;
		age=Age;
		position = Position;
	}
	
	public String getName(){return name;}
	public double getFte() {return fte;}
	public double getSalaryFTE(){return salaryFTE;}
	public double getNetSalary(){return netSalary;}
	public int getAge(){return age;}
	public String getPosition(){return position;}
	
	public String toString()
	{
		return name+" lat: "+age+" "+position+" etat:"+fte+" placa_pod="+  salaryFTE+ "  pensja="+((netSalary == 0.0) ? "null" : netSalary);
	}

	@Override
	public void countSalary() {
		Accountant result = () ->
		{
			if (age < ageLimit) 
				netSalary = salaryFTE *fte *(1-hcc);
			else 
				netSalary =salaryFTE *fte *(1-ratePIT-hcc);
		};
		
		result.countSalary();
	}
	
	

}
