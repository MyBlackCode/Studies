//2. ALGEBRAICZNE TYPY DANYCH W F# 

open System
//2.1 Dany jest program w C++:
// ...
//Napisz równoważny mu program w F#
Console.Write("2.1\nPodaj wartość: ")
let wartosc = (Console.ReadLine())
match wartosc with
    | "1" -> printfn "Wprowadziles 1"
    | "2" -> printfn "Wprowadziles 2"
    | "3" -> printfn "Wprowadziles 3"
    | "4" -> printfn "Wprowadziles 4"
    | _ -> printfn "Wprowadziles inna eatosc niz 1 2 3 4" 

//2.2 Napisz funkcję, która będzie wczytywała od użytkownika dwie liczby, i zwracała je
//w formie pary. Następnie wykorzystaj dopasowanie wzorców do krotki i wyświetl na ekranie
//informacje czy pierwsza liczba z pary jest większa niż druga, czy druga jest większa 
//czy obie są równe
let WczytajOdUzytkownikaPare =
    Console.Write("\n2.2\nPodaj pierwszy element pary: ")
    let a = (int) (Console.ReadLine())
    Console.Write("Podaj drugi element pary:")
    let b = (int) (Console.ReadLine())
    (a,b)
let para = WczytajOdUzytkownikaPare
Console.WriteLine($"Para to: ({fst para},{snd para})")
match para with
   | (_, _) when (fst para) > (snd para) ->  printfn "Pierwsza liczba z pary jest wieksza niż druga"
   | (_,_) when (fst para) < (snd para) -> printfn "Druga liczba z pary jest wieksza niż pierwsza"
   | (_,_) ->  printfn "Obie liczby pary są sobie równe"

//2.3 Napisz funkcję, która jako parametry będzię przyjmowała długości trzech boków
//trójkąta oraz zwracała jego pole i obwód. Rezultat zamodeluj za pomocą pary. Wyświetl
//wynik na ekranie z komunikatem w styly "pole trójkąta to: ..., a obwód to: ...".
Console.Write("\n2.3\n")
let Triangle (a:float) (b:float) (c:float): (float*float )=
    let p = (a+b+c)/2.0
    let area = sqrt(p*(p-a)*(p-b)*(p-c))
    let perimeter = a + b + c
    (area, perimeter)
let result = Triangle 3 4 5
Console.WriteLine($"pole trójkąta to: {fst result}, a obwód to: {snd result}")

//2.4 Napisz funkcję, która będzie przyjmowała jako parametr łańcuch znaków określających
//adres email i wydziela z niego identyfikator użytkownika oraz adres domowy serwera.
Console.Write("\n2.4\n")
let email_slice (email)  =
    let len = String.length email
    let rec find i c = if len <= i || email[i] = c then i else find (i+1) c            
    let i = find 0 '@'
    (email.[0..i-1], email.[i+1..len])
    
let fu1 = fun a -> $"{a} => {email_slice a}"
Console.WriteLine(fu1 "user@example.com")

//2.5 Wykorzystaj funkcję napisaną w poprzednim zadaniu do podziału adresu na części,
//a następnie wyświetl informacje czy podany adres email należy do domeny PCz, czy nie.
//Komunikat powinien mieć formę Email użytkownika (nazwa użytkownika) należy do  domeny PCz
//lub, że niezależy. Wykorzystaj dopasowanie wzorca.
Console.Write("\n2.5\n")
let pcz_email email =
        match email_slice email with
        | (_, "pcz.pl") -> "Adres pcz"
        | _ -> "Nie adres pcz"

let fu2 = fun a -> $"{a} => {pcz_email a}"
Console.WriteLine(fu2 "user@example.com")
Console.WriteLine(fu2 "user@pcz.pl")

//2.6 Napisz funkcję obliczającą odległość Euklidesową pomiędzy dwoma punktami
//w przestrzeni 3D. Punkty zamodeluj za pomocą krotki.
Console.Write("\n2.6\n")
let EuclideanDistance3D (p1,p2,p3) (q1, q2, q3) =
    sqrt( (p1-q1)**2.0 + (p2-q2)**2.0 + (p3-q3)**2.0 )
let p = (2.0,3.0,1.0)
let q = (-2.0,1.0,7.0)
Console.WriteLine($"Odleglość Eklidesowa między dwoma punkatmi w przestrzeni 3D wynosi: {EuclideanDistance3D p q}")

//2.7 Napisz funkcję, która sprawdzi czy podany punkt znajduje się wewnątrz okęgu.
//Jako parametry powinna przyjmować środek okręgu, jego promień oraz punkt, który chcemy
//sprawdzić.
Console.Write("\n2.7\n")
let CzyPunktWOkregu ((x,y):(float*float)) (promien:float) ((a,b):(float*float))  =
    if ((x-a)**2 + (y - b)**2) <= promien**2  then
        Console.WriteLine("Punkt należy do okręgu")
        1
    else
        Console.WriteLine("Punkt nie należy do okręgu")
        0

