import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.DoubleSummaryStatistics;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.Optional;

public class Lab11 {
	 public static Optional<Long> countWords(Long value) {
	        return value == 0 ? Optional.empty() : Optional.of(value);
	    }
	 
	static public void main(String[] args) throws IOException {
		
		var contents = new String(Files.readAllBytes(Paths.get("BajkaCK.txt")),StandardCharsets.UTF_8);
		List <String> words = List.of(contents.replaceAll(",", " ").replace(".", " ").replace("!", " ").replace("?", " ").split("\\s+"));
		
		Pattern pattern = Pattern.compile("\\s+");
		Map<String,Long> wordsCounts = Files.lines(Paths.get("BajkaCK.txt"))
										.flatMap(line -> pattern.splitAsStream(
												line.replaceAll(",", " ").replace(".", " ").replace("!", " ").replace("?", " ")))
										.collect(Collectors.groupingBy(String :: toUpperCase, 
												TreeMap::new, Collectors.counting()));
		
		wordsCounts.entrySet().stream().collect(
				Collectors.groupingBy(entry -> entry.getKey().charAt(0), TreeMap::new,
						Collectors.toList())).forEach((letter, wordList)->{
							System.out.printf("\nWyrazy na literę %C: ", letter);
							wordList.stream().forEach(word -> System.out.printf(
									"%s (%d) ", word.getKey(), word.getValue()));
						});
		

		DoubleSummaryStatistics summary1 = wordsCounts.entrySet().stream().mapToDouble(x -> x.getValue()).summaryStatistics();
		double numberOfWords = summary1.getSum();
		System.out.print("\n\nLiczba slow: "+ numberOfWords);
		double distinctNumberOfWords = summary1.getCount();
		System.out.print("\nLiczba roznych slow: "+ distinctNumberOfWords);
		
		DoubleSummaryStatistics summary3 = wordsCounts.entrySet().stream().mapToDouble(x -> x.getValue()*x.getKey().length() ).summaryStatistics();
		double avg = summary3.getSum()/numberOfWords;
		System.out.print("\nSrednia dlugosc slowa: " + avg);
		
		DoubleSummaryStatistics summary4 = wordsCounts.entrySet().stream().mapToDouble(x -> x.getKey().length() ).summaryStatistics();
		double min = summary4.getMin();
		System.out.print("\nMinimalna dlugosc slowa: "+ min);
		double max = summary4.getMax();
		System.out.print("\nMaksymalna dlugosc slowa : "+ max);
		
		
	
        
		System.out.println("\n\nPierwsze 10 słów tekstu (+ dlugosc poszczegolnych slow)");
		words.stream().limit(10).forEach(w -> System.out.print(w + " "));
		System.out.print("\n");
		words.stream().limit(10).forEach(w -> System.out.print(w.length() + " "));
		
		System.out.println("\n\nOstatnie 10 słów tekstu (+ dlugosc poszczegolnych slow)");
		words.stream().skip(words.size()-10).forEach(w -> System.out.print(w + " "));
		System.out.printf("\n");
		words.stream().skip(words.size()-10).forEach(w -> System.out.print(w.length() + " "));
		
		System.out.println("\n\nDlugosc Liczba_wystapien");
		wordsCounts.entrySet().stream().collect(
				Collectors.groupingBy(entry -> entry.getKey().length(), TreeMap::new,
						Collectors.toList())).forEach((l, wordLengthList)->{
							System.out.printf("\n"+l+"      "+wordLengthList.stream().mapToLong(word -> word.getValue()).sum());
						});
		
		System.out.print("\n\nSuma (laczna liczba liter): ");
		System.out.println(words.stream().mapToInt(String::length).sum());
		
		Scanner scanner = new Scanner(System.in);
        System.out.print("Podaj szukana fraze nr 1 (wielkosc liter nie ma znaczenia) : ");
        String phrase1 = scanner.next();
        Optional<Long> results =  countWords(words.stream().map(String::toUpperCase).filter(s -> s.contains(phrase1.toUpperCase())).count());
        
 		results.ifPresentOrElse(e -> {System.out.print("Fraza: %s wystepuje w tekscie"+ results.get() +"razy.\nLista slow. ");
 		words.stream().map(String::toUpperCase).filter(s -> s.contains(phrase1.toUpperCase())).forEach(s -> System.out.print(s + " "));}, 
 		() -> System.out.printf("Fraza "+phrase1+" NIE wystwpuje w tekscie"));
 		
 		System.out.print("\n\nPodaj szukana fraze nr 2 (wielkosc liter nie ma znaczenia) : ");
        String phrase2 = scanner.next();
        Optional<Long> results2 =  countWords(words.stream().map(String::toUpperCase).filter(s -> s.contains(phrase2.toUpperCase())).count());
         
  		results2.ifPresentOrElse(e -> {System.out.print("Fraza: %s wystepuje w tekscie"+ results2.get() +"razy.\nLista slow. ");
  		words.stream().map(String::toUpperCase).filter(s -> s.contains(phrase2.toUpperCase())).forEach(s -> System.out.print(s + " "));}, 
  		() -> System.out.printf("Fraza "+phrase2+" NIE wystwpuje w tekscie"));
        
        
        scanner.close();
	}

}
