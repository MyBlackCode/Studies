

public class MagazynSurowcow {
	private final int[] mSurowcow;
	private int maxValue;
	private int a;
	private int b;
	private int c;
	public MagazynSurowcow (int initialValue, int maxValue) 
	{
		mSurowcow = new int[1];
		mSurowcow[0]= initialValue;
		this.maxValue = maxValue;
		a = 0;
		b = 0;
		c = 0;
	}
	
	public synchronized void receive(int amount) throws InterruptedException {
		while(mSurowcow[0]+amount > maxValue) {
			System.out.println("<-> D:"+Thread.currentThread()+" Czekam z dostawa "+ amount+ 
					" szt. do magazynu surowcow (akt. w magazynie "+ mSurowcow[0]+".");
			wait();
		}
		System.out.print(Thread.currentThread());
		mSurowcow[0] += amount;
		System.out.printf("Dostarczyłem %d szt. Stan magazynow surowcow to %d szt.\n", amount, mSurowcow[0]);
		notify();
	}
	
	public synchronized void send(Produkt produkt) throws InterruptedException {
		if(mSurowcow[0] < produkt.getLsurowcow()) {
			System.out.println("!! D:"+Thread.currentThread()+" Czekam na materialy, "+ 
					" chce wyprodukowac "+ produkt.getNazwa());
			//wait();
			return;
		}
		System.out.print("(+) D:"+Thread.currentThread());
		mSurowcow[0] -= produkt.getLsurowcow(); 
		if(produkt.getNazwa()=="Produkt A") {
			a++;
			mSurowcow[0] -= produkt.getLsurowcow();}
		else if (produkt.getNazwa()=="Produkt B") {
			b++;
			mSurowcow[0] -= produkt.getLsurowcow();}
		else if(produkt.getNazwa() == "Produkt C") {
			c++;
			mSurowcow[0] -= produkt.getLsurowcow();}
		else {
			System.out.print("Bledny produkt");
		}
		System.out.println("Zlożylem w magazynie "+produkt.getNazwa()+" Bilans producji: A "+a+"szt., B "+b+"szt., C "+c+"szt.");
	}
}
