import java.util.Arrays;

public class Zrodlo {
	private final int[] zrodla;
	public Zrodlo (int n, int initialValue) 
	{
		zrodla = new int [n];
		Arrays.fill(zrodla, initialValue);
	}
	public synchronized void transfer(int from, int amount) throws InterruptedException {
		while(zrodla[from]< amount) {
			System.out.println("<-> Brak surowcow do zrealizowania: "+ amount+ 
					" szt. (akt. w magazynie "+ zrodla[from]+").");
			wait();
		}
		System.out.print(Thread.currentThread());
		zrodla[from]-= amount;
		System.out.printf("Pobralem %d jednostek ze zrodlo nr %d (w magazynie pozostało: %d szt,).\n", amount, from, zrodla[from]);
	}
	public int size() { return zrodla.length;}

}
