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
    | Pierwszy 
    | Drugi 

let rec CzyPierwszaListaWieksza2 (lista1 : Lista<int>, lista2 : Lista<int>) = 
        match lista1, lista2 with
        | Wezel(glowa1, ogon1), Wezel(glowa2, ogon2) when glowa1 > glowa2 ->  Wezel(Enum.Pierwszy, CzyPierwszaListaWieksza2(ogon1, ogon2))
        | Wezel(glowa1, ogon1), Wezel(glowa2, ogon2) ->  Wezel(Enum.Drugi, CzyPierwszaListaWieksza2(ogon1, ogon2))
        | Wezel(glowa1, ogon1), Pusta -> Wezel(Enum.Pierwszy, CzyPierwszaListaWieksza2(ogon1, Pusta))
        | Pusta, Wezel(glowa2, ogon2) -> Wezel(Enum.Drugi, CzyPierwszaListaWieksza2(Pusta, ogon2))
        | Pusta, Pusta  ->  Pusta
        | _  ->  failwith "nierówne listy"

let lista3 = ListaLiczbNaturalnych 7
Console.WriteLine($"[{lista3}] > [{lista2}] = [{(CzyPierwszaListaWieksza2 (lista3, lista2))}]")

//3.16 Napisz funkcję, która sprawdzi, czy lista elementów jest posortowana. Kierunek sortowania
//(malejący lub rosnący) powinnien być zdefiniowany jako typ wyliczeniowy i przekazywany do funkcji.
Console.WriteLine("\n3.16")
type Kierunek =
    | Malejacy
    | Rosnacy

let rec CzyPosortowana (lista1 : Lista<'a>, lista2 : Lista<'a>, kierunek : Kierunek) =
    match lista1, lista2 with
    | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) when (glowa1<glowa2 && kierunek =Malejacy) -> CzyPosortowana(ogon1,(Wezel(glowa1,lista2)), kierunek)
    | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) when (glowa1>glowa2 && kierunek =Rosnacy) -> CzyPosortowana(ogon1,(Wezel(glowa1,lista2)), kierunek)
    | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) when ((kierunek = Rosnacy)|| (kierunek = Malejacy))-> false
    | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) -> failwith "Brak okreslonego kierunku"
    | Wezel (glowa1, ogon1), Pusta -> CzyPosortowana(ogon1,(Wezel(glowa1,lista2)), kierunek)
    | Pusta, Wezel (glowa2, ogon2) -> true
    | Pusta, Pusta -> true

Console.WriteLine($"[{lista3}] -> Posortowana malejąco? -> [{(CzyPosortowana (lista3, Pusta, Kierunek.Malejacy))}]")
Console.WriteLine($"[{lista3}] -> Posortowana rosnąco? -> [{(CzyPosortowana (lista3, Pusta, Kierunek.Rosnacy))}]")
Console.WriteLine($"[{lista2}] -> Posortowana rosnąco? -> [{(CzyPosortowana (lista2, Pusta, Kierunek.Rosnacy))}]")
Console.WriteLine($"[{lista2}] -> Posortowana malejąco? -> [{(CzyPosortowana (lista2, Pusta, Kierunek.Malejacy))}]")

let rec SortujListe (lista1 : Lista<'a>, lista2 : Lista<'a>, kierunek : Kierunek) =
    match lista1, lista2 with
    | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) when (glowa1>glowa2 && kierunek =Malejacy) -> SortujListe(ogon1,(Wezel(glowa1,lista2)), kierunek)
    | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) when (kierunek = Malejacy) -> SortujListe(ogon1, OdwrocListe ((Wezel(glowa1, (OdwrocListe (lista2, Pusta)))), Pusta), kierunek)
    | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) when (glowa1<glowa2 && kierunek =Rosnacy) -> SortujListe(ogon1,(Wezel(glowa1,lista2)), kierunek)
    | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) when (kierunek = Rosnacy) -> SortujListe(ogon1, OdwrocListe ((Wezel(glowa1, (OdwrocListe (lista2, Pusta)))), Pusta), kierunek)
    | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) -> failwith "Brak okreslonego kierunku"
    | Wezel (glowa1, ogon1), Pusta -> SortujListe(ogon1,(Wezel(glowa1,lista2)), kierunek)
    | Pusta, Wezel (glowa2, ogon2) -> lista2
    | Pusta, Pusta -> lista2

Console.WriteLine($"\n[{lista3}] -> sortuj malejąco -> [{(SortujListe (lista3, Pusta, Kierunek.Malejacy))}]")
Console.WriteLine($"[{lista2}] -> sortuj rosnąco -> [{(SortujListe (lista2, Pusta, Kierunek.Rosnacy))}]")

