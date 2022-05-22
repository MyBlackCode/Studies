--Lista2

--Zad1 Zrealizuj poni¿sze zadania poprzez utworzenie zapytañ zwracaj¹cych stosowne informacje
--w oparciu o aktualne dane przechowywane w tabeli Studenci.

--a)Wyœwietl informacje o liczbie studentek (pañ) studiów stacjonarnych pierwszego stopnia studiuj¹cych
--na 3-im roku informatyki.
SELECT COUNT(Imiona) "Liczba Studentek" FROM studenci WHERE LOWER(imiona) like '%a' AND rok='3' 
AND Stopien='1' AND UPPER(Tryb)='STACJONARNY' AND UPPER(kierunek) = 'INFORMATYKA';

--b)Wyœwietl informacje o liczbie Nowakowskich (nazwisko) wœród studentów (pañ i panów).
-- W sk³adni zapytania wykorzystaj jedn¹ z funkcji: lower lub upper
SELECT COUNT(nazwisko) "Liczba Nowakowskich" FROM studenci WHERE UPPER(nazwisko) LIKE 'NOWAKOWSKI' 
OR UPPER(nazwisko) LIKE 'NOWAKOWSKA';

--c)Wyœwietl informacje (w ramach jednego zapytania) na temat ogólnej liczby studentów mê¿czyzn,
--których imiê rozpoczyna siê na literê M oraz ile takich imion (ró¿nych) znajduje siê w tabeli.
SELECT COUNT(imiona) "Liczba Studentow Mezczyzn na M" ,COUNT(DISTINCT(imiona))"Liczba Imion Mezczyzn na M" 
FROM studenci WHERE imiona LIKE 'M%' AND imiona NOT LIKE '%a';


--d)Wyœwietl uporz¹dkowan¹ alfabetycznie listê zawieraj¹c¹ imiona i nazwiska studentów ostatniego roku
--(4-ego lub 2-ego roku studiów w przypadku studiów kolejno 1-ego i 2-ego stopnia) w postaci pojedynczych
--³añcuchów – patrz Rys. 1.4 (min. 2 sposoby w tym zastosuj funkcjê concat).
SELECT CONCAT(CONCAT(nazwisko,' '),imiona) personalia FROM studenci 
WHERE (rok='4' AND stopien='1') OR (rok='2'AND stopien='2') ORDER BY 1;

SELECT nazwisko||' '||imiona personalia FROM studenci 
WHERE (rok='4'AND stopien='1') OR (rok='2'AND stopien='2') ORDER BY 1;

--e)Wyœwietl listê, w ramach której jedna z kolumn bêdzie zwiera³a pierwsze 3 litery imion a druga kolumna
--ostatnie 3 litery nazwisk studentów nieposiadaj¹cych zdefiniowanego zakresu (zakres OGOLNY).
SELECT SUBSTR(imiona,1,3) " 3 litery imion", imiona , SUBSTR(nazwisko,-3)" 3 ostatnie litery nazwiska"
, nazwisko  FROM studenci WHERE zakres LIKE 'OGOLNY';

--f)Wyœwietl listê zawieraj¹c¹ nazwiska i imiona studentów wraz z ich inicja³ami w formie 'A.A.',
--których ³¹czna liczba liter w imieniu i nazwisku wynosi 9, 11 lub 13.
SELECT SUBSTR(imiona,1,1)||'.'|| CONCAT(SUBSTR(nazwisko,1,1),'.') inicjaly, imiona, nazwisko,
LENGTH(imiona)+LENGTH(nazwisko) "LICZBA LITER" FROM studenci 
WHERE LENGTH(imiona)+LENGTH(nazwisko)IN (9,11,13); 