let s = (0.0,0.0)
let r = 3.0
let point = (2.0,2.0)
let t = CzyPunktWOkregu s r point
//2.8 Napisz aplikacj, w której zdefiniujesz nowy typ danych opisujący ułamki zwykłe. 
//Napisz funkcję umożliwiające wykonywanie  podstawowych operacji artmetyczych: dodawanie,
//odejmowanie i dzielenie. Wykorzystaj krotki.
Console.Write("\n2.8\n")
let UlamekZ a b = 
    
    (a,b)

let Dodaj (x,y) (a,b)= if y=b then ((x+a),y) else failwith "Rozne mianowniki"
let Odejmij (x,y) (a,b)= if y=b then ((x-a),y) else failwith "Rozne mianowniki"
let Mnoz (x,y) (a,b)=((x*a),(y*b))    
let Dziel (x,y) (a,b)=((x*b),(y*a))

let uz1 = UlamekZ 1 2
let uz2 = UlamekZ 4 2

Console.WriteLine($"{fst uz1}/{snd uz1} + {fst uz2}/{snd uz2} = {fst (Dodaj uz1 uz2)}/{snd (Dodaj uz1 uz2)}")
Console.WriteLine($"{fst uz1}/{snd uz1} - {fst uz2}/{snd uz2} = {fst (Odejmij uz1 uz2)}/{snd (Odejmij uz1 uz2)}")
Console.WriteLine($"{fst uz1}/{snd uz1} * {fst uz2}/{snd uz2} = {fst(Mnoz uz1 uz2)}/{snd(Mnoz uz1 uz2)}")
Console.WriteLine($"{fst uz1}/{snd uz1} / {fst uz2}/{snd uz2} = {fst(Dziel uz1 uz2)}/{snd (Dziel uz1 uz2)} ")

//2.9 Napisz tę samą aplikację co powyżej, ale z wykorzystaniem rekordów.
Console.Write("\n2.9\n")
type Ulamek =
    {
        licznik:int
        mianownik:int
    }
    static member (+) (a:Ulamek, b:Ulamek) :Ulamek = 
        if a.mianownik = b.mianownik then 
           {licznik =(a.licznik + b.licznik); mianownik = a.mianownik}
        else 
            failwith "Rozne mianowniki"
    static member (-) (a:Ulamek, b:Ulamek) :Ulamek = 
        if a.mianownik = b.mianownik then 
           {licznik =(a.licznik - b.licznik); mianownik = a.mianownik}
        else 
            failwith "Rozne mianowniki"
    static member (*) (a:Ulamek, b:Ulamek) :Ulamek =  
           {licznik =(a.licznik * b.licznik); mianownik = (a.mianownik* b.mianownik)}
    static member (/) (a:Ulamek, b:Ulamek) :Ulamek =  
           {licznik =(a.licznik * b.mianownik); mianownik = (a.mianownik* b.licznik)}
    override this.ToString() = $"{this.licznik}/{this.mianownik}"
    
let u1 = {licznik = 1; mianownik = 2}
let u2 = {licznik = 4; mianownik = 2}
Console.WriteLine($"{u1}+{u2} = {u1+u2}")
Console.WriteLine($"{u1}-{u2} = {u1-u2} ")
Console.WriteLine($"{u1}*{u2} = {u1*u2} ")
Console.WriteLine($"{u1}/{u2} = {u1/u2} ")

//2.10 Napisz program, w którym zadeklarujesz nowy typ opisujący datę (dzień, miesiąć, rok),
//a następnie wykorzystasz go do określenia, jaki jest dzień tygodnia  w którym  ta data
//wypada np. jeżeli użytkownik poda 1.03.2021 program powinien odpowiedzeć poniedziałek. 
//Jako punkt wyjścia możemy przyjąć, że 1.01.1990 wypadł również w poniedziałek.
Console.WriteLine("\n2.10")
type Kalendarz = 
    {
       D:int
       M:int
       R:int
    }
    member this.Przestepny = if (this.R % 4) = 0 then 1 else 0
        // member this.Dni_wM = 
        //     match this with
        //     | {M = 2} -> 28 + this.Przestepny 
        //     | {M = m} when (m % 2) = 1 -> 31
        //     | _ -> 30
        // member this.Dni_wR = 365 + this.Przestepny
    member this.Dzien_Roku = (this.M - 1) * 31 - int ((this.M - 1) / 2) + this.D - (if this.M > 2 then 2 - this.Przestepny else 0)
    member this.Dzien_odR0 = (365 * this.R + int (this.R / 4)) + this.Dzien_Roku + this.D
    member this.Dzien_Tyg = ((this.Dzien_odR0 - {D=1;M=1;R=1990}.Dzien_odR0) % 7)
    override this.ToString() = $"{this.D:D2}-{this.M:D2}-{this.R:D4}r"

