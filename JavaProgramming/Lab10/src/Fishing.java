import java.util.GregorianCalendar;
import java.util.Calendar; 
import java.time.LocalDate;

public class Fishing implements FishingTime{
	private LocalDate fishingDate;
	private String fishingDayOfWeek;
	private String fishName;
	private String fisher;
	private double fishWeight;
	private double fishLength;
	
	public Fishing(LocalDate fishingDate, String fishName, String fisher, double fishWeight, double fishLength) {
		this.fishingDate = fishingDate;
		//The first month of the year in the Gregorian and Julian calendars is JANUARY which is 0. Months 0 - 11. 
		Calendar cal = new GregorianCalendar(fishingDate.getYear(),fishingDate.getMonthValue()-1,fishingDate.getDayOfMonth());
		this.fishingDayOfWeek = dayNameOfWeek[(cal.get(Calendar.DAY_OF_WEEK)-1)];
		this.fishName = fishName;
		this.fisher = fisher;
		this.fishWeight = fishWeight;
		this.fishLength = fishLength;
	}
	
	public LocalDate getFishingDate(){return fishingDate;}
	public String getFishingDayOfWeek() { return fishingDayOfWeek;}
	public String getFishName(){return fishName;}
	public String getFisher(){return fisher;}
	public double getFishWeight(){return fishWeight;}
	public double getFishLength(){return fishLength;}
	

	public String toString()
	{
		return "Polow: "+ fishingDate + " ("+fishingDayOfWeek+"), gatunek: "+
				fishName+", wedkarz: "+fisher+", waga: "+fishWeight+"kg., dlugosc:"+ fishLength+"cm.";
	};
}
