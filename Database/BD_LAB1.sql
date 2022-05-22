--Lista1

--Zad1
--Poka� atrybuty tabeli Studenci
DESC studenci;

--Zad2
--Wy�wietl wszystkie wiersze znajduj�ce si� w tabeli Studenci 
SELECT * FROM Studenci;

--Zad3
-- a) Wy�wietl list� zawieraj�c� nazwiska i imiona wszystkich student�w
SELECT nazwisko, imiona FROM Studenci;

-- b) Wy�wietl informacje dotycz�c� kierunk�w (bez powt�rze�) na jakich studiuj� studenci, kt�rych dane
-- znajd� si� w tabeli (kolumna kierunek; Rys. 2)
SELECT DISTINCT kierunek FROM Studenci;

--c) Wy�wietl list� prezentuj�c� dane wszystkich student�w studiuj�cych na kierunku informatyka w zakresie
--ich nazwisk, imion, trybu studi�w, roku, grupy dzieka�skiej i zakresu. Dane uporz�dkuj wg. roku w formie
--niemalej�cej (od 1) i nazwiska w formie �od � do A� (Rys. 3).
W oparciu o dane zawarte w tabeli Pracownicy wy�wietl aktualnie pracuj�cych pracownik�w,
porz�dkuj�c ich wed�ug sta�u pracy podanego w pe�nych latach i miesi�cach pracy oraz kolejno�ci
alfabetycznej nazwisk (Rys. 16).
SELECT nazwisko, imiona, tryb, rok, gr_dziekan, zakres FROM Studenci WHERE kierunek LIKE 'INFORMATYKA' 
ORDER BY rok, nazwisko DESC ;

--d) Wy�wietl dane student�w studiuj�cych na 3-im roku i przynale��cych do 2-ej grupy dzieka�skiej (Rys. 4)
SELECT * FROM Studenci WHERE rok='3' AND GR_Dziekan='2';

--e) Wy�wietl dane student�w, kt�rzy nie maj� obliczonej sredniej (brak warto�ci w ramach kolumny srednia)
SELECT * FROM Studenci WHERE srednia IS NULL;

--f) Wy�wietl nazwiska, imiona i roczniki student�w (rok) pierwszego stopnia studi�w stacjonarnych z lat (rok):
--2, 3, 4 (warunek zbuduj na kilka sposob�w). Dane wy�wietl uporz�dkowane w kolejno�ci alfabetycznej
--wg nazwisk student�w (Rys. 5). 
SELECT nazwisko, imiona, rok FROM Studenci WHERE rok='2' or rok='3' or rok='4'  ORDER BY nazwisko;
SELECT nazwisko, imiona, rok FROM Studenci WHERE rok in(2,3,4)  ORDER BY nazwisko;
SELECT nazwisko, imiona, rok FROM Studenci WHERE rok BETWEEN 2 AND 4  ORDER BY nazwisko;

--g) Wy�wietl imiona i nazwiska studentek (pa�) � kolumny imiona i nazwisko.
SELECT imiona, nazwisko FROM Studenci WHERE imiona LIKE '%a';

--h) Wy�wietl imiona i nazwiska student�w (pan�w)
SELECT imiona, nazwisko FROM Studenci WHERE imiona NOT LIKE '%a';

--i) Wy�wietl dane wszystkich Adam�w, Konrad�w i Magdalen (Rys. 6)
SELECT * FROM Studenci WHERE UPPER(imiona)='ADAM' or UPPER(imiona)='KONRAD' OR UPPER(imiona)='MAGDALENA';

-- j) Wy�wietl dane wszystkich Kowalskich oraz Nowak�w (pa� i pan�w; Rys. 7).
SELECT * FROM Studenci WHERE UPPER(nazwisko)='KOWALSKI' OR UPPER(nazwisko)='NOWAK' OR
UPPER(nazwisko)='KOWALSKA';
SELECT * FROM Studenci WHERE UPPER(nazwisko)IN('KOWALSKI','NOWAK','KOWALSKA');

-- k) Wy�wietl alfabetycznie uporz�dkowan� list� imion student�w, kt�rych dwie pierwsze litery mieszcz� si�
--w przedziale alfabetycznym od DO do MI (np. Dorota, Helena, Jan, Marcin itd.; Rys. 8). 
SELECT IMIONA FROM STUDENCI WHERE imiona BETWEEN 'Do%' and 'Mi%' ORDER BY 1;