--g)Wyœwietl listê zawieraj¹c¹ nazwy kierunków studiów realizowanych na uczelni (bez powtórek) w formie
--pierwsza litera ka¿dego wyrazu nazwy kierunku bêdzie du¿a a pozosta³e ma³e (opcja A) oraz tylko pierwsza
--litera bêdzie du¿a a pozosta³e ma³e (opcja B; patrz Rys. 1.7); zadanie wykonaj na 2 sposoby poprzez
--zastosowanie funkcji Initcap i Concat
SELECT DISTINCT INITCAP(kierunek),CONCAT(SUBSTR(kierunek,1,1), LOWER(SUBSTR(kierunek,2)))
FROM Studenci;

 --h)Wyœwietl listê, w ramach której pierwsza kolumna bêdzie zawieraæ nazwiska studentów bez pierwszych
--dwóch liter 'Ko' a druga kolumna imiona tych studentów bez dwóch ostatnich liter 'sz' (patrz Rys. 1.8). Oznacza
--to, ¿e w wyniku nale¿y uwzglêdniæ tylko studentów, których nazwiska rozpoczynaj¹ siê na 'Ko' a imiona
--koñcz¹ na 'sz' np. Kowalczyk Tomasz. Za³o¿enie: w ramach rozwi¹zania nie mo¿na zastosowaæ funkcji substr
SELECT LTRIM(nazwisko, 'Ko') NazwiskoBezKo, RTRIM(imiona,'sz') ImieBezSZ, nazwisko||' '|| imiona
FROM studenci WHERE nazwisko LIKE 'Ko%' AND imiona LIKE '%sz';

--i)Wyœwietl listê ró¿nych nazwisk studentów 2-ego roku sk³adaj¹ch siê od 6 do 9 liter zawieraj¹cych
--przynajmniej jedn¹ literê a (ew. A), wraz z informacj¹ o liczbie liter w nazwisku oraz pozycji wyst¹pienia
--pierwszej litery a (patrz Rys. 1.9). Lista ma byæ uporz¹dkowana nierosn¹co wg liczby liter w nazwisku.
SELECT nazwisko, LENGTH(nazwisko)LiczbaLiter ,Instr(LOWER(nazwisko),'a') PierwszeWystopienieA 
FROM Studenci WHERE rok='2' AND  LENGTH(nazwisko) BETWEEN 6 AND 9
AND Instr(LOWER(nazwisko),'a')>0 ORDER BY 2 DESC;

--j)Wyœwietl listê (patrz Rys. 1.10) zawieraj¹c¹ zmodyfikowane nazwiska i imiona studentek,
--których nazwiska rozpoczynaj¹ siê od liter Ba (bez zastosowania funkcji substr):
--• zamiast Ba na pocz¹tku nazwiska wstaw formu³ê Start,
--• zamiast litery a na koñcu imienia staw formu³ê End.
SELECT nazwisko, LPAD(LTRIM(nazwisko,'Ba'),LENGTH(nazwisko)+3,'Start'), 
imiona, RPAD(RTRIM(imiona,'a'),LENGTH(imiona)+2,'End')
FROM studenci WHERE nazwisko LIKE 'Ba%' AND imiona LIKE '%a';

SELECT REPLACE(NAZWISKO, 'Ba', 'Start'), CONCAT(RTRIM(IMIONA, 'a'), 'End') 
FROM studenci WHERE NAZWISKO LIKE 'Ba%' AND IMIONA LIKE '%a';

SELECT nazwisko, CONCAT('Start', LTRIM(nazwisko,'Ba')), imiona, CONCAT(RTRIM(imiona,'a'),'End')
FROM studenci WHERE nazwisko LIKE 'Ba%' AND imiona LIKE '%a';

--k)Wykorzystuj¹c funkcje Rpad() i Lpad() wyœwietl nazwiska studentów poprzedzone 3 gwiazdkami (*)
-- oraz zakoñczone 4 plusikami (+) (patrz Rys. 1.11).
SELECT RPAD(LPAD(nazwisko,LENGTH(nazwisko)+3,'***'),LENGTH(nazwisko)+7, '++++') FROM Studenci;

--Zad2 Zrealizuj poni¿sze zadania poprzez utworzenie zapytañ zwracaj¹cych stosowne informacje w oparciu
--o aktualne dane przechowywane w tabeli Pojazdy.

