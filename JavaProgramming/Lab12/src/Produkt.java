
public class Produkt {
	private String nazwa;
	private int lsurowcow;
	
	public Produkt(String nazwa, int lsurowcow) {
		this.nazwa = nazwa;
		this.lsurowcow = lsurowcow;
	}
	
	public String getNazwa() {return nazwa;}
	public int getLsurowcow() {return lsurowcow;}

}
