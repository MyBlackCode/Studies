open System
open System.Numerics
open Cipher

[<Measure>] type F
[<Measure>] type C
//1.15
type F with
       static member toC = fun (t:float<F>) -> (t - 32.<F>) * 5.<C>/9.<F>
//1.16
type C with
       static member toF = fun (t:float<C>) -> t * 9.<F>/5.<C> + 32.<F>


[<EntryPoint>]
let main argv =
    //PROSTE FUNKCJE///////////////////////////////////////////////////////////////////////////////////////////////
   Console.WriteLine("PROSTE FUNKCJE ///////////////////////////////////////////////////////////////////////////")
    //1.1 Napisz funkcję obliczającą pole koła
   let pole_kola =  
        System.Console.Write("1.1\nPodaj promien kola: ")
        let r = (float)(System.Console.ReadLine())
        System.Math.PI * r ** 2
   Console.WriteLine($"Pole to: {pole_kola}")

   //1.2 Napisz funkcję wyznaczającą wartość pierwiastków równania kwadratowego
   let miejsca_zerowe_funkcji (a:float) (b:float) (c:float) =
        //Wypisuje rownanie
        Console.WriteLine($"Równanie kwadratowe:{a}*x^2+({b}*x)+({c})")
        //obliczam delte
        let d = b**2 - (4.0 * a * c)
        //obliczam pierwiastki
        if (d>=0.0) then
            let z1 = (float)(-b-sqrt(d))/(2.0*a)
            let z2 =(float)(-b+sqrt(d))/(2.0*a)
            if(z1=z2) then
                printf $"Miejsce zerowe to: {z1}\n\n"
            else
                printf $"Miejsca zerowe to: {z1}; {z2}\n\n"
        else
            printf "Rozwiazanie ukladu rownan nie istnieje w ukladzie liczb rzeczywistych\n\n" 
    
   System.Console.WriteLine("\n1.2")
   miejsca_zerowe_funkcji 2 4 2
   miejsca_zerowe_funkcji 2 5 2
   miejsca_zerowe_funkcji 2 2 2
    
   //1.3 Napisz funkcję, która sprawdzić czy z trzech podanych liczb rzeczywistych, da sie zbudowac trojkat
   let Czy_trojkat (a:float) (b: float) (c:float) = 
        if (a+b>c && a+c>b && b+c>a) then 
            true
        else 
            false
   
   System.Console.WriteLine("\n1.3")
   Console.WriteLine($"Czy z podanych boków da się zbudować trójkąt: {Czy_trojkat 3.0 4.0 5.0}")
    
   //1.4 Napisz funkcję, która obliczy pole trójkąta, na podstawie długości jego boków. Jeżeli z podanych 
   //wartości nie da się zbudować trójkąta rzuć wyjątek z odpowiednia wiadomoscia
   let Pole_trojkata a b  c =
        if (Czy_trojkat a b c) then
            let p :float = (float) (0.5 * (a+b+c))
            let s: float = (float) (sqrt(p*(p-a)*(p-b)*(p-c)))
            s
        else 
            failwith "Z podanych bokow nie  da sie zbudowac trójkata"
   
   System.Console.WriteLine($"\n1.4 \nPole trojkata wynosi: {Pole_trojkata 3 4 5}")
    
   
   //REKURENCJA///////////////////////////////////////////////////////////////////////////////////
   Console.WriteLine("\nREKURENCJA ///////////////////////////////////////////////////////////////////////////")
   //1.5 Napisz funkcje, ktora rekurencyjnie oblicza sume n pierwszych liczb naturalnych
   let rec SumaN  n =
        if(n=1) then 
            n
        else
            SumaN(n-1)+(n)
   
   Console.Write("1.5\n")
   let n = 4
   Console.WriteLine($"Suma {n} naturalnych to:{SumaN(n)}")

   //1.6 Napisz funkcje ktora wyznaczy wartosc x^n pzy zalozeniu ze obie liczby sa naturalne
   let rec  XpowN (x: int) (n: int) :int =
        if (n=1) then
            x
        else
            XpowN x (n-1) * x
   System.Console.WriteLine("\n1.6")
   Console.WriteLine($"Wynik potegowania to: {XpowN 5 3}")

   //1.7 Napisz funkcje wyznaczającą n_ty wyraz ciagu fibonnaciego
   let rec fib n = 
     match n with
     |0 | 1 -> n
     | n -> fib (n-1) + fib (n-2)

   Console.WriteLine("\n1.7")
   Console.WriteLine($"Wartosc {4} ciagu  fibonnaciego to: {fib(4)}")

   //1.8 Napisz funkcję, która dla dowolnych liczb całkowitych n i k obliczy wartość 
   //dwumianu Newtona k= zdefiniowanego w sposób rekurencyjny
   let DwumianNewtona = fun(n, k) ->
        let rec loop = function
            | (n,k) when k = 0 || k = n -> 1
            | (n,k) when 0 < k && k < n -> loop((n-1), k) + loop((n-1), (k-1))
            | _ -> 0
        loop (n, k)

   let DwumianNewtona2 n k =
    let rec loop n k =
        if k = 0 || k = n then
            1
        elif 0 < k && k < n then
            (loop (n-1) k) + (loop (n-1) (k-1))
        else
            0
    loop n k

   Console.WriteLine("\n1.8")
   let str = fun n k fn -> $"(n:{n}|k:{k}) = {fn(n,k)}"
   Console.WriteLine(str 3 1 DwumianNewtona)
   Console.WriteLine(str 4 2 DwumianNewtona) 
    
   //1.9  Napiesz funkcję, która rekurencyjnie  sprawdza, czy dana liczba jest liczbą pierwszą.
   let  rec LiczbaPierwsza c cp =
        if ((c%cp) <> 0)&&(cp<c) then
            LiczbaPierwsza c (cp+1)
        else 
            if c = cp then
                true
            else
                false
            
   Console.Write("\n1.9")
   let lpp = 2 //!!! ,usi byc stala ze wzgledu na wzor
   Console.Write($"\nLiczba {n}")
   if (LiczbaPierwsza n lpp) then
        Console.WriteLine(" jest liczbą pierwszą")
   else 
        Console.WriteLine(" nie jest liczbą pierwszą")

   //1.10 Napisz funkcję, która  na podstawie 1000 rzutów  kostką do gry 
   //określi prawdopodobieństwo wyrzucenia szóstki
   Console.WriteLine("\n1.10")
   let rec Rzut1 n =
        if n > 1 then
            Rzut1 (n-1) + (1.0/6.0) 
        elif n=1 then
            (1.0/6.0)
        else    
            0.0
   let r = 1000
   Console.WriteLine($"Prawdopodobieństwo wyrzucenia 6 jedną kostką w {r} rzutach wynosi {(Rzut1 r )*100.0} procent")
   //1.11 Napisz funkcję, która  na podstawie 1000 rzutów  dwiema kostkami do gry 
   //określi prawdopodobieństwo wyrzucenia dwóch szóstek.
   Console.WriteLine("\n1.11")
   let rec Rzut2 n =
        if n > 1 then
            Rzut2 (n-1) + (1.0/36.0) 
        elif n=1 then
            (1.0/36.0)
        else    
            0.0
   Console.WriteLine($"Prawdopodobieństwo wyrzucenia dwóch 6 dwoma kostakami w {r} rzutach wynosi {(Rzut2 r )*100.0} procent")

   //1.12 Napisz funkcję określającą największy wspólny dzielnik.
   Console.WriteLine("\n1.12")
   let rec nwd n m =
        if n = m then 
            n 
        else 
            if n > m then 
                nwd (n - m) m 
         
            else 
                nwd n (m - n)

   Console.WriteLine($"Najwiekszy wpólny dzielnik to: {nwd 12 7}")

   //1.13 Oblicz przybliżoną wartość szeregu nieskończonego. Zatrzymaj obliczenia 
   //kiedy wartość bezwzględna kolejnego elementu w szeregu będzie mniejsza niż 
   //ustalona dokładność
   Console.WriteLine("\n1.13")
   let rec silnia = fun n -> if n < 2 then 1 else n * silnia (n - 1)
   let fun1 = fun (i:int) -> 1./(float i)**2.
   let fun2 = fun (i:int) -> ((-1.)**i)/(float (silnia i)) 
   let fun3 = fun (i:int) -> 1. / (float (i*(i+1))) 
   let fun4 = fun (i:int) -> ((-2.)**i)/(float (silnia i)) 

   let e = 10.**(-5)
   let Szereg = fun e fu ->
        let rec loop = fun (i:int) -> 
            let v = fu i 
            if abs v < e then 0. else v + loop (i+1)
        loop 1
    
   let print = fun f n -> $"{n} => {Szereg e f}" 
   Console.WriteLine(print fun1 (nameof fun1))
   Console.WriteLine(print fun2 (nameof fun2))
   Console.WriteLine(print fun3 (nameof fun3))
   Console.WriteLine(print fun4 (nameof fun4))

   //1.14 Napisz powyższe funkcje z wykorzyaniem referencji ogonowej
        //1.5 rekurencja ogonowa
   let rec SumaNO  (n:bigint)  (a:bigint) =
        if n=1I then 
            a+1I
        else
            SumaNO (n-1I) (n+a)
   
   Console.Write("\n1.14\n*1.5(rekurncja ogonowa)\n")
   let  m =  new BigInteger(4);
   Console.WriteLine($"Suma {m} naturalnych to:{SumaNO m 0I }")
        //1.6 rekurencja ogonowa
   let rec  XpowNO  =  fun (x: bigint)  (n:bigint) (a: bigint) -> if n = 0I then  a else XpowNO x (n-1I) (x*a)
   System.Console.WriteLine("\n*1.6(rekurencja ogonowa)")
   Console.WriteLine($"Wynik potegowania to: {XpowNO 4I 3I 1I}")

   //JEDNOSTKI MIARY///////////////////////////////////////////////////////////////////////////////////////////////
   Console.WriteLine("\nJEDNOSTKI MIARY ///////////////////////////////////////////////////////////////////////////")
   //1.15 Napisz funkcję zamieniającą temperaturę wyrażoną w stopniach Celcjusza na temperaturę wyrażoną 
   //w stopniach Fahrenheita z poniższym wzorem:
   //T(Fahrenheit) = 32 + 9/5 * T( Celcjusza)
   //Zdefiniuj wymagane jednostki miary oraz odpowiedni konwerter
   Console.Write("1.15\n")
   //Missing code in lines 7
   let f = 63.5<F>
   Console.WriteLine($"{f}F -> {F.toC(f)}C")

   //1.16 Napisz funkcję dokonującą odwrotnej transformacji
   Console.Write("\n1.16\n")
   //Missing code in lines 10
   let c = 33.5<C>
   Console.WriteLine($"{c}C -> {C.toF(c)}F")

   //ŁAŃCUCHY ZNAKÓW///////////////////////////////////////////////////////////////////////////////////////////////
   Console.WriteLine("\nŁAŃCUCHY ZNAKÓW ///////////////////////////////////////////////////////////////////////////")
   //1.17 Napisz funkcję, która sprawdzi czy dane słowo jest palidronem
   Console.Write("1.17\n")
   let CzyPalindrom text = 
        text.ToString() = (text.ToString() |>Seq.rev  |> String.Concat)
      
   if CzyPalindrom "kajak" then
        Console.WriteLine("Wyraz jest palidronem")
   else
        Console.WriteLine("Wyraz nie jest palidronem")
    
 
   //1.18 Napisz funkcję, która policzy ile razy w podanym tekście wystąpił określony znak 
   Console.Write("\n1.18\n")
   let rec Zlicz (n:string) (m:char) (size: int) =
        if size >= 0 then
            if n.ToLower()[size]=m || n[size]= m then
               1 + Zlicz n m (size-1)  
            else
               0 + Zlicz n m (size-1)
        else
            0
                
   let w = "Alicja przy kazdej mozliwej okazji szukala przygod"
   let s ='a'
   Console.WriteLine($"Znak \"{s}\" wystapil w tekscie: {Zlicz w s (w.Length-1)} razy")

   //1.19 Napisz funkcję, która określi liczbę wyrazów w podanym tekście 
   Console.Write("\n1.19\n")
   let rec Words (n:string) (size:int)=
        if size >= 0 then
            if (n[size] = ' ') && (size <> n.Length-1) && (n[size+1] <> ' ') then
                1 + Words n (size-1)
            else
                0 + Words n (size-1)
        else
            1
    
   Console.WriteLine($"Liczba wyrazów w tekście to: {Words w (w.Length-1)}")

   //1.20 Napisz funkcję, która określi liczbę cyfr występujących pod rząd w tekście. 
   Console.Write("\n1.20\n")
   let SequenceOfDigits (n:string) (size:int) =
        let rec FirstDigit (i:int)=
            if i<>size then
                if (n[i]='0' || n[i]='1' || n[i]='2' || n[i]='3' || n[i]='4' || n[i]='5' || n[i]='6' || n[i]='7' || n[i]='8' || n[i]= '9' ) then
                    i
                else
                    FirstDigit (i+1) 
            else
                i
        let f1 = FirstDigit 0
        let rec LastDigit (i:int)=
            if i<>size then
                if (n[i]='0' || n[i]='1' || n[i]='2' || n[i]='3' || n[i]='4' || n[i]='5' || n[i]='6' || n[i]='7' || n[i]='8' || n[i]= '9' ) then
                    LastDigit (i+1) 
                else
                    i
            else
                i
        let f2 = LastDigit f1
        f2-f1

   let name = "Paulina1234dq"
   let rname = name.Length
   Console.WriteLine($"{name}  -> {SequenceOfDigits name rname}")

   //TWORZENIE APLIKACJI///////////////////////////////////////////////////////////////////////////////////////////////
   Console.WriteLine("\nTWORZENIE APLIKACJI ///////////////////////////////////////////////////////////////////////////")
   //1.21 Napisz aplikację konsolową, która pozwoli użytkownikowi na wprowadzenie imienia i nazwiska 
   //i wyświetli komunikat "Witaj <imie i nazwisko>"
   Console.Write("1.21\n")
   Console.Write("Podaj imie i nazwisko: ")
   let name = (System.Console.ReadLine())
   Console.WriteLine($"Witaj {name}!!!")

   //1.22 Napisz aplikację konsolową, która pozwoli użytkownikowi na wprowadzenie roku.
   //W odpowiedzi program powinien wyświetlić informacje czy jest to rok przestępny czy nie
   Console.Write("\n1.22\nPodaj rok: ")
   let year = Int32.Parse(Console.ReadLine())
   let LeapYear (m:int) =
        if m%4=0 then "tak"
        else "nie"
   Console.WriteLine($"Czy rok {year} jest przestępny?\n{LeapYear year}")

   //1.23 Napisz aplikacje konsolową, która na podstawie podanych przez użytkownika 3
   //liczb rzeczywistych wyświetli na ekranie komunikat, czy da się z nich utworzyć
   //trójkąt równoboczny, równoramienny, prostokątny, dowolny inny lub, że z podanych 
   //wartości nie da się utworzyć trójkąta.
   Console.Write("\n1.23\nPodaj bok a: ")
   let Triangles a b c =
        if Czy_trojkat a b c then
            if a=b && a=c then
                "Z podanych boków można zbudować trójkąt równoboczny"
            elif a=b || a=c  || b=c then
                "Z podanych można zbudować trójkąt równoramienny"
            elif ((a*a)+(b*b))=(c*c) || ((c*c)+(b*b))=(a*a) || ((a*a)+(c*c))=(b*b) then
                "Z podanych boków można zbudować trójkąt prostokątny"
            else
                "Z podannych boków da się zbudować nieokreślony trójkąt"
        else
            "Nie da sie zbudowac zadnego trojkata"
   let sideA = (float)(Console.ReadLine())
   Console.Write("Podaj bok b: ")
   let sideB = (float)(Console.ReadLine())
   Console.Write("Podaj bok c: ")
   let sideC = (float)(Console.ReadLine())
   Console.WriteLine($"{Triangles sideA sideB sideC}")

   //1.24 Napisz aplikację konsolową, króra przyjmie  od użytkownika ciąg 11 cyfr.
   //Sprawdź, czy cyfry te tworzą poprawny numer PESEL, oraz na jego podstawie wyświetl
   //informacje o dacie urodzenia danej osoby oraz czy jest to kobieta czy meżczyzna.
   Console.Write("\n1.24\n")
   Console.WriteLine("Podaj numer PESEL:")
   let pesel = (string)(Console.ReadLine())
   
   let PESEL (p:string) =
        if (p.Length=11) && (Int32.Parse(p)>0) then
            Console.WriteLine($"Poprawny PESEL")
            Console.WriteLine($"Data urodzenia: {p[4..5]}.{p[2..3]}.{p[0..1]}")
            if p[9]='0' || p[9]='2' || p[9]='4' || p[9]='6' || p[9]='8' then
                Console.WriteLine($"Płeć: KOBIETA")
            else 
                Console.WriteLine($"Płeć: MEŻCZYZNA")
        else
                Console.WriteLine($"Niepoprawny PESEL")
   Console.WriteLine($"{PESEL pesel}")
   //1.25 Napisz aplikację konsolową, która przyjmie od użytkownika dowolny tekst,
   // i wyświetli go zakodowanego zgodnie z szyfrem Cezara.
   //!!! reszta kodu do zadań 25 i 26 znajduje się w module Cipher
   Console.Write("\n1.25\n")
   let text = SimpleCipher ("Paulina")
   let text2 = "paulina"
   Console.WriteLine($"Zakodowane słowo  {text2}  w szyfrze Cezara ma postać: {text.Encode(text2)}")
    

   //1.26 Napisz aplikację konsolową, która przyjmie od użytkownika dowolny tekst
   //zakodowany zgodnie z szyfrem Cezara, i odkoduje go.
   Console.Write("\n1.26\n")
   let text3 = "eaowqaa"
   Console.WriteLine($"Zdekodowane słowo  {text3}  w szyfrze Cezara ma postać: {text.Decode(text3)}")

   //1.27 Napisz aplikację konsolową, która wczytuje liczbę całkowitą określającą
   //liczbę minut od pólnocy. Program powinien wyświetlać w odpowiedzi konkretną godzinę,
   //która będzie odpowiadać tej liczbie. Jeżeli podana liczba godzin będzie przekraczała
   //liczbę godzin wciągu doby na ekranie powinien  pojawić się stosowny komunikat.
   Console.Write("\n1.27\n")
   let Czas = fun () ->
        Console.Write($"Podaj liczbe minut:")
        let i = try int (Console.ReadLine() |> uint) with | _ -> -1
        if i < 0 || i > 24*60 then
            Console.WriteLine($"Poza zakresem (max {24*60})")
        else 
            Console.WriteLine($"Czas {int (i/60)}:{i%60}")
   Czas()

   //1.28 Napisz aplikację konsolową, która wczytuje liczbę całkowitą określającą
   //liczbę minut do startu. Program w odpowiedzi powinnien wyświetlać komunikaty:
   //"do startu pozostało .. minut. Jeżeli odliczanie dojdzie do zera powinien
   //wyświetlić się odpowiedni komunikat. Odpowiednią funkcję proszę umieścić 
   //w osobnym pliku.
   Console.Write("\n1.28\n")
   let Start = fun () ->
        Console.Write($"Podaj liczbe minut:")
        let t = (int)(Console.ReadLine())
        for i in t..(-1)..1 do
            Console.WriteLine($"do startu pozostało {i} minut")
            System.Threading.Thread.Sleep(1000*60)

        Console.WriteLine($"Koniec czasu")
   Start()

   //1.29 Napisz aplikację konsolową, która rozwiązuje problem Collatza. Program
   //powinien wczytywać od użytkownika liczbę całkowitą dodatnią. Na jej podstawie 
   //obliczamy kolejne wartości:
           //0.5 * Cn jeżeli Cn jest parzysta
   // Cn+1 = {
           //3 * Cn + 1 w przeciwnym przypadku
   //gdzie C0 jest wartością wprowadzoną przez użytkownika. Przypuszcza się, że nieważne 
   //od jakiej liczby zaczniemy, to osiągniemy wartość 0.
        //Napisz program, który wyświetli kolejne wyrazy tego ciągu wraz z ich numerem.
   //Np. jeżeli zaczniemy od wartości 5 na ekranie powinniśmy zobaczyć:
        //1. 5
        //2. 16
        //3. 8
        //4. 4
        //5. 3
        //6. 1
   Console.Write("\n1.29\n")                
   let Task29 = 
            Console.Write($"Podaj liczbe:")
            let i = (int)(Console.ReadLine())
            let rec Collatza n m =
                Console.WriteLine($"{m}. {n}")
                if n <> 1 then
                    if n%2=0 then
                       Collatza (n/2) (m+1)
                    else
                        Collatza (3*n+1) (m+1)
                else
                    0
            Collatza i 1
           
   let wynik = Task29
    

   //1.30 Napisz aplikację konsolową, która pozwoli na wczytanie z klawiatury liczb 
   //całkowitych. Oblicz średnią tych liczb. Użytkownik powinien wprowadzać wartości 
   //dopóki nie poda wartości ujemnej. Odpowiednią funkcję proszę umieścić w osobnym
   //pliku.                   
   Console.Write("\n1.30\n")
   let Prog = fun ()->
        let rec loop = fun sum num ->
            Console.WriteLine($"Podaj liczbe:")
            let i = try int (Console.ReadLine() |> uint) with | _ -> -1
            if i > 0 then 
                Console.WriteLine($"Srednia: {(sum+i)}/{(num+1)} => {(sum+i)/(num+1)}")            
                loop (sum+i) (num+1) 
            else 
                ()
        loop 0 0
   Prog()

   0 // return an integer exit code