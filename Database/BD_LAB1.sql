--Lista1

--Zad1
--Poka¿ atrybuty tabeli Studenci
DESC studenci;

--Zad2
--Wyœwietl wszystkie wiersze znajduj¹ce siê w tabeli Studenci 
SELECT * FROM Studenci;

--Zad3
-- a) Wyœwietl listê zawieraj¹c¹ nazwiska i imiona wszystkich studentów
SELECT nazwisko, imiona FROM Studenci;

-- b) Wyœwietl informacje dotycz¹c¹ kierunków (bez powtórzeñ) na jakich studiuj¹ studenci, których dane
-- znajd¹ siê w tabeli (kolumna kierunek; Rys. 2)
SELECT DISTINCT kierunek FROM Studenci;

--c) Wyœwietl listê prezentuj¹c¹ dane wszystkich studentów studiuj¹cych na kierunku informatyka w zakresie
--ich nazwisk, imion, trybu studiów, roku, grupy dziekañskiej i zakresu. Dane uporz¹dkuj wg. roku w formie
--niemalej¹cej (od 1) i nazwiska w formie „od ¯ do A” (Rys. 3).
W oparciu o dane zawarte w tabeli Pracownicy wyœwietl aktualnie pracuj¹cych pracowników,
porz¹dkuj¹c ich wed³ug sta¿u pracy podanego w pe³nych latach i miesi¹cach pracy oraz kolejnoœci
alfabetycznej nazwisk (Rys. 16).
SELECT nazwisko, imiona, tryb, rok, gr_dziekan, zakres FROM Studenci WHERE kierunek LIKE 'INFORMATYKA' 
ORDER BY rok, nazwisko DESC ;

--d) Wyœwietl dane studentów studiuj¹cych na 3-im roku i przynale¿¹cych do 2-ej grupy dziekañskiej (Rys. 4)
SELECT * FROM Studenci WHERE rok='3' AND GR_Dziekan='2';

--e) Wyœwietl dane studentów, którzy nie maj¹ obliczonej sredniej (brak wartoœci w ramach kolumny srednia)
SELECT * FROM Studenci WHERE srednia IS NULL;

--f) Wyœwietl nazwiska, imiona i roczniki studentów (rok) pierwszego stopnia studiów stacjonarnych z lat (rok):
--2, 3, 4 (warunek zbuduj na kilka sposobów). Dane wyœwietl uporz¹dkowane w kolejnoœci alfabetycznej
--wg nazwisk studentów (Rys. 5). 
SELECT nazwisko, imiona, rok FROM Studenci WHERE rok='2' or rok='3' or rok='4'  ORDER BY nazwisko;
SELECT nazwisko, imiona, rok FROM Studenci WHERE rok in(2,3,4)  ORDER BY nazwisko;
SELECT nazwisko, imiona, rok FROM Studenci WHERE rok BETWEEN 2 AND 4  ORDER BY nazwisko;

--g) Wyœwietl imiona i nazwiska studentek (pañ) – kolumny imiona i nazwisko.
SELECT imiona, nazwisko FROM Studenci WHERE imiona LIKE '%a';

--h) Wyœwietl imiona i nazwiska studentów (panów)
SELECT imiona, nazwisko FROM Studenci WHERE imiona NOT LIKE '%a';

--i) Wyœwietl dane wszystkich Adamów, Konradów i Magdalen (Rys. 6)
SELECT * FROM Studenci WHERE UPPER(imiona)='ADAM' or UPPER(imiona)='KONRAD' OR UPPER(imiona)='MAGDALENA';

-- j) Wyœwietl dane wszystkich Kowalskich oraz Nowaków (pañ i panów; Rys. 7).
SELECT * FROM Studenci WHERE UPPER(nazwisko)='KOWALSKI' OR UPPER(nazwisko)='NOWAK' OR
UPPER(nazwisko)='KOWALSKA';
SELECT * FROM Studenci WHERE UPPER(nazwisko)IN('KOWALSKI','NOWAK','KOWALSKA');

-- k) Wyœwietl alfabetycznie uporz¹dkowan¹ listê imion studentów, których dwie pierwsze litery mieszcz¹ siê
--w przedziale alfabetycznym od DO do MI (np. Dorota, Helena, Jan, Marcin itd.; Rys. 8). 
SELECT IMIONA FROM STUDENCI WHERE imiona BETWEEN 'Do%' and 'Mi%' ORDER BY 1;

