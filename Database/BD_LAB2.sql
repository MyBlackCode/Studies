--Lista2

--Zad1 Zrealizuj poni�sze zadania poprzez utworzenie zapyta� zwracaj�cych stosowne informacje
--w oparciu o aktualne dane przechowywane w tabeli Studenci.

--a)Wy�wietl informacje o liczbie studentek (pa�) studi�w stacjonarnych pierwszego stopnia studiuj�cych
--na 3-im roku informatyki.
SELECT COUNT(Imiona) "Liczba Studentek" FROM studenci WHERE LOWER(imiona) like '%a' AND rok='3' 
AND Stopien='1' AND UPPER(Tryb)='STACJONARNY' AND UPPER(kierunek) = 'INFORMATYKA';

--b)Wy�wietl informacje o liczbie Nowakowskich (nazwisko) w�r�d student�w (pa� i pan�w).
-- W sk�adni zapytania wykorzystaj jedn� z funkcji: lower lub upper
SELECT COUNT(nazwisko) "Liczba Nowakowskich" FROM studenci WHERE UPPER(nazwisko) LIKE 'NOWAKOWSKI' 
OR UPPER(nazwisko) LIKE 'NOWAKOWSKA';

--c)Wy�wietl informacje (w ramach jednego zapytania) na temat og�lnej liczby student�w m�czyzn,
--kt�rych imi� rozpoczyna si� na liter� M oraz ile takich imion (r�nych) znajduje si� w tabeli.
SELECT COUNT(imiona) "Liczba Studentow Mezczyzn na M" ,COUNT(DISTINCT(imiona))"Liczba Imion Mezczyzn na M" 
FROM studenci WHERE imiona LIKE 'M%' AND imiona NOT LIKE '%a';


--d)Wy�wietl uporz�dkowan� alfabetycznie list� zawieraj�c� imiona i nazwiska student�w ostatniego roku
--(4-ego lub 2-ego roku studi�w w przypadku studi�w kolejno 1-ego i 2-ego stopnia) w postaci pojedynczych
--�a�cuch�w � patrz Rys. 1.4 (min. 2 sposoby w tym zastosuj funkcj� concat).
SELECT CONCAT(CONCAT(nazwisko,' '),imiona) personalia FROM studenci 
WHERE (rok='4' AND stopien='1') OR (rok='2'AND stopien='2') ORDER BY 1;

SELECT nazwisko||' '||imiona personalia FROM studenci 
WHERE (rok='4'AND stopien='1') OR (rok='2'AND stopien='2') ORDER BY 1;

--e)Wy�wietl list�, w ramach kt�rej jedna z kolumn b�dzie zwiera�a pierwsze 3 litery imion a druga kolumna
--ostatnie 3 litery nazwisk student�w nieposiadaj�cych zdefiniowanego zakresu (zakres OGOLNY).
SELECT SUBSTR(imiona,1,3) " 3 litery imion", imiona , SUBSTR(nazwisko,-3)" 3 ostatnie litery nazwiska"
, nazwisko  FROM studenci WHERE zakres LIKE 'OGOLNY';

--f)Wy�wietl list� zawieraj�c� nazwiska i imiona student�w wraz z ich inicja�ami w formie 'A.A.',
--kt�rych ��czna liczba liter w imieniu i nazwisku wynosi 9, 11 lub 13.
SELECT SUBSTR(imiona,1,1)||'.'|| CONCAT(SUBSTR(nazwisko,1,1),'.') inicjaly, imiona, nazwisko,
LENGTH(imiona)+LENGTH(nazwisko) "LICZBA LITER" FROM studenci 
WHERE LENGTH(imiona)+LENGTH(nazwisko)IN (9,11,13); 

