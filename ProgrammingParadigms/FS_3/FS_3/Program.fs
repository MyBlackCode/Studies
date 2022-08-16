open System

//3.1 Napisz funkcję, która generuje listę zbudowaną z n pierwszych liczb naturalnych. 
//Sygnatura funkcji powinna przyjmować następującą postać:
//nPierwszych: n:int->Lista<int>
Console.WriteLine("3.1")
type Lista<'a>=
    |Pusta
    |Wezel of 'a*Lista<'a>
    override this.ToString()=
        match this with
        |Wezel(glowa,ogon) -> $"{glowa} {ogon}"
        |Pusta -> "()"

let ListaLiczbNaturalnych n =
    let rec KolejnaLiczba = fun (i,n) -> if i <= n then Wezel(i, KolejnaLiczba ((i+1), n)) else Pusta
    KolejnaLiczba (1,n)

Console.WriteLine($"Lista zbudowana z 3 pierwszych liczb naturalnych to: [{ListaLiczbNaturalnych 3}]")

//3.2 Napisz funkcję, która generuje listę liczb całkowitych z określonego przedziału min, max. 
//Funkcja powinna również pozwalać określić krok z jakim wartości będą generowane.
//Pierwszą wartością na liście powinna być min, a ostatnia powinna być mniejssza lub równa max.
Console.WriteLine("\n3.1")
let ListaZPrzedzialu min max =
    let rec KolejnaLiczba = fun (i,a) -> if i <= a then Wezel(i, KolejnaLiczba (i+1,a)) else Pusta
    KolejnaLiczba (min,max)

let min, max = -2,3
Console.WriteLine($"Lista zbudowana z <{min},{max}> pierwszych liczb naturalnych to: [{ListaZPrzedzialu min max}]")

//3.3 Napisz funkcję, która zwróci n-ty element listy.
Console.WriteLine("\n3.3")
let rec NtyElement (lista : Lista<'a>, n :int) : ('a) = 
    match lista with
    | Pusta ->  failwith "n poza zakresem"
    | Wezel(glowa, ogon) when n > 1 -> NtyElement (ogon, n-1)
    | Wezel(glowa, ogon) -> glowa

let lista = ListaLiczbNaturalnych 5
Console.WriteLine($"Lista [{(lista)}] -> Element nr [4] tej listy ma wartość: {(NtyElement (lista, 4))}")

//3.4 Napisz funkcję, która określi czy dany element znajduje się na liście.
Console.WriteLine("\n3.4")
let rec CzyElementNaLiscie lista element =
    match lista with
    |Pusta -> false
    |Wezel(glowa,ogon) when glowa=element -> true
    |Wezel(glowa,ogon) -> CzyElementNaLiscie ogon element

Console.WriteLine($"Lista [{(lista)}] -> Czy lista posiada element o wartości 4 : {(CzyElementNaLiscie lista 4)}")

//3.5 Napisz funkcję, która określi indeks podanego elementu. Jeżeli element nie 
//znajduje się na liście zwróć odpowiednią wartość (możesz wykorzystać unie z dyskryminatorem).
Console.WriteLine("\n3.5")
let rec IndeksElementu lista element numer=
     match lista with
     |Pusta -> failwith "Nie ma takiego elementu na liscie"
     |Wezel(glowa,ogon) when glowa=element -> numer
     |Wezel(glowa,ogon) -> IndeksElementu ogon element numer+1

Console.WriteLine($"Lista [{(lista)}] -> Element o wartości 3 na tej liście ma indeks: [{(IndeksElementu lista 3 0)}]")

//3.6 Napisz funkcję, która usuwa z listy element na podanej pozycji.
Console.WriteLine("\n3.6")
let rec UsunElementN (lista : Lista<'a>, n :int) : (Lista<'a>) = 
    match lista with
    Pusta ->  failwith "n poza zakresem"
    | Wezel(glowa, ogon) when n > 1 -> Wezel(glowa, UsunElementN(ogon, n-1)) // przepisujemy początkowe elementy listy
    | Wezel(glowa, ogon) -> ogon // pomijamy element i przekazujemy resztę listy

Console.WriteLine($"[{(lista)}] -> Po usunięciu elementu nr [3]: [{(UsunElementN (lista, 3))}]")