--Zad4 
DESC Pracownicy;

--Zad5
--a)Wy�wietl list� zawieraj�c� nazwiska pracownik�w i ich p�ac� (kolumny nazwisko i placa). 
SELECT nazwisko, placa FROM PRACOWNICY;

--b)Wy�wietl list� zawieraj�c� nazwiska pracownik�w wraz z warto�ciami ich tzw. �dni�wek� obliczonych
--na podstawie warto�ci znajduj�cych si� w ramach kolumny placa (Rys. 9). W ramach zadania nale�y przyj��
--za�o�enie, �e w ka�dym miesi�cu wyst�puje 20 dni roboczych.
SELECT nazwisko, placa/20 Dniowka FROM Pracownicy;

--c)Wy�wietl list� miesi�cznych ca�kowitych pensji aktualnych pracownik�w (nazwisko, nr_akt) pracuj�cych
--w ramach umowy na czas nieokre�lony (nieokre�lona warto�� kolumny data_zwol); lista ma by�
--uporz�dkowan� po kolumnie pensja w trybie niemalej�cym (od najgorzej do najlepiej zarabiaj�cego
--pracownika; patrz Rys. 10); uwaga w ramach pensji nale�y uwzgl�dni� warto�ci z kolumn placa,
--dod_funkcyjny, dod_staz i koszt_ubezpieczenia (dododatek sta�owy to procentowa warto��; sam dodatek
--obliczany jest w oparciu o wysoko�� p�acy podstawowej).
SELECT nazwisko, nr_akt, ROUND (placa + NVL(dod_funkcyjny, 0)+ (NVL(dod_staz, 0)/placa* 100) - nvl(koszt_ubezpieczenia,0)) 
Pensja FROM Pracownicy WHERE data_zwol IS NULL ORDER BY Pensja;

--d)Wy�wietl list� zawierajac� roczne pensje aktualnych pracownik�w posiadaj�cych umowy na czas
--nieokre�lony, niepe�ni�cych funkcji prezesa oraz dyrektora. Lista ma by� uporz�dkowana od najlepiej
--do najgorzej zarabiaj�cego pracownika (Rys. 11).
SELECT ROUND (placa + NVL(dod_funkcyjny, 0)+ (NVL(dod_staz, 0)/placa* 100) -nvl(koszt_ubezpieczenia,0)) Pensja FROM Pracownicy 
WHERE data_zwol IS NULL AND stanowisko NOT LIKE 'Dyrektor' AND stanowisko NOT LIKE 'Prezes' ORDER BY Pensja;

--e)Wy�wietl pod postaci� jednej kolumny informuj�c� w jakich dzia�ach i na jakich stanowiskach pracuj�
--aktualni pracownicy firmy zatrudnieni ma umowy na czas nieokre�lony (patrz Rys. 12).
SELECT nazwisko ||' aktualnie pracuje w dziale '|| id_dzialu ||' -tym  na stanowisku '|| 
stanowisko ||' w firmie od '|| data_zatr Pracownicy FROM pracownicy WHERE data_zwol IS NULL;

--Zad6
--Poka� atrybuty tabeli Pojazdy.
DESC Pojazdy;

--Zad7
--Na podstawie danych znajduj�cych si� w tabeli Pojazdy wy�wietl list� zawieraj�c� informacje
--o samochodach osobowych kt�rych (Rys. 13):
--� numer rejestracyjny rozpoczyna si� na 'SC' a ko�czy cyfr� 5,
--� warto�� pojemno�ci silnika nie nale�y do przedzia�u od 1500 do 2000,
--� nazwa koloru jest ustalona w formie jednego wyrazu, w kt�rym wyst�puje co najmniej jedna litera r

SELECT * FROM pojazdy where nr_rejestracyjny LIKE 'SC%5' AND (pojemnosc>'1500' OR pojemnosc<'2000') 
AND INSTR(TRIM(KOLOR),' ') = 0 AND INSTR(SUBSTR(kolor, 1, INSTR(TRIM(kolor),' ')),'r')>0;