let d1 = {D=1;M=12;R=2022}
let d0 = {D=1;M=1;R=1990}
let dt = ["pn";"wt";"śr";"cz";"pt";"so";"nd"]
Console.WriteLine($"{d1} => {dt.[d1.Dzien_Tyg]} \ttest: {DateTime(2022, 12, 1).DayOfWeek}")
Console.WriteLine($"{d0} => {dt.[d0.Dzien_Tyg]} \ttest: {DateTime(1990, 1, 1).DayOfWeek}")

//2.11 Napisz funkcję realizującą bezpieczne dzielenie. Funkcja powinna przyjmować dwie
//liczby, które chcemy podzielić. Jeżeli jest to możliwe to funkcja powinna zwracać wynik
//dzielenia, a jeżeli nie komunikat "Nie można dzielić przez 0". Jaki będzie najlepszy typ 
//do reprezentowania  rezultatu takiej funkcji.
Console.WriteLine("\n2.11")
type OpResult =
   | Float of float
   //| Single
   | OpError of string
   static member (/) (a:OpResult, b:OpResult) :OpResult = 
       match (a,b) with
       | (Float a,Float b) -> if b = 0 then OpError $"->({a}/{b})<- Error: Dzielimy przez zero!" else Float (a / b)
       | _ -> OpError $"{a}/{b}" 
   override this.ToString() = 
       match this with
       | Float a -> $"{a}"
       | OpError a -> $"{a}"
    
let a = Float 0
let b = Float 1
let c = Float 5
Console.WriteLine($"{b}/{a} = {b/a}")
Console.WriteLine($"{b}/{c} = {b/c}")
Console.WriteLine($"{b}/{c}/{c} = {b/c/c}")
Console.WriteLine($"{b}/{a}/{c} = {b/a/c}")
Console.WriteLine($"({b}/{a})/({c}/{a}) = {(b/a)/(c/a)}")

//2.12 Zdefiniuj odpowiedni typ danych do przechowywania informacji zakodowanych w numerze VIN 
//(Vehicle Identification Number), a następnie napisz program pozwalający dekodoweać  ten numer.
//Informacje o VIN możesz zaczerpną np. z Wikipedii https://pl.wikipedia.org/wiki/Vehicle_Identification_Number
Console.WriteLine("\n2.12")
type VIN =
    { // nie stosuje się I, O oraz Q, ponadto zwyczajowo nie stosuje się liter U i Z oraz cyfry 
        WMI:string// 1 do 3
        VDS:string// 4 do 9
        VIS:string//od 10 do 17
    }

//2.13 Napisz funkcje, która jako parametry będzie przyjmowała długości trzech boków trójkąta  
//oraz zwraca jego pole i obwód. Rezultat zamodeluj za pomocą pary. Wyświetl wynik na ekranie 
//z komunikatem w stylu "pole trójkąta to: ..., a obwód to: ... ". Jeżeli z podanych wartości 
///nie da się stworzyć trójkąta, to zwróć komunikat "Z podanych wartości nie da się zbudować 
//trójkąta"
Console.WriteLine("\n2.13")
let Czy_trojkat (a:float) (b: float) (c:float) = 
        if (a+b>c && a+c>b && b+c>a) then 
            true
        else 
            false

let Triangle2 (a:float) (b:float) (c:float): (float*float )=
    if Czy_trojkat a b c then
        let p = (a+b+c)/2.0
        let area = sqrt(p*(p-a)*(p-b)*(p-c))
        let perimeter = a + b + c
        (area, perimeter)
    else
        failwith "Z podanych wartości nie da się zbudować trójkąta"
let result2 = Triangle2 3 4 5
Console.WriteLine($"pole trójkąta to: {fst result}, a obwód to: {snd result}")

//2.14 Napisz program, który będzie wczytywał od użytkownika współczynniki a, b, c rówanania
// kwadratowego ax^2bx+c=0 rozpatrz wszystkie możliwe przypadki. Zamodeluj je za pomocą uni 
//z dyskryminatorem. Po obliczeniach wyświetl odpowiednie komunikaty.
Console.Write("\n2.14\n")


type Rozwizania =
| DwaRozwiazania of x1:float*x2:float
| JednoRozwiazanie of x:float
| BrakRozwiazania 

