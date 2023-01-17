
public class MagazynProduktow {
	private int mProduktow;
	public MagazynProduktow (int initialValue) 
	{
		mProduktow = initialValue;
	}
	
	public synchronized void transfer(Produkt produkt) throws InterruptedException {
		while(mProduktow >= 200) {
			System.out.println("<-> D:"+Thread.currentThread()+" Magazyn produktow pelny (akt. w magazynie "+ mProduktow+".");
			wait();
		}
		mProduktow ++;
		System.out.print("(+) D:"+Thread.currentThread());
		System.out.println("Wyprodukowalem "+ produkt.getNazwa());
	}
}
