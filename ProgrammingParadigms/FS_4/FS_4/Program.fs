open System
open System.IO

//4.1 Na poprzednich zajęciach tworzyliśmu listę od podstaw. Napisz funkcję wyższych rzędów
//mapuj, która będzie dokonywałą dowolnego mapowania. Sposób zamiany elementów zdefiniuj jako
//parametr funkcji mapuj.
Console.WriteLine("4.1")
type Lista<'a> = 
        | Pusta
        | WezelL of 'a*Lista<'a>

        override this.ToString()=
            match this with
            |WezelL(glowa,ogon) -> $"{glowa} {ogon}"
            |Pusta -> "()"

    
let nPierwszych (n) = 
    let rec recur = fun (i, n) -> if i < n then WezelL(i, recur (i+1, n)) else Pusta
    recur (0 ,n)


let rec mapuj map_fun = function
    | Pusta -> Pusta
    | WezelL(v, n) -> WezelL(map_fun v, mapuj (map_fun) n)

//Example1
let list = nPierwszych (5)
let list2 = mapuj (fun x -> x * x) list
Console.WriteLine($"{list}    fun x -> x * x    {list2}")

//Example2
let fff = fun x -> x |> float
let list3 = mapuj fff list2
Console.WriteLine($"{list2}    fun x -> x |> float    {list3}")
    
//Example3
type TTT = {abc:int}
let list4 = mapuj (fun x -> {abc=x} ) list2
Console.WriteLine($"{list2}    fun x -> abc=x     {list4}")

//4.2 Napisz funkcję wyższych rzędów, która pozwoli dokonać dowolnej agregacji elementów
//zapisanych w drzewie.
Console.WriteLine("\n4.2")
type Drzewo<'a> = 
    | Puste
    | Wezel of 'a*Drzewo<'a>*Drzewo<'a>
    override this.ToString()=
        match this with
        |Wezel(x,l,p) -> $" ({l}<{x}>{p}) "
        |Puste -> "()"
    
let rec Dodaj (v:'a, d: Drzewo<'a>) :Drzewo<'a> =  
    match d with
    | Puste -> Wezel(v, Puste, Puste)
    | Wezel(wv, l, p) when wv <= v -> Wezel(wv, l ,Dodaj (v, p) )
    | Wezel(wv, l, p) -> Wezel(wv, Dodaj (v, l) , p )

let rec agregacja (agr_fun, agr_val) = function
| Puste -> agr_val
| Wezel(v, l, p) -> 
     let val_1 = (agr_fun agr_val v)
     let val_2 = agregacja (agr_fun, val_1) l
     agregacja (agr_fun, val_2) p

let drzewo = Dodaj(5, Dodaj(10,Dodaj(2,Dodaj(3, Puste))))  
let run = fun f -> agregacja (f, 0) drzewo
Console.WriteLine($"{drzewo}\t(+) -> {run(+)}")
Console.WriteLine($"{drzewo}\t(-) -> {run(-)}")
Console.WriteLine($"{drzewo}\t(/) -> {run(fun v wynik->v*2+wynik)}")

let wynik_string = agregacja ((fun a b -> $"{b} <-> {a}"), "") drzewo
Console.WriteLine($"{drzewo}\t(str) -> {wynik_string}")

//4.3 Napisz funkcję wyższych rzędów, która sprawdzi, czy w drzewie umieszczona jest wartość
//spełniająca warunek przekazany jako parametr.
Console.WriteLine("\n4.3")
let rec zlacz drzewo1 drzewo2 =
    match drzewo1, drzewo2 with
    |Puste, Puste -> Puste
    |Puste, Wezel (x2,l2,p2) -> drzewo2
    |Wezel (x1,l1,p1), Puste -> drzewo1
    |Wezel (x1,l1,p1), Wezel (x2,l2,p2) when (l1 = Puste) && (x2 <= x1) -> Wezel (x1,drzewo2,l2)
    |Wezel (x1,l1,p1), Wezel (x2,l2,p2) when (p1 = Puste) && (x2 >= x1) -> Wezel (x1,l1,drzewo2)
    |Wezel (x1,l1,p1), Wezel (x2,l2,p2) when x2 < x1 -> zlacz l1 drzewo2
    |Wezel (x1,l1,p1), Wezel (x2,l2,p2) -> zlacz p1 drzewo2

