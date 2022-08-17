open System
//1. Napisz funkcję, która na podstawie określonej liczby rzutów trzema kostkami obliczy 
//prawdopodobieństwo wyrzucenia kombinacji 1,2,3. Liczbę powtórzeń podaj jako parametr funkcji
Console.WriteLine("Zad_1")
let rec RzutNRazy n =
    if n > 1 then
        RzutNRazy (n-1) + (1.0/216.0) 
    elif n=1 then
        (1.0/216.0)//prawdopodobieństwo przy jednym rzucie
    else    
        0.0
let r = 100
Console.WriteLine($"Prawdopodobieństwo wyrzucenia kombinacji 1,2,3 trzema kostakami w {r} rzutach wynosi {(RzutNRazy r )*100.0} procent")

//2. Napisz funkcję rekurencyjną zamieniającą liczbę całkowitą dziesiętną na łańcuch znaków reprezentujący 
//liczbę binarną np. binarna 8    -> "1000"
Console.WriteLine("\nZad_2")
let rec Binary (c:int)  (b: string)=
    if c > 0 then
        if c%2 = 1 then 
            Binary (c/2) ("1"+b) 
        else 
            Binary (c/2) ("0"+b)
    else 
        b

let  wynik = ""
Console.WriteLine( $"8 to binarmie: {Binary 13 wynik}" )

//3. Napisz funkcję, która określi ile razy w danym łańcuchu znaków wystąpiły dowolne cyfry. 
//Przykładowo dla łańcucha "Ala 123 ma k1ota"  funkcja powinna zwrócić 4.
Console.WriteLine("\nZad_3")
let rec IleLiczbWStringu (s:string) (n:int) (r:int)=
    if n>=0 then
        if s[n] = '0' || s[n] = '1' || s[n] = '2' || s[n] = '3' || s[n] = '4' || s[n] = '5' || s[n] = '6' ||  s[n] = '7' || s[n] = '8' || s[n] = '9'  then
            IleLiczbWStringu s (n-1) (r+1)
        else
            IleLiczbWStringu s (n-1) r
    else
        r
 
let slowo = "Ala 123 ma kota"
Console.WriteLine( $"{slowo} ma: {IleLiczbWStringu slowo (slowo.Length-1) 0} cyfr." )

//4. Napisz funkcję, która przyjmie parę liczb i określi, która z nich jest większa po podniesieniu 
//do kwadratu np. wywołanie wieksza (-5, 4) powinno zwrócić -5.
Console.WriteLine("\nZad_4")
let ZwrocWiekszaDoKwadratu (a,b) =
    if a**2.0 > b**2.0 then 
        a
    elif b > a then 
        b
    else 
        failwith "wartosci sa rowne"

    
let para = (-5.0, 4.0)
Console.WriteLine( $"Po podniesieniu do kwadratu pary ({ fst para},{snd para}) element {ZwrocWiekszaDoKwadratu para} uzyskał wiekszy kwadrat")

//Zdefiniuj nowy typ Lista reprezentujący listę łączoną mogącą przechowywać wartości dowolnego typu. 
//Napisz również funkcję wykorzystującą go, która będzie wczytywać z klawiatury dowolne łańcuchy znaków 
//(dopóki użytkownik nie wprowadzi łańcucha pustego). Następnie wyświetli te łańcuchy w odwrotnej kolejności.





//F#: Napisz program, który utworzy listę 100 dwuwymiarowych punktów losowych z przedziału od -20 do 20. 
//Następnie napisz program, który podzieli te punkty na dwie grupy. Pierwsza powinna zawierać punkty wewnątrz 
//okręgu o r=5 i środku w początku układu współrzędnych, a druga na zewnątrz tego okręgu. Wykorzystaj 
//funkcje modułu List.
//Zdefiniuj nowy typ danych reprezentujący drzewo binarne. Następnie napisz program, który określi ile w tym drzewie było węzłów z wartością mniejszą od zadanej liczby. Zademonstruj jego działanie.

//F#} Napisz funkcj, która obliczy warto[ć wariancji bez powtórzeń zgodnie ze wzorem n!/(n-k)  

//{F#} Zdefiniuj nowy typ danych reprezentujący drzewo binarne. Nastpnie napisz funkcj, która policzy sum warto[ci w wzłach spełniających warunek okre[lony w funkcji przekazanej jako parametr. Zademnostruj jej działanie.  


//F#} Napisz program który utworzy list 100 dwuwymiarowych punktów losowych z przedziału -20 do 20. Nastpnie napisz program, który wybierze 10 punktów, które są najbliżej początku układu współrzdnych. Wykorzystaj funkcj modułu List