--Zad4 
DESC Pracownicy;

--Zad5
--a)Wyœwietl listê zawieraj¹c¹ nazwiska pracowników i ich p³acê (kolumny nazwisko i placa). 
SELECT nazwisko, placa FROM PRACOWNICY;

--b)Wyœwietl listê zawieraj¹c¹ nazwiska pracowników wraz z wartoœciami ich tzw. „dniówek” obliczonych
--na podstawie wartoœci znajduj¹cych siê w ramach kolumny placa (Rys. 9). W ramach zadania nale¿y przyj¹æ
--za³o¿enie, ¿e w ka¿dym miesi¹cu wystêpuje 20 dni roboczych.
SELECT nazwisko, placa/20 Dniowka FROM Pracownicy;

--c)Wyœwietl listê miesiêcznych ca³kowitych pensji aktualnych pracowników (nazwisko, nr_akt) pracuj¹cych
--w ramach umowy na czas nieokreœlony (nieokreœlona wartoœæ kolumny data_zwol); lista ma byæ
--uporz¹dkowan¹ po kolumnie pensja w trybie niemalej¹cym (od najgorzej do najlepiej zarabiaj¹cego
--pracownika; patrz Rys. 10); uwaga w ramach pensji nale¿y uwzglêdniæ wartoœci z kolumn placa,
--dod_funkcyjny, dod_staz i koszt_ubezpieczenia (dododatek sta¿owy to procentowa wartoœæ; sam dodatek
--obliczany jest w oparciu o wysokoœæ p³acy podstawowej).
SELECT nazwisko, nr_akt, ROUND (placa + NVL(dod_funkcyjny, 0)+ (NVL(dod_staz, 0)/placa* 100) - nvl(koszt_ubezpieczenia,0)) 
Pensja FROM Pracownicy WHERE data_zwol IS NULL ORDER BY Pensja;

--d)Wyœwietl listê zawierajac¹ roczne pensje aktualnych pracowników posiadaj¹cych umowy na czas
--nieokreœlony, niepe³ni¹cych funkcji prezesa oraz dyrektora. Lista ma byæ uporz¹dkowana od najlepiej
--do najgorzej zarabiaj¹cego pracownika (Rys. 11).
SELECT ROUND (placa + NVL(dod_funkcyjny, 0)+ (NVL(dod_staz, 0)/placa* 100) -nvl(koszt_ubezpieczenia,0)) Pensja FROM Pracownicy 
WHERE data_zwol IS NULL AND stanowisko NOT LIKE 'Dyrektor' AND stanowisko NOT LIKE 'Prezes' ORDER BY Pensja;

--e)Wyœwietl pod postaci¹ jednej kolumny informuj¹c¹ w jakich dzia³ach i na jakich stanowiskach pracuj¹
--aktualni pracownicy firmy zatrudnieni ma umowy na czas nieokreœlony (patrz Rys. 12).
SELECT nazwisko ||' aktualnie pracuje w dziale '|| id_dzialu ||' -tym  na stanowisku '|| 
stanowisko ||' w firmie od '|| data_zatr Pracownicy FROM pracownicy WHERE data_zwol IS NULL;

--Zad6
--Poka¿ atrybuty tabeli Pojazdy.
DESC Pojazdy;

--Zad7
--Na podstawie danych znajduj¹cych siê w tabeli Pojazdy wyœwietl listê zawieraj¹c¹ informacje
--o samochodach osobowych których (Rys. 13):
--• numer rejestracyjny rozpoczyna siê na 'SC' a koñczy cyfr¹ 5,
--• wartoœæ pojemnoœci silnika nie nale¿y do przedzia³u od 1500 do 2000,
--• nazwa koloru jest ustalona w formie jednego wyrazu, w którym wystêpuje co najmniej jedna litera r

SELECT * FROM pojazdy where nr_rejestracyjny LIKE 'SC%5' AND (pojemnosc>'1500' OR pojemnosc<'2000') 
AND INSTR(TRIM(KOLOR),' ') = 0 AND INSTR(SUBSTR(kolor, 1, INSTR(TRIM(kolor),' ')),'r')>0;
