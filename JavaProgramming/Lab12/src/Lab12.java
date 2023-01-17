

public class Lab12 {
	public static final int DELAY = 10;
	public static final int KROKI_DOSTAWCY = 400;
	public static final int KROKI_LINII_PRODUKCYJNEJ = 100;
	public static final int maxIlosc = 300;
	public static final int minIlosc = 100;
	public static final int range = maxIlosc - minIlosc + 1;
	
	public static void main(String[] args) {
		var produkty = new Produkt [3];
		produkty[0] = new Produkt ("Produkt A", 120);
		produkty[1] = new Produkt ("Produkt B", 250);
		produkty[2] = new Produkt ("Produkt C", 500);
		
		var zrodla = new Zrodlo(2, 50000);
		var magazynSurowcow = new MagazynSurowcow(0, 5000);
		var magazynProduktow = new MagazynProduktow(0);
		
		Runnable task1 = () ->
		{
			try {
				for(int i = 0; i < KROKI_LINII_PRODUKCYJNEJ; i++) {
					int j =(int)(Math.random() * 3);
					magazynSurowcow.send(produkty[j]);
					magazynProduktow.transfer(produkty[j]);
					Thread.sleep((int)(DELAY*Math.random()));
				}
			}
			catch(InterruptedException e){
				
			}
			
		};
		Runnable task2 = () ->
		{
			try {
				for(int i = 0; i < KROKI_LINII_PRODUKCYJNEJ; i++) {
					int j =(int)(Math.random() * 3);
					magazynSurowcow.send(produkty[j]);
					magazynProduktow.transfer(produkty[j]);
					Thread.sleep((int)(DELAY*Math.random()));
				}
			}
			catch(InterruptedException e){
				
			}
			
		};
		
		Runnable task3 = () ->
		{
			try {
				for(int i = 0; i < KROKI_DOSTAWCY; i++) {
					int amount =(int)(Math.random() * range) + minIlosc;
					zrodla.transfer(1,amount);
					magazynSurowcow.receive(amount);
					
					Thread.sleep((int)(DELAY*Math.random()));
				}
			}
			catch(InterruptedException e){
				
			}
			
		};
		Runnable task4 = () ->
		{
			try {
				for(int i = 0; i < KROKI_DOSTAWCY; i++) {
					int amount =(int)(Math.random() * range) + minIlosc;
					zrodla.transfer(1,amount);
					magazynSurowcow.receive(amount);
					
					Thread.sleep((int)(DELAY*Math.random()));
				}
			}
			catch(InterruptedException e){
				
			}
			
		};
		
		Runnable task5 = () ->
		{
			try {
				for(int i = 0; i < KROKI_DOSTAWCY; i++) {
					int amount =(int)(Math.random() * range) + minIlosc;
					zrodla.transfer(0,amount);
					magazynSurowcow.receive(amount);
					
					Thread.sleep((int)(DELAY*Math.random()));
				}
			}
			catch(InterruptedException e){
				
			}
			
		};

		
		var liniaProdukcyjna1 = new Thread(task1);
		var liniaProdukcyjna2 = new Thread(task2);
		var dostawca1 = new Thread(task3);
		var dostawca2 = new Thread(task4);
		var dostawca3 = new Thread(task5);
		liniaProdukcyjna1.setName("Producent 1");
		liniaProdukcyjna2.setName("Producent 2");
		dostawca1.setName("Dostawca 1");
		dostawca2.setName("Dostawca 2");
		dostawca3.setName("Dostawca 3");
		liniaProdukcyjna1.start();
		dostawca1.start();
		liniaProdukcyjna2.start();
		dostawca2.start();
		dostawca3.start();
		
		
	}

}
