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

//4. Napisz funkcję, która obliczy wartość wariancji bez powtórzeń zgodnie ze wzorem n!/(n-k)!  
Console.WriteLine("\nZad_4")
let WariacjaBezPowtorzen n k=
    let rec Silnia n=
        if n = 1 || n = 0 then
            1
        elif n>1 then 
            n * Silnia (n-1)
        else 
            failwith "Nie mozna obliczyc silny"

    (Silnia n)/(Silnia (n-k))

Console.WriteLine( $"Wariacja bez powtórzeń {5}!/({5}-{2})! wynosi: {WariacjaBezPowtorzen 5 2}")

//5. Napisz funkcję, która przyjmie parę liczb i określi, która z nich jest większa po podniesieniu 
//do kwadratu np. wywołanie wieksza (-5, 4) powinno zwrócić -5.
Console.WriteLine("\nZad_5")
let ZwrocWiekszaDoKwadratu (a,b) =
    if a**2.0 > b**2.0 then 
        a
    elif b > a then 
        b
    else 
        failwith "wartosci sa rowne"

    
let para = (-5.0, 4.0)
Console.WriteLine( $"Po podniesieniu do kwadratu pary ({ fst para},{snd para}) element {ZwrocWiekszaDoKwadratu para} uzyskał wiekszy kwadrat")

//6. Zdefiniuj nowy typ Lista reprezentujący listę łączoną mogącą przechowywać wartości dowolnego 
//typu. Napisz również funkcję wykorzystującą go, która będzie wczytywać z klawiatury dowolne 
//łańcuchy znaków (dopóki użytkownik nie wprowadzi łańcucha pustego). Następnie wyświetli te 
//łańcuchy w odwrotnej kolejności.
Console.WriteLine("\nZad_6")
type Lista<'a> =
    |Pusta
    |Wezel of 'a*Lista<'a>

    override this.ToString()=
        match this with
        |Wezel(glowa,ogon) -> $"{glowa} {ogon}"
        |Pusta -> "()"

let rec Wczytaj (lista:Lista<string>) :Lista<string> =
    Console.WriteLine("Wprowadz text:")
    let readLine = System.Console.ReadLine() 
    match readLine with
    | "" -> lista
    | _ -> Wczytaj (Wezel(readLine, lista))

let text = Wczytaj Pusta
Console.WriteLine($"Wczytana lista to: {text}")

let rec OdwrocListe ((lista1:Lista<string>), (lista2:Lista<string>)):Lista<string> =
    match lista1 with
    | Pusta -> lista2
    | Wezel (glowa, ogon) -> OdwrocListe(ogon,Wezel(glowa,lista2))

Console.WriteLine($"Lista odwrócona to: {OdwrocListe (text, Pusta)}")

//7. Zdefiniuj nowy typ Lista reprezentujący listę łączoną mogącą  przechowywać wartości 
//dowolnego typu. Następnie napisz funkcję, która będzie przyjmowała dwie takie listy 
//liczb całkowitych i obliczała sumę odpowiadających sobie list (1,2,3,4); (2;3;4;5)
//funkcja powinna zwrócić listę (3,5,7,9). Napisz również kod, który demonstruje 
//działanie takiej funkcji.
Console.WriteLine("\nZad_7")
let rec SumujListy (lista1 : Lista<int>, lista2 : Lista<int>) = 
    match lista1, lista2 with
    | Wezel(glowa1, ogon1), Wezel(glowa2, ogon2)->  Wezel((glowa1+glowa2), SumujListy(ogon1, ogon2))
    //jesli mogą być nierówne
    //| Wezel(glowa1, ogon1), Pusta -> Wezel(glowa1, SumujListy(ogon1, Pusta))
    //| Pusta, Wezel(glowa2, ogon2) -> Wezel(glowa2, SumujListy(Pusta, ogon2))
    |Pusta, Pusta  ->  Pusta
    //jeśli muszą być takie same
    | _  ->  failwith "nierówne listy"
let lista1 = Wezel(1,Wezel(2,Wezel(3,(Wezel(4,Pusta)))))
let lista2 = Wezel(2,Wezel(3,Wezel(4,(Wezel(5,Pusta)))))
Console.WriteLine($"{lista1} + {lista2} = {SumujListy (lista1, lista2) }")

//8. Zdefiniuj nowy typ Lista reprezentujący listę łączoną mogącą przechowywać wartości dowolnego 
//typu. Następnie napisz funkcję, która obliczy ile wyrazów na tej liście zaczyna się na literę 'a'.
//Napisz również kod, który demonstruje działanie przygotowanej funkcji.
Console.WriteLine("\nZad_8")
let rec literaA (lista:Lista<string>) =
    match lista with
    | Pusta -> 0
    | Wezel(glowa, ogon) when (glowa.ToLower())[0] ='a' -> 1+ literaA ogon
    |  Wezel(glowa, ogon) -> 0 + literaA ogon

let lista = Wezel("Ala",Wezel("ma",Wezel("psa",Wezel("Alfika",Wezel("auuu",Pusta)))))
Console.WriteLine($"{lista} -> wyrazów zaczynających się na a jest: {literaA(lista) }")

//9. Zdefiniuj nowy typ Lista reprezentujący listę łączoną mogącą przechowywać wartości dowolnego
//typu. Następnie napisz funkcję zwracającą wartość logiczną, która określi, czy wszystkie elementy
//listy spełniają określony warunek określony jako parametr. Zademonstruj jej działanie 
Console.WriteLine("\nZad_9")