//3.7 Napisz funkcję pozwalającą obliczyć średnią wartość na liście.
Console.WriteLine("\n3.7")
let rec Sumuj = function
    | Pusta -> 0
    | Wezel(glowa,ogon) -> glowa + Sumuj ogon

let rec liczbaElementow  = function
    |Pusta -> 0
    |Wezel(glowa,ogon) ->  1 + liczbaElementow ogon

let Srednia lista=
    let suma = Sumuj lista 
    let liczba = liczbaElementow lista
    ((float)suma)/((float)liczba)

Console.WriteLine($"[{(lista)}] -> Średnia tej listy wynosi: {Srednia lista}")

//3.8 Napisz funkcję, która pozwoli połączyć tablicę stringów w jeden łańcuch znaków. 
//Funkcja powinna przyjmować separator, który określa znak lub znaki jakimi należy
// rozdzielić poszczególne łańcuchy.
Console.WriteLine("\n3.8")
let PolaczTabliceStringow lista  (s:char) =
    let rec Zlacz lista  (s:char) =
        match lista with
            |Pusta -> "."
            |Wezel(glowa,ogon) -> glowa+ s.ToString() + Zlacz ogon s
    let lancuch = (Zlacz lista s).Remove((Zlacz lista s).Length-2,1)
    lancuch

let l =Wezel("Ala",Wezel("ma",Wezel("kota", Pusta)))
Console.WriteLine($"{PolaczTabliceStringow l ' ' }")

//3.9 Napisz funkcję, która będzie przyjmowała listę stringów oraz zwracała listę
//liczb całkowitych zawierającą długości poszczególnych łańcuchów znaków
Console.WriteLine("\n3.9")
let rec ZmienStringNaInt (lista:Lista<string>)=
    match lista with
    |Pusta -> Pusta
    |Wezel(glowa,ogon) -> Wezel(glowa.Length, ZmienStringNaInt(ogon))

Console.WriteLine($"Lista [{(l)}] -> lista zawierająca długości łańcuchów poprzedniej: {ZmienStringNaInt l}")

//3.10 Napisz funkcję, która będzie przyjmowała listę stringów oraz wyszukiwałą najdłuższy wyraz
//i najkrótszy wyraz.
Console.WriteLine("\n3.10")
let rec MaxInt list n =
    match list with
        |Pusta ->n
        |Wezel(glowa,ogon) when glowa > n -> MaxInt ogon glowa
        |Wezel(glowa,ogon) -> MaxInt ogon n

let rec MinInt list n =
    match list with
        |Pusta ->n
        |Wezel(glowa,ogon) when glowa < n -> MinInt ogon glowa
        |Wezel(glowa,ogon) -> MinInt ogon n

let NajdluzszyNajkrotszyWyraz (lista:Lista<string>)=
    let lista2 = ZmienStringNaInt lista
    let max = MaxInt lista2 0
    let min = MinInt lista2 max
    (max,min)

Console.WriteLine($"Lista [{l}] -> najdłuższe słowo ma: {fst (NajdluzszyNajkrotszyWyraz (l))} liter, a najkrótsze: {snd (NajdluzszyNajkrotszyWyraz (l))}")

//3.11 Napisz fukcję, która będzie przyjmowała listę stringów reprezentujących polskie imiona
//i zwróci tylko listę imion źeńskich
Console.WriteLine("\n3.11")
let rec FiltrujImionaZenskie (lista:Lista<string>)=
    match lista with
        | Pusta -> Pusta
        | Wezel (glowa, ogon) ->
            if glowa[glowa.Length-1]='a' then 
                Wezel(glowa, FiltrujImionaZenskie ogon)
            else 
                FiltrujImionaZenskie ogon


let imiona =Wezel("Julia",Wezel("Paweł",Wezel("Alicja",Wezel("Krystian", Wezel("Bartek", Wezel("Magda", Pusta))))))
Console.WriteLine($"Lista imon [{imiona}] -> Lista imion zenskich: [{FiltrujImionaZenskie imiona}]")