let Filtruj  filtr drzewo =
     let rec Filtruj = function
        |Puste -> Puste
        |Wezel (x,l,p) when filtr(x) -> Wezel(x,Filtruj l, Filtruj p)
        |Wezel (x,l,p) -> Filtruj (zlacz l p)

     Filtruj drzewo 

Console.WriteLine($"{drzewo}    fun x->x modulo 2    {Filtruj (fun x->x%2=0) drzewo}")
//4.4 Napisz funkcję, która przyjmuje listę F# i buduje z niej drzewo binarne.
Console.WriteLine("\n4.4")

let rec lista_na_drzewo (d:Drzewo<'a>) = function
    | [] -> d
    | v::n -> lista_na_drzewo (Dodaj ( v, d )) n
  
let lista = [1;2;-5;4;9;-1]
let drzewko = lista_na_drzewo Puste lista
Console.WriteLine($"{lista} => {drzewko}")

//4.5 Napisz funkcję, która jako parametr przyjmuje uporządkowane drzewo binarne i zwraca listę F#.
Console.WriteLine("\n4.5")
let rec drzewo_na_liste (d:List<'a>) = function
    | Puste -> d
    | Wezel(x,l,r) ->  drzewo_na_liste (x::d) (zlacz l r)

let l = drzewo_na_liste [] drzewko
Console.WriteLine($"{drzewko} => {l}")

//4.6 Stwórz listę losowych liczb całkowitych zawierającą wartości z przedziału od -10 do 10. 
// Następnie wykorzystaj funkcje modułu List w celu podzielenia tej listy na dwie części:
//pierwszą zawierającą wartości dodatnie, drugą zawierającą wartości ujemne. Z jakich funkcji
//możesz skorzystać, aby zrealizować to zadanie.
Console.WriteLine("\n4.6")

let rec DwieCzesci l l1 l2 =
    match l with
    |[] -> (l1,l2)
    |glowa::ogon when glowa >= 0 -> DwieCzesci  ogon  (glowa::l1) l2
    |glowa::ogon -> DwieCzesci  ogon l1 (glowa::l2) 
    

let a  = new Random()
let lista1 = List.init 5 (fun i->a.Next(-10,10))
Console.WriteLine($"{lista1} dodatnie: {fst (DwieCzesci lista1 [] [])}, ujemne: {snd (DwieCzesci lista1 [] [])} ")

//4.7 Stwórz listę losowych liczb całkowitych zawierającą wartości z przedziału od -10 dp 10.
//Następnie wykorzystaj funkcję modułu List w celu podzielenia tej listy na dwie części:
//pierwszą zawierającą wartości powyżej średnej, drugą zawierającą wartości poniżej średniej.
//Z jakich funkcji możesz skorzystać, aby zrealizować to zadanie.
Console.WriteLine("\n4.7")
let rec Suma lista =
    match lista with
    |[] -> 0
    |glowa::ogon -> glowa + Suma ogon

let Srednia  (lista:List<int>) = 
    (float)(Suma lista)/(float)(lista.Length)


let rec DwieCzesci2 (l:List<int>) (l1:List<int>) (l2:List<int>) (srednia:float)=
    match l with
    |[] -> (l1,l2)
    |glowa::ogon when (float) glowa > srednia  -> DwieCzesci2  ogon  (glowa::l1) l2 srednia
    |glowa::ogon -> DwieCzesci2  ogon l1 (glowa::l2) srednia
    
Console.WriteLine($"{lista1} srednia to: {Srednia lista1} część listy powyżej średniej: {fst (DwieCzesci2 lista1 [] [] (Srednia lista1))}, poniżej: {snd (DwieCzesci2 lista1 [] [] (Srednia lista1))} ")

//4.8 Wczytaj plik "zad8.txt". Zawiera on zestaw współczynników dla równania kwadratowego
//(każde równanie jest opisane w osobnym wierszu).
Console.WriteLine("\n4.8")
File.WriteAllText("Zad4_8.txt", "1 5 3\n4 3 1\n7 1 4\n8 7 0")

    
let redFile = fun fnam -> 
    let lines_to_points = fun (l:String) -> 
        let l = l.Split(' ')
        (l.[0]|>float),(l.[1]|>float),(l.[2]|>float)
    Seq.toList( Seq.map lines_to_points (File.ReadLines fnam) )

let parametry = redFile "Zad4_8.txt"
Console.WriteLine($"parametry -> {parametry}")

    // axx+bx+c -> delta > 0 = dwa rozwiazania, delta = 0 jedno, delta < 0 - brak
let delta = fun (a, b, c) -> b*b - 4.*a*c

let dwa_rozwiazania = List.filter (fun abc -> delta abc > 0) parametry  
let jedno_rozwiazanie = List.filter (fun abc -> delta abc = 0) parametry  
let zero_rozwiazan = List.filter (fun abc -> delta abc < 0) parametry  
Console.WriteLine($"jedno -> {jedno_rozwiazanie}")
Console.WriteLine($"dwa -> {dwa_rozwiazania}")
Console.WriteLine($"zero -> {zero_rozwiazan}")

//4.9 Wczytaj plik "zad9.txt. W każdym wierszu zawiera on współrzędne punktu na płaszczyźnie
//dwuwymiarowej. Oblicz odległości pomiędzy dowolnymi dwoma punktami, a następnie zapisz do pliku
//"rozwiązanie9.txt" pary tych punktów wraz z odległościami pomiędzy nimi posortowane rosnoąco
//względem odległości.
Console.WriteLine("\n4.9")
//4.10 Napisz program podobny do przedstawionego w punkcie 1.8 tylko podziel punkty na dwie części.
//Osobno te które są wewnątrz okręgu oraz te które są poza nim. Zapisz wynik do dwóch osobnych 
//plików. Wykorzystaj plik "zad9.txt"
Console.WriteLine("\n4.10")
//4.11 Wczytaj plik "iris.txt".Opisuje on trzy gatunki kwiató irysa: Setosa, Versicolour
//i Virginica. Każdy kwiat jwst opisany za pomocą czterech liczb określających odpowiednio: 
//długości listka kwiatu, szerokość listka kwiatu, długość płatka i szerokość.
Console.WriteLine("\n4.11")
//4.12 Wczytaj plik "iris.txt". Podziel dane  na osobne grupy zgodnie z gatunkami kwiatu, 
//a następnie dla każdej grupy osobno wyznacz w każdej kolumnie wartość minimalną, maksymalną
//oraz średnią.
Console.WriteLine("\n4.12")
//4.13 Stwórz listę losowych liczb całkowitych zawierającą wartości z pzredziału  od -10 do 10
//(niech lista  zawiera ok 1000 elementów). Określ ile razy każda z tych wartości wystąpiłą 
//na liście. Wyniki przedstaw jako mapę, gdzie kluczem jest liczba od - 10 do 10, a wartością
//liczba wystąpień tej liczby.
Console.WriteLine("\n4.13")
let rand_lsit = [for i in 1..1000 -> a.Next(-10, 10)]
Console.WriteLine($"rand: {rand_lsit}")

let count = fun v -> (List.filter (fun i -> i = v) rand_lsit).Length
let map = Map.ofList([for i in -10..10->(i, count i)])
Console.WriteLine($"map: {map}")

//4.14 Wczytaj plik "iris.txt". Dla każdej kolumny wyznacz jej histogram, a następnie zrób 
//to samo, ale dla każdego gatunku kwiatu osobno.
Console.WriteLine("\n4.14")