--a)Wyœwietl wszystkie pojazdy zarejestrowane w Czêstochowie (o numerach rejestracyjnych
--rozpoczynaj¹cych siê od SC i posiadaj¹cych cyfry na ostatnich pozycjach, np. SCZ to powiat czêstochowski
--a nie miasto; w numerach rejestracyjnych identyfikatory reginalne od pozosta³ych pozycji oddziela spacja)
--o pojemnoœciach silników mieszcz¹cych siê w przedziale od 1000 do 2000 cm3. 
SELECT * FROM pojazdy WHERE nr_rejestracyjny LIKE 'SC %' AND Pojemnosc BETWEEN 1000 AND 2000
AND SUBSTR(TRIM(nr_rejestracyjny),-1) IN('1','2','3','4','5','6','7','8','9','0');

--b)Wyœwietl pojazdy marki FORD w kolorze Black Red, w ramach których liczby utworzone przez dwie
--ostatnie cyfry z wartoœci pojemnoœci silnika dziel¹ siê przez liczbê 3 np. 1945 ? 45 / 3 =15 (patrz Rys. 2.2).
--Za³o¿enie: w zestawieniu nale¿y pomin¹c pojemnoœci silników „daj¹ce” liczby 0 np. 1900. 
SELECT * FROM pojazdy where UPPER(marka) LIKE'FORD' AND UPPER(KOLOR) LIKE 'BLACK RED'
AND MOD(MOD(pojemnosc, 100),3)=0 AND MOD(pojemnosc, 100)>0;

--c)Wyœwietl wszystkie motocykle (typ) posiadaj¹ce w numerach rejestracyjnych przynajmniej dwie cyfry 6
--(np. SCZ 1626), których kolory okreœlaj¹ przynajmniej dwucz³onowe nazwy (np. Brown Red) a pojemnoœci
--silników nie mieszcz¹ siê w przedziale od 250 do 500 (patrz Rys. 3.3
SELECT * FROM pojazdy WHERE UPPER(typ)='MOTOCYKL' 
AND INSTR(Substr(nr_rejestracyjny, INSTR(nr_rejestracyjny, '6')+1),'6')>0
AND INSTR(TRIM(kolor),' ')>0 AND pojemnosc NOT BETWEEN 250 AND 500;


--d)4 Wyœwietl wszystkie pojazdy innego typu ni¿ samochod ciezarowy maj¹ce pojemnoœci silnika równe 1000,
--1500 lub 2000 wraz z komentarzami w zakresie oceny tego parametru (Rys. 2.4):
--• maly pojazd wobec pojazdów o pojemnoœci 1000,
--• sredni pojazd wobec pojazdów o pojemnoœci 1500,
--• duzy pojazd wobec pojazdów o pojemnoœci 2000.
SELECT marka, modell,typ, kolor, pojemnosc,DECODE(pojemnosc,1000, 'mala',1500, 'srednia', 2000, 'duza')
FROM pojazdy WHERE LOWER(typ) NOT LIKE 'samochod ciezarowy' AND pojemnosc IN (1000,1500,2000);

--e)W oparciu o analizê numerów rejestracyjnych zidentyfikuj pochodzenie pojazdów marki OPEL
--o pojemnoœciach silnia nienale¿¹cych do przedzia³u [1600, 2000]. W procesie klasyfikacji pojazdów
--uwzglêdniaj dwie pierwsze litery numerów rejestracyjnych wg nastêpuj¹cych zasad (patrz Rys. 2.5):
--• SC – slaskie,
--• PO – wielkopolskie,
--• EL – lodzkie,
--• GD – pomorskie,
--• pozosta³e – niezidentyfikowane. 
SELECT nr_rejestracyjny,pojemnosc, 
DECODE(SUBSTR(TRIM(nr_rejestracyjny),1,3),'SC ','slaskie','PO ','wielkopolskie','EL ','lodzkie', 'GD ','pomorskie',
'niezidentifikowane') FROM pojazdy WHERE UPPER(marka)='OPEL' AND pojemnosc NOT BETWEEN 1600 AND 2000;