//3.17 Napisz funkcję, która będzie przyjmowała dwie posortowane listy liczb całkowitych
//(listy powinny być posortowane w tym samym kierunku).Funkcja powinna łączyć te dwie listy 
//z zachowaniem porządku
Console.WriteLine("\n3.17")
let rec PolaczPosortowane (lista1 : Lista<'a>, lista2 : Lista<'a>, lista3 : Lista<'a>) =
    if (CzyPosortowana (lista1, Pusta, Kierunek.Rosnacy)) && (CzyPosortowana (lista2, Pusta, Kierunek.Rosnacy))= true then
        match lista1, lista2 with
            | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) when (glowa1 < glowa2) -> PolaczPosortowane (ogon1, lista2, Wezel(glowa1,lista3))
            | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) -> PolaczPosortowane (lista1, ogon2, Wezel(glowa2,lista3))
            | Wezel (glowa1, ogon1), Pusta -> PolaczPosortowane (ogon1, lista2, Wezel(glowa1,lista3))
            | Pusta, Wezel (glowa2, ogon2) -> PolaczPosortowane (lista1, ogon2, Wezel(glowa2,lista3))
            | Pusta, Pusta -> OdwrocListe (lista3, Pusta)
    elif (CzyPosortowana (lista1, Pusta, Kierunek.Malejacy)) && (CzyPosortowana (lista2, Pusta, Kierunek.Malejacy)) = true then
        match lista1, lista2 with
            | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) when (glowa1 > glowa2) -> PolaczPosortowane (ogon1, lista2, Wezel(glowa1,lista3))
            | Wezel (glowa1, ogon1), Wezel (glowa2, ogon2) -> PolaczPosortowane (lista1, ogon2, Wezel(glowa2,lista3))
            | Wezel (glowa1, ogon1), Pusta -> PolaczPosortowane (ogon1, lista2, Wezel(glowa1,lista3))
            | Pusta, Wezel (glowa2, ogon2) -> PolaczPosortowane (lista1, ogon2, Wezel(glowa2,lista3))
            | Pusta, Pusta -> OdwrocListe (lista3, Pusta)
    else
        failwith "Listy nie są posortowane w tym samym kierunku"

Console.WriteLine($"[{lista}] U [{lista3}] = [{(PolaczPosortowane (lista, lista3, Pusta))}]")
let lista4 = OdwrocListe (lista3, Pusta)
Console.WriteLine($"[{lista2}] U [{lista4}] = [{(PolaczPosortowane (lista2, lista4, Pusta))}]")