//3.12 Napisz funkcję, która będzie odracała kolejność elementów na liście.
Console.WriteLine("\n3.12")
let rec OdwrocListe (lista : Lista<'a>, odwroconaLista : Lista<'a>) : (Lista<'a>) = 
        match lista with
        | Wezel(glowa, ogon) ->  OdwrocListe(ogon, Wezel(glowa, odwroconaLista))
        | Pusta ->  odwroconaLista
        
Console.WriteLine($"{(lista)} \t [3] -> {(OdwrocListe (lista, Pusta))}")

//3.13 Napisz funkcję, która będzie przyjmowała listę stringów reprezentujących polskie
//imiona i zwróci dwie listy: osobno listę imion żeńskich oraz listę imion męskich.
Console.WriteLine("\n3.13")
let rec FiltrujImiona (lista : Lista<string>, listaZenska: Lista<string>, listaMeska: Lista<string> )=
    match lista with
        | Pusta -> (OdwrocListe (listaZenska, Pusta), OdwrocListe (listaMeska, Pusta))
        | Wezel (glowa, ogon) ->
            if glowa[glowa.Length-1]='a' then 
                FiltrujImiona(ogon, Wezel(glowa, listaZenska), listaMeska)
            else 
                 FiltrujImiona(ogon, listaZenska, Wezel(glowa,listaMeska))

Console.WriteLine($"Lista imon [{imiona}] \nLista imion żeńskich: [{fst (FiltrujImiona (imiona, Pusta, Pusta))}]")
Console.WriteLine($"Lista imion męskich: [{snd (FiltrujImiona (imiona, Pusta, Pusta))}]")

//3.14 Napisz funkcję, która będzie przyjmowała dwie listy liczb całkowitych i zwracała listę
//wartości logicznych, gdzie true określa, że liczba na pierwszej liście była większa, a false,
//że wartość na drugiej liście była większa. Jeżeli jedna lista jest dłuższa od drugiej zwróć
//wyjątek informujący o tym fakcie.
Console.WriteLine("\n3.14")
let rec CzyPierwszaListaWieksza (liata1 : Lista<int>, lista2 : Lista<int>) : (Lista<Boolean>) = 
        match liata1, lista2 with
        | Wezel(glowa1, ogon1), Wezel(glowa2, ogon2) ->  Wezel(glowa1 > glowa2, CzyPierwszaListaWieksza(ogon1, ogon2))
        | Pusta, Pusta  ->  Pusta
        | _  ->  failwith "nierówne listy"
        

let lista2 = OdwrocListe(lista, Pusta)
Console.WriteLine($"[{lista}] > [{lista2}] = [{(CzyPierwszaListaWieksza (lista, lista2))}]")

//3.15 Napisz funkcję, która będzie przyjmowała dwie listy liczb całkowitych i zwracała listę
//wartości zdefiniowanego przez ciebie typu wyliczeniowego, gdzie Pierwsza określa, że liczba
//na pierwszej liści była większa, a Druga, że wartość na drugiej liście była większa. Jeżeli 
//jedna lista się skończy, to generowanie listy  wejściowej ma trwać dalej dopóki są elementy
//na drugiej liście. W tym przypadku przyjmujemy, że istniejący element  jest większy  niż 
//nieistniejący.
Console.WriteLine("\n3.15")
type Enum =
    | Pierwszy = 'P'
    | Drugi = 'D'

let rec CzyPierwszaListaWieksza2 (liata1 : Lista<int>, lista2 : Lista<int>) = 
        match liata1, lista2 with
        | Wezel(glowa1, ogon1), Wezel(glowa2, ogon2) when glowa1 > glowa2 ->  Wezel(Enum.Pierwszy, CzyPierwszaListaWieksza2(ogon1, ogon2))
        | Wezel(glowa1, ogon1), Wezel(glowa2, ogon2) ->  Wezel(Enum.Drugi, CzyPierwszaListaWieksza2(ogon1, ogon2))
        | Wezel(glowa1, ogon1), Pusta -> Wezel(Enum.Pierwszy, CzyPierwszaListaWieksza2(ogon1, Pusta))
        | Pusta, Wezel(glowa2, ogon2) -> Wezel(Enum.Drugi, CzyPierwszaListaWieksza2(Pusta, ogon2))
        | Pusta, Pusta  ->  Pusta
        | _  ->  failwith "nierówne listy"

let lista3 = ListaLiczbNaturalnych 7
Console.WriteLine($"[{lista3}] > [{lista2}] = [{(CzyPierwszaListaWieksza2 (lista3, lista2))}]")