--g)Wy�wietl list� zawieraj�c� nazwy kierunk�w studi�w realizowanych na uczelni (bez powt�rek) w formie
--pierwsza litera ka�dego wyrazu nazwy kierunku b�dzie du�a a pozosta�e ma�e (opcja A) oraz tylko pierwsza
--litera b�dzie du�a a pozosta�e ma�e (opcja B; patrz Rys. 1.7); zadanie wykonaj na 2 sposoby poprzez
--zastosowanie funkcji Initcap i Concat
SELECT DISTINCT INITCAP(kierunek),CONCAT(SUBSTR(kierunek,1,1), LOWER(SUBSTR(kierunek,2)))
FROM Studenci;

 --h)Wy�wietl list�, w ramach kt�rej pierwsza kolumna b�dzie zawiera� nazwiska student�w bez pierwszych
--dw�ch liter 'Ko' a druga kolumna imiona tych student�w bez dw�ch ostatnich liter 'sz' (patrz Rys. 1.8). Oznacza
--to, �e w wyniku nale�y uwzgl�dni� tylko student�w, kt�rych nazwiska rozpoczynaj� si� na 'Ko' a imiona
--ko�cz� na 'sz' np. Kowalczyk Tomasz. Za�o�enie: w ramach rozwi�zania nie mo�na zastosowa� funkcji substr
SELECT LTRIM(nazwisko, 'Ko') NazwiskoBezKo, RTRIM(imiona,'sz') ImieBezSZ, nazwisko||' '|| imiona
FROM studenci WHERE nazwisko LIKE 'Ko%' AND imiona LIKE '%sz';

--i)Wy�wietl list� r�nych nazwisk student�w 2-ego roku sk�adaj�ch si� od 6 do 9 liter zawieraj�cych
--przynajmniej jedn� liter� a (ew. A), wraz z informacj� o liczbie liter w nazwisku oraz pozycji wyst�pienia
--pierwszej litery a (patrz Rys. 1.9). Lista ma by� uporz�dkowana nierosn�co wg liczby liter w nazwisku.
SELECT nazwisko, LENGTH(nazwisko)LiczbaLiter ,Instr(LOWER(nazwisko),'a') PierwszeWystopienieA 
FROM Studenci WHERE rok='2' AND  LENGTH(nazwisko) BETWEEN 6 AND 9
AND Instr(LOWER(nazwisko),'a')>0 ORDER BY 2 DESC;

--j)Wy�wietl list� (patrz Rys. 1.10) zawieraj�c� zmodyfikowane nazwiska i imiona studentek,
--kt�rych nazwiska rozpoczynaj� si� od liter Ba (bez zastosowania funkcji substr):
--� zamiast Ba na pocz�tku nazwiska wstaw formu�� Start,
--� zamiast litery a na ko�cu imienia staw formu�� End.
SELECT nazwisko, LPAD(LTRIM(nazwisko,'Ba'),LENGTH(nazwisko)+3,'Start'), 
imiona, RPAD(RTRIM(imiona,'a'),LENGTH(imiona)+2,'End')
FROM studenci WHERE nazwisko LIKE 'Ba%' AND imiona LIKE '%a';

SELECT REPLACE(NAZWISKO, 'Ba', 'Start'), CONCAT(RTRIM(IMIONA, 'a'), 'End') 
FROM studenci WHERE NAZWISKO LIKE 'Ba%' AND IMIONA LIKE '%a';

SELECT nazwisko, CONCAT('Start', LTRIM(nazwisko,'Ba')), imiona, CONCAT(RTRIM(imiona,'a'),'End')
FROM studenci WHERE nazwisko LIKE 'Ba%' AND imiona LIKE '%a';

--k)Wykorzystuj�c funkcje Rpad() i Lpad() wy�wietl nazwiska student�w poprzedzone 3 gwiazdkami (*)
-- oraz zako�czone 4 plusikami (+) (patrz Rys. 1.11).
SELECT RPAD(LPAD(nazwisko,LENGTH(nazwisko)+3,'***'),LENGTH(nazwisko)+7, '++++') FROM Studenci;

--Zad2 Zrealizuj poni�sze zadania poprzez utworzenie zapyta� zwracaj�cych stosowne informacje w oparciu
--o aktualne dane przechowywane w tabeli Pojazdy.