let RownanieKwadratowe =
    Console.Write("Podaj współczynnik a:")
    let a = (float)(Console.ReadLine())
    Console.Write("Podaj współczynnik b:")
    let b = (float)(Console.ReadLine())
    Console.Write("Podaj współczynnik c:")
    let c = (float)(Console.ReadLine())
    Console.WriteLine($"{a}x^2+{b}x+{c}")
    let delta = (float)((b**2.0) - (4.0*a*c))

    match delta with
    |_ when delta > 0.0 -> DwaRozwiazania((-b-delta)/(2.0*a),(-b+delta)/(2.0*a)) 
    |0.0 -> JednoRozwiazanie((-b)/(2.0*a))
    |_ -> BrakRozwiazania

let wr = RownanieKwadratowe
Console.WriteLine($"Wynik równania kwadratowego to {wr}")


//2.15 Napisz program, który będzie pozwalał przechowywać następujące informadcje o osobie: 
//imie, nazwisko, wiek. Przygotuj odpowiedni typ danych. Napisz program, który będzie 
//pozwalał na wprowadzenie informacji o osobie, modyfikowanie ich oraz wyświetlanie.
//Po uruchomieniu programu użytkownik powinien zobaczyć menu:
//WYBIERZ OPCJE
//1 - utworzenie rekordu
//2 - modyfikowanie rekordu
//3 - pokaz rekord
//4 - zakoncz rekord
//Po wybraniu odpowiedniej opcji użytkownik powinien mieć możliwość wprowadzenia danych
//()rekordurogram powinien wyświetlać informacje o jakie dane prosi użytkownika), lub
//ich zobaczenia. Podczas  modyfikowania danych  jeżeli użytkownik wprowadzi łąńcuch 
//pusty (w przypadku wieku) program powinienen zachowywać wcześniejsze dane. Po zakańczeniu
//wprowadzania lub przeglądania danych oraz w przypadku, gdy użytkownik wybierze inną opcję 
//niż od 1 do 4 program powinien wracać do menu głównego. Wykorzystaj dopasowanie wzorców.

Console.WriteLine("\n2.15")
    // piekne to nie jest bo rekurencyjnie, ale pętli jeszcze nie było
type Osoba = 
    {
        Imie:string
        Nazwisko:string
        Wiek:uint
    }
    
    
    override this.ToString() = $"({this.Imie} {this.Nazwisko} {this.Wiek})"

type Dane =
    | DaneOsoby of Osoba
    | Empty
    

let Program () =
    let GetValues = fun (text:string) -> 
        Console.WriteLine(text)
        Console.ReadLine().Split(' ', StringSplitOptions.TrimEntries)
    let GetCmd = fun () ->  
        let args = GetValues "Opcje:\n1 - utworzenie rekordu\n2 - edycja rekordu\n3 - pokaz rekord\n4 - zakończ"
        try (args[0] |> int) with | _ -> 0
    let GetOsosba = fun () ->
        let args = GetValues ("Podaj dane rekordu:\n imie nazwisko wiek")
        try DaneOsoby {Imie=args[0];Nazwisko=args[1];Wiek=args[2]|>uint}with | _ -> Empty
    let rec CmdLoop = fun (data:Dane) ->
        match GetCmd() with
        | 1 -> CmdLoop(GetOsosba())
        | 2 -> 
            match data with 
            | DaneOsoby s -> CmdLoop(GetOsosba())
            | Empty -> 
                Console.WriteLine("Brak danych, edycja przerwana")
                CmdLoop(data)
        | 3 -> 
            Console.WriteLine(data)
            //CzyPelnoletnia data //Aby działało trzeba przenieść funkcję z zadania 16 nad funkcję program
            CmdLoop(data)
        | 4 -> Console.WriteLine("Exit")
        | _ -> 
            Console.WriteLine("Błędny parametr")
            CmdLoop(data)
    CmdLoop(Empty)
Program ()

//2.16 Zmodyfikuj poprzednie zadanie, tak aby wyświetlając dane wprowadzonej osoby pojawiła się
// informacja  czy jest ona pełnoletnia, czy nie. Wykorzystaj dopasowanie wzorca do rekordu.
Console.WriteLine("\n2.16")
let dane = (DaneOsoby) {Imie="Paulina"; Nazwisko="Młynarczyk"; Wiek=22u}
let CzyPelnoletnia  =
    function
    |Empty -> Console.WriteLine("Brak danych")
    |DaneOsoby (dane) ->
        match dane with
        | {Wiek=wiek} when wiek>=18u -> Console.WriteLine("Osoba pełnoletnia")
        | _ -> Console.WriteLine("Osoba niepełnoletnia")
Console.WriteLine($"{dane}")
Console.WriteLine($"{CzyPelnoletnia dane}")