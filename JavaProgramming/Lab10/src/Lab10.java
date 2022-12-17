import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.time.LocalDate;

public class Lab10 {
	
	public static void main(String[] args) throws IOException
	{
		ArrayList<Fishing> fishes = new ArrayList<Fishing>();
		try {
			var contents = new String(Files.readAllBytes(Paths.get("fishing.txt")),StandardCharsets.UTF_8);
			List<String> words = List.of(contents.split(" "));
			for(int i = 6; i < words.size();i+=7){
				if((i+1) % 7 == 0)
				{
					fishes.add(new Fishing(
							LocalDate.of(Integer.parseInt(words.get(i-4)), Integer.parseInt(words.get(i-5)), 
							Integer.parseInt(words.get(i-6))),
							words.get(i-3),words.get(i-2), 
							Double.parseDouble(words.get(i-1)),
							Double.parseDouble(words.get(i))));
				}
			}
			
			//10.1
			System.out.println("Dane połowów ryb (uklad pierwotny:)");
			fishes.stream().forEach(System.out::println);
			
			//10.2
			System.out.println("\n\nDane posortowane po wędkarzu i dacie połowu:)");
			Function<Fishing, String> byFisher = Fishing::getFisher;
			Comparator <Fishing> ComparatorFisher = Comparator.comparing(byFisher);
			Function<Fishing, LocalDate> byFishingDate = Fishing::getFishingDate;
			Comparator <Fishing> ComparatorFishingDate = Comparator.comparing(byFishingDate);
			fishes.stream().sorted(ComparatorFisher.thenComparing(ComparatorFishingDate)).forEach(System.out::println);
			
			//10.3
			System.out.println("\n\nUnikatowe nazwy gatunkow ryb (alfabetycznie):");
			Comparator <Fishing> ComparatorFishName = Comparator.comparing(Fishing::getFishName);
			fishes.stream().sorted(ComparatorFishName).map(Fishing::getFishName).distinct().forEach(System.out::println);
			
			//10.4
			System.out.println("\n\nDane polowow szczupakow o wadze od 1 do 2kg. (od najnowszego polowu):");
			Predicate<Fishing> pikeRange = x -> (x.getFishWeight()>=1.0 && x.getFishWeight()<=2.0 && x.getFishName().equals("szczupak"));
			fishes.stream().filter(pikeRange).sorted(ComparatorFishingDate.reversed()).forEach(System.out::println);
			
			//10.5
			System.out.println("\n\nPolowy pogrupowane po dniu tygodnia:");
			Map<String, List<Fishing>> groupedByDayOfWeek = fishes.stream().collect(Collectors.groupingBy(Fishing::getFishingDayOfWeek));
			groupedByDayOfWeek.forEach((day, fishingInDay) -> {
			System.out.printf(" %s\n", day);
			fishingInDay.forEach( fishing ->
			System.out.printf("  %s\n", fishing)); } );
			
			//10.6
			System.out.println("\n\nLiczba ryb powyzej 50 cm:");
			Map<String, Long> fishCountByFisher =
					fishes.stream().filter(x -> x.getFishLength()>50).collect(Collectors.groupingBy(Fishing::getFisher,
					Collectors.counting()));
					fishCountByFisher.forEach( (fisher, count) ->
					System.out.printf(" Wedkarz %s zlowil %d ryb %n", fisher, count));
					
			//10.7
			double sumWeight = fishes.stream().filter(x -> (x.getFishName().equals("szczupak")||x.getFishName().equals("sandacz")))
					.mapToDouble(Fishing::getFishWeight).reduce(0, (value1, value2) -> value1 + value2);
			System.out.println("\n\nLaczna waga szczupakow i sandaczy to "+String.format("%.2f",sumWeight)+"kg");
			
			//10.8
			System.out.println("\n\nSrednia dlugosc ryb zlowionych w poszczegolne dni tygodnia");
			groupedByDayOfWeek.forEach((day, fishingInDay) -> {
				System.out.printf(" %s\n", day);
				double a = fishingInDay.stream().mapToDouble(Fishing::getFishLength).average().getAsDouble();
				long c = fishingInDay.stream().count();
				double min =fishingInDay.stream().mapToDouble(Fishing::getFishLength).min().getAsDouble();
				double max =fishingInDay.stream().mapToDouble(Fishing::getFishLength).max().getAsDouble();
				System.out.printf("  Srednia dlugosc ryb "+String.format("%.2f",a)+"cm., liczba ryb: "+ 
				c+"szt., min: "+String.format("%.2f",min)+"cm., max: "+String.format("%.2f",max)+"cm.\n");
			});
		}catch(NoSuchFileException ioe) {
			System.err.println("Uwaga! Brak pliku o podanej nazwie:" + ioe.getMessage());
        }
	}
}