//10. Zdefiniuj nowy typ danych reprezentujący drzewo binarne. Następnie napisz program, 
//który określi ile w tym drzewie było węzłów z wartością mniejszą od zadanej liczby. 
//Zademonstruj jego działanie.
Console.WriteLine("\nZad_10")
type Drzewo =
    |Puste
    |Wezel of float * Drzewo * Drzewo

    override this.ToString()=
        match this with
        |Wezel(x,l,p) -> $" {l}<{x}>{p} "
        |Puste -> "()"

let rec LWezlowMniejsza (v:float,  drzewo: Drzewo) : int =  
    match drzewo with
        |Puste -> 0
        |Wezel(wv, l, p) when wv < v -> 1 + LWezlowMniejsza (v, l) + LWezlowMniejsza (v,p)
        |Wezel(wv, l, p) -> 0 + LWezlowMniejsza (v, l) + LWezlowMniejsza (v,p)
        
        

let s = Wezel(4.0, Wezel(2.0,Wezel(1.0,Puste,Puste),Wezel(3.0,Puste,Puste)), Wezel(7.0,Wezel(6.0,Puste,Puste),Wezel(8.0,Puste,Puste)))
Console.WriteLine($"{s} => liczba wezlow mniejsza od 1 => {LWezlowMniejsza (1.0, s)}")
Console.WriteLine($"{s} => liczba wezlow mniejsza od 2 => {LWezlowMniejsza (2.0, s)}")
Console.WriteLine($"{s} => liczba wezlow mniejsza od 3 => {LWezlowMniejsza (3.0, s)}")
Console.WriteLine($"{s} => liczba wezlow mniejsza od 4 => {LWezlowMniejsza (4.0, s)}")
Console.WriteLine($"{s} => liczba wezlow mniejsza od 5 => {LWezlowMniejsza (5.0, s)}")
Console.WriteLine($"{s} => liczba wezlow mniejsza od 6 => {LWezlowMniejsza (6.0, s)}")
Console.WriteLine($"{s} => liczba wezlow mniejsza od 7 => {LWezlowMniejsza (7.0, s)}")
Console.WriteLine($"{s} => liczba wezlow mniejsza od 8 => {LWezlowMniejsza (8.0, s)}")

//11. Zdefiniuj nowy typ danych reprezentujący drzewo binarne. Następnie napisz funkcję, 
//która policzy sumę wartości w węzłach spełniających warunek określony w funkcji przekazanej 
//jako parametr. Zademnostruj jej działanie.  
Console.WriteLine("\nZad_11")
let rec SumujElementyDrzewa = function
    |Puste -> 0.0
    |Wezel(x,l,p) -> x + SumujElementyDrzewa l + SumujElementyDrzewa p
Console.WriteLine($"{s} => suma elementów tego drzewa to: {SumujElementyDrzewa s}")

//12. Zdefiniuj nowy typ danych reprezentujący drzewo binarne. Następnie napisz funkcję, która
//policzy ile węzłów spełnia warunek  określony w funkcji przekazanej jako parametr. Zademonstruj
//jej działanie.
Console.WriteLine("\nZad_12")

//13. Napisz program, który utworzy listę 100 dwuwymiarowych punktów losowych z przedziału 
//od -20 do 20. Następnie napisz program, który podzieli te punkty na dwie grupy. 
//Pierwsza powinna zawierać punkty wewnątrz okręgu o r=5 i środku w początku układu 
//współrzędnych, a druga na zewnątrz tego okręgu. Wykorzystaj funkcje modułu List.
Console.WriteLine("\nZad_13")

//14. Napisz program który utworzy listę 100 dwuwymiarowych punktów losowych z przedziału 
//od -20 do 20. Następnie napisz program, który wybierze 10 punktów, które są najbliżej 
//początku układu współrzędnych. Wykorzystaj funkcję modułu List
Console.WriteLine("\nZad_14")

//15. Napisz program, który wczytując od użytkownika liczby z klawiatury zapamięta liczby
//parzyste. (Wprowadzanie zakończ, jeżeli użytkownik poda 0). Po zakończeniu wprowadzania
//danych program powinien wyświetlić je w odwrotnej kolejności (od ostaniej do pierwszej).
Console.WriteLine("\nZad_15")
let wczytaj = fun () ->
        let rec loop = fun (n:string) ->
            Console.WriteLine($"Podaj liczbe:")
            let i = try int (Console.ReadLine() |> uint) with | _ -> 0
            if i <> 0 then 
                if i%2=0 then
                    loop (" "+i.ToString()+n)
                else
                    loop n
            else 
                n
        let s =""
        Console.WriteLine($"{loop s }")
wczytaj()

//16. Napisz program, który wczytując od użytkownika liczby z klawiatury określi ile z nich było
//parzystych. (Wprowadzenie zakończ, jeżeli użytkownik poda 0)
Console.WriteLine("\nZad_16")
let wprowadz = fun () ->
        let rec loop = fun n ->
            Console.WriteLine($"Podaj liczbe:")
            let i = try int (Console.ReadLine() |> uint) with | _ -> 0
            if i <> 0 then 
                if i%2=0 then
                    loop (1+n)
                else
                    loop n
            else 
                n
        Console.WriteLine($"{loop 0 }")
wprowadz()

//17. Zdefiniuj nowy typ danych, który będzie reprezentował liczbę zespoloną. Następnie napisz
//funkcję pozwalającą dodawać  te liczby wg. wzoru: (a1+b1*i)+(a2+ b2*i)=(a1+a2)(b1+b2)*i
Console.WriteLine("\nZad_17")
