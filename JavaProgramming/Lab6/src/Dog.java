
public class Dog extends Animal{
	private final int factor;
	
	public Dog(String name, double weight,int age, int factor)
	{	
		super(name, weight, age);
		this.factor=factor;
		setBMI();
		
	} 
	@Override
	public String toString() {
		return super.toString()+", pies poziom " + factor;
	}
	@Override
	public double getBMI() {
		return super.getBMI();
	}
	@Override
	public int getAge() {
		return super.getAge();
	}
	
	@Override
	public void setBMI() {
			super.setBMI(factor);
	}
}
