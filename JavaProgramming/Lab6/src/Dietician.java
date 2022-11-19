
public interface Dietician  {
	int ALARM = 30;
	double getBMI();
	int getAge();
	void setBMI();
	default String viewAlarm() {
		return "ALARM. Otylosc! ";
	}
}
