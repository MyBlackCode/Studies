
public abstract class Animal implements Dietician{
	
	private final String name;
	private final double weight;
	private final int age;
	private double bmi;
	
	public Animal(String name, double weight, int age)
	{
		this.name=name;
		this.weight=weight;
		this.age=age;
	}
	
	@Override
	public String toString() {
		java.text.DecimalFormat df =new java.text.DecimalFormat("0.000000");
		//return (((int)bmi >= ALARM) ? viewAlarm() : "")+"Zwierze "+name+" o wadze "+df.format(weight)+ " i wieku "+ age+" ma BMI="+df.format(bmi);
		return "Zwierze "+name+" o wadze "+df.format(weight)+ " i wieku "+ age+" ma BMI="+df.format(bmi);
	}
	
	@Override
	public double getBMI() {
		return bmi;
	}
	
	@Override
	public int getAge() {
		return age;
	}
	
	public void setBMI(int value) { 
		if (value == 1) 
			bmi = (Math.pow(weight,3));
		else if (value == 2)
			bmi =(Math.pow(weight,2));
		if (value == 3)
			bmi = (weight + 10);
	}
	
	@Override
	public String viewAlarm() {
		return ((int)bmi >= ALARM) ? Dietician.super.viewAlarm() : "";
	}
}
