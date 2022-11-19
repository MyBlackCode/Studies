
public class Person implements Dietician {
	private String personalData;
	private int age;
	private double height;
	private double weight;
	private double bmi;
	
	public Person(String personData, int age, double height, double weight)
	{
		this.personalData=personData;
		this.age = age;
		this.height=height;
		this.weight = weight;
		setBMI();
	}	

	@Override
	public String toString() {
		//return (((int)bmi >= ALARM) ? viewAlarm() : "")+"Osoba: "+personalData+" ("+age+" lat; " + weight +" kg.; "+height+ " cm.) BMI="+bmi;
		return "Osoba: "+personalData+" ("+age+" lat; " + weight +" kg.; "+height+ " cm.) BMI="+bmi;
	}

	@Override
	public double getBMI() {
		return bmi;
	}

	@Override
	public int getAge() {
		return age;
	}

	@Override
	public void setBMI() {
		bmi = weight/Math.pow(height*0.01,2);
		
	}
	
	@Override
	public String viewAlarm() {
		return ((int)bmi >= ALARM) ? Dietician.super.viewAlarm() : "";
	}
}