--Zad3 Zrealizuj poni¿sze zadania poprzez utworzenie zapytañ zwracaj¹cych stosowne informacje w oparciu
--o aktualne dane przechowywane w tabeli Rejestry.

--a)W postaci jednego zdania (jak na Rys. 3.1) wyœwietl informacjê od kiedy do kiedy odnotowywano
--zdarzenia po³owów ryb, ile by³o wszystkich takich zdarzeñ w tym ile by³o udanych po³owów (okreœlona
--wartoœæ kolumny id_gatunku) oraz wody ilu zarz¹dców odwiedzili wêdkarze (za³o¿enie: elementem
--identyfikuj¹cym zarz¹dców wód jest pierwszy znak identyfikatora ³owiska czyli id_lowiska).
 SELECT 'Od ' ||TRUNC(MIN(czas))|| ' do ' ||TRUNC(MAX(czas))|| ' odnotowano ' || COUNT(*)||
 ' w tym udanych ' || COUNT(id_gatunku) || ' na wodach ' || COUNT( DISTINCT(SUBSTR(id_lowiska,1,1))) 
 || 'laczna waga ' || SUM(waga) || ' srednia waga ' || ROUND(AVG(waga),3) FROM rejestry;
 
 --b)Wyœwietl listê zawieraj¹c¹ wszystkie po³owy dotycz¹ce ryb o identyfikatorach (id_gatunku) 1, 3, 9 lub 10
--z³owione na wodach zarz¹dzanych przez PZW Czêstochowa (id_lowiska rozpoczynaj¹ce siê od litery C)
--o d³ugoœciach od 40 do 60 cm., których waga zosta³a ustalona z precyzj¹ nie wiêksz¹ ni¿ 0.1 (1.0 kg czy 1.1 kg
--jest ok ale 1.05 kg. ju¿ nie; patrz Rys. 3.2).
SELECT * FROM rejestry WHERE id_gatunku IN (1,3,9,10) AND SUBSTR(id_lowiska,1,1) ='C' 
AND dlugosc BETWEEN 40 AND 60 AND LENGTH(SUBSTR(waga,INSTR(waga,',')+1))<2;

--c)Wyœwietl statystyki po³owów gatunku o identyfikatorze 1 (id_gatunku) w zakresie liczby z³owionych sztuk,
--liczby ³owców (ró¿nych wêdkarzy, którzy z³owili ten gatunek), liczby ³owisk (ró¿nych ³owisk,
--na których odnotowano po³ów tego gatunku), ³¹cznej wagi wszystkich z³owionych ryb oraz ich œredniej wagi
--(z dok³adnoœci¹ do 1 grama) i œredniej d³ugoœci (z dok³adnoœci¹ do 1 cm.; patrz Rys. 3.3). 

SELECT COUNT(id_gatunku) "Liczba ryb" ,COUNT(DISTINCT(id_wedkarza)) "Liczba lowcow", 
COUNT(DISTINCT(id_lowiska))" Liczba lowisk", SUM(waga) "Laczna waga", TRUNC(AVG(waga),3) "Srednia waga",
TRUNC(AVG(dlugosc),3) "Srednia dlugosc" FROM rejestry WHERE id_gatunku = '1';

--d)Wyœwietl podstawowe informacje zwi¹zane z wpisami dotycz¹cymi zdarzeñ z³owienia ryb o nastêpuj¹cych
--identyfikatorach 2 (lin), 4 (amur), 15 (ploc), 17 (okon) oraz dotycz¹cymi nieudanych po³owów (nieokreœlona
--wartoœæ id_gatunku ? brak polowu). Informacje podaj w formie: dzien polowu, id_gatunku oraz s³owna nazwa
--gatunku (patrz Rys. 3.4). 
SELECT TRUNC(czas) "Dzien polowu", id_gatunku, count(*)-count(id_gatunku)DE(id_gatunku,2,'lin',4,'amur',15,'ploc',17,'okon','brak polowu') 
FROM rejestry WHERE nvl(id_gatunku,0) IN (2, 4, 15, 17, 0);

 