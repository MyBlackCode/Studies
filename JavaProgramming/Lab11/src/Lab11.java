import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.DoubleSummaryStatistics;
import java.util.LongSummaryStatistics;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class Lab11 {
	static public void main(String[] args) throws IOException {
		Pattern pattern = Pattern.compile("\\s+");
		Map<String,Long> wordsCounts = Files.lines(Paths.get("BajkaCK.txt"))
										.flatMap(line -> pattern.splitAsStream(line))
										.collect(Collectors.groupingBy(String :: toUpperCase, 
												TreeMap::new, Collectors.counting()));
		
		wordsCounts.entrySet().stream().collect(
				Collectors.groupingBy(entry -> entry.getKey().charAt(0), TreeMap::new,
						Collectors.toList())).forEach((letter, wordList)->{
							System.out.printf("\nWyrazy na literę %C: ", letter);
							wordList.stream().forEach(word -> System.out.printf(
									"%s (%d) ", word.getKey(), word.getValue()));
						});
		

		LongSummaryStatistics stats = wordsCounts.entrySet().stream().mapToLong(x -> x.getValue()).summaryStatistics();
		DoubleSummaryStatistics sumarry = wordsCounts.entrySet().stream().mapToDouble(x -> x.getKey().length() ).summaryStatistics();
		long numberOfWords = stats.getCount();
		System.out.printf("\nLiczba slow: "+ numberOfWords);
		double avg = sumarry.getAverage();
		System.out.printf("\nSrednia dlugosc slowa: " + avg);
		double min = sumarry.getMin();
		System.out.printf("\nMinimalna dlugosc slowa: "+ min);
		double max = sumarry.getMax();
		System.out.printf("\nMaksymalna dlugosc slowa : "+ max);
	}

}