//3.18 Zaimplementuj stos wykorzystując przedstawioną listę łączoną.
Console.WriteLine("\n3.18")
type Stos<'b> = 
    {
        stos: Lista<'b>
    }
    member this.Wartosc() :'b =
        match this.stos with
        | Pusta -> failwith "Pusty stos"
        | Wezel(glowa,ogon) -> glowa
        
    member this.Dodaj(glowa:'b) : Stos<'b> = 
        {stos = Wezel(glowa, this.stos)}
        
    member this.Zdejmij() : Stos<'b> =
        match this.stos with
        | Pusta -> failwith "Pusty stos"
        | Wezel(glowa,ogon) -> {stos=ogon}
        
    
let st = {stos=Pusta}.Dodaj(1).Dodaj(2).Dodaj(3)
Console.WriteLine($"{st} -> wartos -> {st.Wartosc()}")
let st2 = st.Zdejmij()
Console.WriteLine($"{st2} -> wartos -> {st2.Wartosc()}")

//3.19 Zaimplementuj mapę wykorzystując ptzedstawioną liczbę łączoną. Na liście przechowuj pary 
//elementów (klucz; wartość). Dostęp do dowolnego elementu powinien następować po podaniu klucza

//3.20 Napisz funkcję, która będzie zliczała liczbę elementów na drzewie binarnym.
Console.WriteLine("\n3.20")
type Drzewo =
    |Puste
    |WezelD of float * Drzewo * Drzewo

    override this.ToString()=
        match this with
        |WezelD(x,l,p) -> $" ({l}<{x}>{p}) "
        |Puste -> "()"

let rec ZliczElementyDrzewa = function
    |Puste -> 0
    |WezelD(x,l,p) -> 1 + ZliczElementyDrzewa l + ZliczElementyDrzewa p

let s = WezelD(4.0, WezelD(2.0,WezelD(1.0,Puste,Puste),WezelD(3.0,Puste,Puste)), WezelD(7.0,WezelD(6.0,Puste,Puste),WezelD(8.0,Puste,Puste)))
let s2 = WezelD(4.0, WezelD(2.0,WezelD(1.0,Puste,Puste),Puste), WezelD(7.0, Puste, WezelD(8.0,Puste,Puste)))
Console.WriteLine($"{s} => liczba elementów tego drzewa to: {ZliczElementyDrzewa s}")
Console.WriteLine($"{s2} => liczba elementów tego drzewa to: {ZliczElementyDrzewa s2}")

//3.21 Napisz funkcję, która oblicz sumę wartości przechowywanych w drzewie binarnym.
Console.WriteLine("\n3.21")
let rec SumujElementyDrzewa = function
    |Puste -> 0.0
    |WezelD(x,l,p) -> x + SumujElementyDrzewa l + SumujElementyDrzewa p
Console.WriteLine($"{s} => suma elementów tego drzewa to: {SumujElementyDrzewa s}")
Console.WriteLine($"{s2} => suma elementów tego drzewa to: {SumujElementyDrzewa s2}")

//3.22 Napisz funkcję pozwalającą usunąć  element z uporządkowanego drzewa binarnego.
Console.WriteLine("\n3.22")
let rec zlacz drzewo1 drzewo2 =
    match drzewo1, drzewo2 with
    |Puste, Puste -> Puste
    |Puste, WezelD (x2,l2,p2) -> drzewo2
    |WezelD (x1,l1,p1), Puste -> drzewo1
    |WezelD (x1,l1,p1), WezelD (x2,l2,p2) when (l1 = Puste) && (x2 <= x1) -> WezelD (x1,drzewo2,l2)
    |WezelD (x1,l1,p1), WezelD (x2,l2,p2) when (p1 = Puste) && (x2 >= x1) -> WezelD (x1,l1,drzewo2)
    |WezelD (x1,l1,p1), WezelD (x2,l2,p2) when x2 < x1 -> zlacz l1 drzewo2
    |WezelD (x1,l1,p1), WezelD (x2,l2,p2) -> zlacz p1 drzewo2
    
    
    
let rec UsunElementDrzewa n = function
    |Puste -> Puste
    |WezelD(x,l,p) when n = x -> zlacz l p
    |WezelD(x,l,p) when n < x -> WezelD(x,  UsunElementDrzewa n l, p)
    |WezelD (x,l,p) -> WezelD(x,l, UsunElementDrzewa n p)

Console.WriteLine($"{s} => drzewo po usunięciu 6 elementu => {UsunElementDrzewa 7 s}")

//3.23 Napisz funkcję pozwalającą określić czy w uporządkowanym drzewie binarnym 
//znajduje się podana wartość.
Console.WriteLine("\n3.23")
let rec CzyElementNaDrzewie n = function
    |Puste -> false
    |WezelD(x,l,p) when n = x -> true
    |WezelD(x,l,p) when n < x -> CzyElementNaDrzewie n l
    |WezelD(x,l,p) ->CzyElementNaDrzewie n p


Console.WriteLine($"{s} =>  czy element 5 jest na drzewie => {CzyElementNaDrzewie 5 s}")
Console.WriteLine($"{s} =>  czy element 3 jest na drzewie => {CzyElementNaDrzewie 3 s}")

//3.24 Ścieżką do węzła n w drzewie nazywamy kolekcję wszystkich węzłów prowadzących od korzenia
//do tego węzła. Przykładowo, dla drzewa z rys. 3.9, ścieżka do węzła 8.0 to {4.0, 7.0, 8.0}.
//Napisz funkcję zwracającą ścieżkę do węzła z określoną wartością ( dla uproszczenia zakładamy,
//że wartości w drzewie się nie powtarzają)
Console.WriteLine("\n3.24")
let rec Dodaj (v:float, d: Drzewo) :Drzewo =  
        match d with
        | Puste -> WezelD(v, Puste, Puste)
        | WezelD(wv, l, p) when wv <= v -> WezelD(wv, l ,Dodaj (v, p) )
        | WezelD(wv, l, p) -> WezelD(wv, Dodaj (v, l) , p )

    
let rec Sciezka (v:float, d: Drzewo) : Lista<float> =  
        match d with
        | Puste -> Pusta
        | WezelD(wv, l, p) when wv <= v -> Wezel(wv, Sciezka(v, p) )
        | WezelD(wv, l, p) -> Wezel(wv, Sciezka(v, l) )

let d = Dodaj(5, Dodaj(6,Dodaj(8,Dodaj(-10,Dodaj(2,Dodaj(3, Puste))))))    
Console.WriteLine($"{d} => scizka {6} -> {Sciezka (6, d)}")

//3.25 Napisz funkcję, która dla drzewa binarnego zwraca jego głębokość, czyli
//liczbę elementów w jego najdłuższej gałęzi.