--a)Wy�wietl wszystkie pojazdy zarejestrowane w Cz�stochowie (o numerach rejestracyjnych
--rozpoczynaj�cych si� od SC i posiadaj�cych cyfry na ostatnich pozycjach, np. SCZ to powiat cz�stochowski
--a nie miasto; w numerach rejestracyjnych identyfikatory reginalne od pozosta�ych pozycji oddziela spacja)
--o pojemno�ciach silnik�w mieszcz�cych si� w przedziale od 1000 do 2000 cm3. 
SELECT * FROM pojazdy WHERE nr_rejestracyjny LIKE 'SC %' AND Pojemnosc BETWEEN 1000 AND 2000
AND SUBSTR(TRIM(nr_rejestracyjny),-1) IN('1','2','3','4','5','6','7','8','9','0');

--b)Wy�wietl pojazdy marki FORD w kolorze Black Red, w ramach kt�rych liczby utworzone przez dwie
--ostatnie cyfry z warto�ci pojemno�ci silnika dziel� si� przez liczb� 3 np. 1945 ? 45 / 3 =15 (patrz Rys. 2.2).
--Za�o�enie: w zestawieniu nale�y pomin�c pojemno�ci silnik�w �daj�ce� liczby 0 np. 1900. 
SELECT * FROM pojazdy where UPPER(marka) LIKE'FORD' AND UPPER(KOLOR) LIKE 'BLACK RED'
AND MOD(MOD(pojemnosc, 100),3)=0 AND MOD(pojemnosc, 100)>0;

--c)Wy�wietl wszystkie motocykle (typ) posiadaj�ce w numerach rejestracyjnych przynajmniej dwie cyfry 6
--(np. SCZ 1626), kt�rych kolory okre�laj� przynajmniej dwucz�onowe nazwy (np. Brown Red) a pojemno�ci
--silnik�w nie mieszcz� si� w przedziale od 250 do 500 (patrz Rys. 3.3
SELECT * FROM pojazdy WHERE UPPER(typ)='MOTOCYKL' 
AND INSTR(Substr(nr_rejestracyjny, INSTR(nr_rejestracyjny, '6')+1),'6')>0
AND INSTR(TRIM(kolor),' ')>0 AND pojemnosc NOT BETWEEN 250 AND 500;


--d)4 Wy�wietl wszystkie pojazdy innego typu ni� samochod ciezarowy maj�ce pojemno�ci silnika r�wne 1000,
--1500 lub 2000 wraz z komentarzami w zakresie oceny tego parametru (Rys. 2.4):
--� maly pojazd wobec pojazd�w o pojemno�ci 1000,
--� sredni pojazd wobec pojazd�w o pojemno�ci 1500,
--� duzy pojazd wobec pojazd�w o pojemno�ci 2000.
SELECT marka, modell,typ, kolor, pojemnosc,DECODE(pojemnosc,1000, 'mala',1500, 'srednia', 2000, 'duza')
FROM pojazdy WHERE LOWER(typ) NOT LIKE 'samochod ciezarowy' AND pojemnosc IN (1000,1500,2000);

--e)W oparciu o analiz� numer�w rejestracyjnych zidentyfikuj pochodzenie pojazd�w marki OPEL
--o pojemno�ciach silnia nienale��cych do przedzia�u [1600, 2000]. W procesie klasyfikacji pojazd�w
--uwzgl�dniaj dwie pierwsze litery numer�w rejestracyjnych wg nast�puj�cych zasad (patrz Rys. 2.5):
--� SC � slaskie,
--� PO � wielkopolskie,
--� EL � lodzkie,
--� GD � pomorskie,
--� pozosta�e � niezidentyfikowane. 
SELECT nr_rejestracyjny,pojemnosc, 
DECODE(SUBSTR(TRIM(nr_rejestracyjny),1,3),'SC ','slaskie','PO ','wielkopolskie','EL ','lodzkie', 'GD ','pomorskie',
'niezidentifikowane') FROM pojazdy WHERE UPPER(marka)='OPEL' AND pojemnosc NOT BETWEEN 1600 AND 2000;

--Zad3 Zrealizuj poni�sze zadania poprzez utworzenie zapyta� zwracaj�cych stosowne informacje w oparciu
--o aktualne dane przechowywane w tabeli Rejestry.

--a)W postaci jednego zdania (jak na Rys. 3.1) wy�wietl informacj� od kiedy do kiedy odnotowywano
--zdarzenia po�ow�w ryb, ile by�o wszystkich takich zdarze� w tym ile by�o udanych po�ow�w (okre�lona
--warto�� kolumny id_gatunku) oraz wody ilu zarz�dc�w odwiedzili w�dkarze (za�o�enie: elementem
--identyfikuj�cym zarz�dc�w w�d jest pierwszy znak identyfikatora �owiska czyli id_lowiska).
 SELECT 'Od ' ||TRUNC(MIN(czas))|| ' do ' ||TRUNC(MAX(czas))|| ' odnotowano ' || COUNT(*)||
 ' w tym udanych ' || COUNT(id_gatunku) || ' na wodach ' || COUNT( DISTINCT(SUBSTR(id_lowiska,1,1))) 
 || 'laczna waga ' || SUM(waga) || ' srednia waga ' || ROUND(AVG(waga),3) FROM rejestry;
 
 --b)Wy�wietl list� zawieraj�c� wszystkie po�owy dotycz�ce ryb o identyfikatorach (id_gatunku) 1, 3, 9 lub 10
--z�owione na wodach zarz�dzanych przez PZW Cz�stochowa (id_lowiska rozpoczynaj�ce si� od litery C)
--o d�ugo�ciach od 40 do 60 cm., kt�rych waga zosta�a ustalona z precyzj� nie wi�ksz� ni� 0.1 (1.0 kg czy 1.1 kg
--jest ok ale 1.05 kg. ju� nie; patrz Rys. 3.2).
SELECT * FROM rejestry WHERE id_gatunku IN (1,3,9,10) AND SUBSTR(id_lowiska,1,1) ='C' 
AND dlugosc BETWEEN 40 AND 60 AND LENGTH(SUBSTR(waga,INSTR(waga,',')+1))<2;

--c)Wy�wietl statystyki po�ow�w gatunku o identyfikatorze 1 (id_gatunku) w zakresie liczby z�owionych sztuk,
--liczby �owc�w (r�nych w�dkarzy, kt�rzy z�owili ten gatunek), liczby �owisk (r�nych �owisk,
--na kt�rych odnotowano po��w tego gatunku), ��cznej wagi wszystkich z�owionych ryb oraz ich �redniej wagi
--(z dok�adno�ci� do 1 grama) i �redniej d�ugo�ci (z dok�adno�ci� do 1 cm.; patrz Rys. 3.3). 

SELECT COUNT(id_gatunku) "Liczba ryb" ,COUNT(DISTINCT(id_wedkarza)) "Liczba lowcow", 
COUNT(DISTINCT(id_lowiska))" Liczba lowisk", SUM(waga) "Laczna waga", TRUNC(AVG(waga),3) "Srednia waga",
TRUNC(AVG(dlugosc),3) "Srednia dlugosc" FROM rejestry WHERE id_gatunku = '1';

--d)Wy�wietl podstawowe informacje zwi�zane z wpisami dotycz�cymi zdarze� z�owienia ryb o nast�puj�cych
--identyfikatorach 2 (lin), 4 (amur), 15 (ploc), 17 (okon) oraz dotycz�cymi nieudanych po�ow�w (nieokre�lona
--warto�� id_gatunku ? brak polowu). Informacje podaj w formie: dzien polowu, id_gatunku oraz s�owna nazwa
--gatunku (patrz Rys. 3.4). 
SELECT TRUNC(czas) "Dzien polowu", id_gatunku, count(*)-count(id_gatunku)DE(id_gatunku,2,'lin',4,'amur',15,'ploc',17,'okon','brak polowu') 
FROM rejestry WHERE nvl(id_gatunku,0) IN (2, 4, 15, 17, 0);

 