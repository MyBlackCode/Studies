--Lista4 

--Zad1  W oparciu o dane zawarte w tabelach Pojazdy i Wlasciciele wy�wietl uporz�dkowan� list� pojazd�w
--(od najstarszego) wyprodukowanych w 2018 roku wraz z danymi ich w�a�cicieli (patrz Rys. 1)
SELECT * FROM pojazdy JOIN wlasciciele  USING(id_wlasciciela) WHERE EXTRACT(YEAR FROM data_produkcji)
LIKE 2018  ORDER BY 10 ;

--Zad2 W oparciu o dane zawarte w tabelach Pojazdy i Wlasciciele wy�wietl list� zawieraj�c� dane pojazd�w
--starszych od swoich w�a�cicieli maj�cych status osoby fizycznej. Lista poza danymi pojazd�w
--i ich w�a�cicieli powinna zawiera� informacj� o wielko�ci r�nicy pomi�dzy wiekiem pojazdu i wiekiem
--jego w�a�ciciela, podanej w dniach i pe�nych latach (patrz Rys. 2 kolumny dni i lat). Dane uporz�dkuj
--wg r�nicy wieku w trybie nierosn�cym. 
SELECT nr_rejestracyjny, marka, modell, wlasciciel, data_up, data_produkcji, data_up - data_produkcji DNI,
TRUNC(MONTHS_BETWEEN(data_up, data_produkcji)/12) "pelne lata" 
FROM pojazdy JOIN wlasciciele  USING(id_wlasciciela) WHERE data_produkcji < data_up 
AND status_wlasciciela LIKE 'osoba_fizyczna';

--Zad3 W oparciu o dane zawarte w tabelach Pracownicy i Stanowiska wy�wietl list� pracownik�w, kt�rych p�aca
--nie mie�ci si� w wide�kach wynagrodze� przewidzianych dla stanowisk, na kt�rych aktualnie pracuj�.
--Zawarto�� listy zgodnie z Rys. 3 (bez analizy okres�w zatrudnienia).
SELECT * FROM PRACOWNICY JOIN STANOWISKA USING(stanowisko) WHERE placa NOT BETWEEN placa_min AND placa_max;

--Zad4 W oparciu o dane zawarte w tabelach Rejestry, Wedkarze, Gatunki i Lowiska wy�wietl list� wszystkich
--udanych po�ow�w ryb (tj. id_gatunku posiada warto��) podaj�c dane w�dkarza, nazwy gatunk�w i �owisk.
--Dane wy�wietl chronologicznie wg dat zdarze� po�ow�w (patrz Rys. 4).
SELECT * FROM  rejestry;
SELECT * FROM  wedkarze;
SELECT * FROM  gatunki;
SELECT * FROM  lowiska;
SELECT imiona||' ' || nazwisko "Wedkarz", gatunki.nazwa "GATUNEK" , lowiska.nazwa "LOWISKO"
FROM rejestry join gatunki USING(id_gatunku) join lowiska USING(id_lowiska)  join wedkarze 
USING(id_wedkarza) order by czas;

--Zad5 Zadanie stanowi�ce rozszerzenie zadania 4. W oparciu o dane zawarte w tabelach Rejestry, Wedkarze,
--Gatunki i Lowiska wy�wietl informacje o wszystkich pr�bach po�ow�w ryb na przestrzeni ostatniego roku
--(wzgl�dem aktualnego dnia). W przypadku braku po�owu w ramach kolumny gatunek umie�� fraz� � brak
--polowu� (patrz Rys. 5). Dane wy�wietl chronologicznie wg dat zdarze� po�ow�w.
SELECT CAST(CZAS AS DATE)"DZIEN POLOWU", nazwisko, imiona, NVL(gatunki.nazwa,'brak polowu') "gatunek", lowiska.nazwa "LOWSISKO", 
NVL(waga,0), NVL(dlugosc,0) FROM rejestry left join gatunki USING(id_gatunku) join lowiska USING (id_lowiska)
join wedkarze USING (id_wedkarza) WHERE EXTRACT(YEAR FROM czas)=EXTRACT(YEAR FROM sysdate) order by czas;

--Zad6 W oparciu o dane zawarte w tabelach Licencje i Wedkarze wy�wietl list� w�dkarzy, kt�rzy w aktualnym roku
--kalendarzowym op�acili ju� roczn� sk�adk� podstawow� na rzecz dowolnego okr�gu PZW (Rys. 6). 
SELECT * FROM licencje;
SELECT * FROM wedkarze;
SELECT * FROM oplaty;
SELECT * FROM licencje JOIN wedkarze USING(id_wedkarza) WHERE id_okregu like 'PZW%' 
AND ROK=EXTRACT(YEAR FROM sysdate) AND od_dnia='01-01' AND do_Dnia='31-12' AND rodzaj='podstawowa';

--Zad7 W oparciu o dane zawarte w tabelach Licencje i Wedkarze wy�wietl list� wszystkich wniesionych op�at
--okresowych (dziennych) w 2019 roku. Struktura listy jak na Rys. 7.
SELECT * FROM licencje JOIN wedkarze USING(id_wedkarza) WHERE ROK=2019 AND NOT(od_dnia like '01-01' AND do_dnia like '31-12');

--Zad8  Zadanie stanowi�ce rozszerzenie zadania 7. W oparciu o dane zawarte w tabelach Licencje, Oplaty
--i Wedkarze wy�wietl list� wszystkich wniesionych op�at okresowych (dziennych) w 2019 roku. W ramach
--prezentowanej informacji podaj liczb� dni obowi�zywania danej licencji oraz jej koszt (patrz Rys. 8;
--uwaga, licencja obowi�zuje na dany dzie� co oznacza, �e np. rozpocz�cie po�owu o godz. 23:00
--a zako�czenie po 2-�ch godzinach (tj. o godz. 1:00) wymaga zakupu licencji na 2 dni. 
SELECT id_wedkarza, nazwisko, id_okregu, licencje.rok, od_dnia, do_dnia, 
((to_date(do_dnia||'-'||to_char(licencje.rok),'DD-MM-YYYY'))
-(to_date(od_dnia||'-'||to_char(licencje.rok),'DD-MM-YYYY'))+1) "DNI",
((to_date(do_dnia||'-'||to_char(licencje.rok),'DD-MM-YYYY'))
-(to_date(od_dnia||'-'||to_char(licencje.rok),'DD-MM-YYYY'))+1)*dzienna_oplata "OPLATA"
FROM licencje JOIN wedkarze USING(id_wedkarza) JOIN oplaty USING (ID_OKREGU) 
WHERE NOT(od_dnia like '01-01' AND do_dnia like '31-12') order by 8;

--Zad9 W oparciu o dane zawarte w tabeli Pracownicy wy�wietl list� por�wnuj�c� parami (tj. ka�dy z ka�dym)
--p�ace pracownik�w dzia�u 20-ego z p�acami pracownik�w dzia�u 30-ego (bez analizy okresu zatrudnienia;
--patrz Rys. 9). 
select p1.nr_akt, p1.id_dzialu, p1.placa, p2.nr_akt, p2.id_dzialu, p2.placa from Pracownicy p1 cross join pracownicy p2
where p1.id_dzialu= 20 AND p2.id_dzialu= 30;

select p1.nr_akt, p1.id_dzialu, p1.placa, p2.nr_akt, p2.id_dzialu, p2.placa from Pracownicy p1 join pracownicy p2 
on (p1.nr_akt != p2.nr_akt ) where p1.id_dzialu= 20 AND p2.id_dzialu= 20;

--Zad10 W oparciu o dane zawarte w tabeli Pracownicy wy�wietl list� pracownik�w i ich prze�o�onych (Rys. 10).
--W przypadku braku prze�o�onego w ramach kolumny prze�o�ony zastosuj fraz� � Brak� (bez analizy okresu
--zatrudnienia).
SELECT p1.nazwisko, p1.imiona, p1.stanowisko, DECODE(NVL(p1.przelozony,0),0,'brak',p1.przelozony) przelozony
, p2.nazwisko||' '||p2.imiona  szef FROM PRACOWNICY p1 left join Pracownicy p2 on(p1.przelozony=p2.nr_akt);


--Zad11 W oparciu o dane zawarte w tabeli Studenci wy�wietl informacj� ilu student�w kierunku informatyka
--studiuje na danym roku studi�w (patrz Rys. 11). 
SELECT kierunek,rok, count(*) FROM studenci WHERE kierunek='INFORMATYKA' group by kierunek,rok order by 1,2;

--Zad12 W oparciu o dane zawarte w tabeli Studenci wy�wietl informacj� ilu student�w studiuje dany kierunek
--w danym trybie studi�w. W zestawieniu uwzgl�dnij tylko podzbiory sk�adaj�ce si� z przynajmniej 100-u
--student�w (patrz Rys. 12).
SELECT kierunek,tryb, count(*) FROM studenci group by kierunek,tryb having count(*)>100 order by 1,2;

--Zad13 W oparciu o dane zawarte w tabeli Studenci wy�wietl informacj� ile studentek (pa�) studiuje w ramach
--danego stopnia, roku i grupy dzieka�skiej na kierunku Matematyka stosowana i technologie informatyczne.
--Informacj� uzupe�nij o �redni� liczon� z �rednich ocen studentek w danej grupie (patrz Rys. 13). 
SELECT stopien, rok, gr_dziekan, ROUND(avg(nvl(srednia,0)),2)"SREDNIA" FROM studenci 
WHERE imiona LIKE '%a' AND TRIM(UPPER(kierunek))=
'MATEMATYKA_STOSOWANA_I_TECHNOLOGIE_INFORMATYCZNE' group by stopien, rok, gr_dziekan;

--Zad14 W oparciu o dane zawarte w tabeli Studenci wy�wietl informacje o datach urodze� najstarszego studenta
--i najm�odszego studenta studiuj�cych na danym kierunku danego roku studi�w pierwszego stopnia w trybie
--stacjonarnym. List� uporz�dkuj w trybie nierosn�cym wg liczby pe�nych miesi�cy jakie dziel� daty urodze�
--tych student�w pod warunkiem, �e r�nica ta wynosi przynajmniej 100 miesi�cy (patrz Rys. 14). 
SELECT kierunek, rok, min(data_urodzenia) "NAJSTARSZY STUDENT", max(data_urodzenia)"NAJMLODSZY STUDENT",
TRUNC(MONTHS_BETWEEN(max(data_urodzenia),min(data_urodzenia))) "liczba miesiecy"
FROM studenci WHERE stopien=1 AND LOWER(tryb)='stacjonarny' group by kierunek, rok 
HAVING MONTHS_BETWEEN(max(data_urodzenia),min(data_urodzenia))>100;

--Zad15 W oparciu o dane zawarte w tabeli Rejestry wy�wietl informacje o liczbie wszystkich pr�b po�ow�w
--oraz o liczbie udanych po�ow�w zrealizowanych w danym dniu tygodnia (s�ownie) danego roku
--kalendarzowego w parzysty dzie� miesi�ca (2,4, �, 28, ew. 30). Dane wy�wietl uporz�dkowane w trybie
--niemalej�cym kolejno wg liczby wszystkich pr�b po�ow�w oraz liczby udanych po�ow�w (patrz Rys. 15).
select Extract(year from czas), to_char ( czas, 'day'), count(*), count (id_gatunku) from rejestry 
where mod( extract(month from czas), 2) = 0 group by Extract(year from czas), to_char ( czas, 'day')
order by 3 desc, 4 desc;

--Zad16  W oparciu o dane zawarte w tabelach Pojazdy i Wlasciciele wy�wietl informacj� o w�a�cicielach,
--kt�rzy posiadaj� od 7-miu do 16-tu pojazd�w ci�arowych. Dane uzupe�nij o informacj� z zakresu liczby
--marek posiadanych przez danego w�a�ciciela a wyniki wy�wietl uporz�dkowane w trybie nierosn�cym
--kolejno wg liczby posiadanych pojazd�w oraz liczby marek (patrz Rys. 16)
 SELECT id_wlasciciela, wlasciciel,  count(DISTINCT(marka)) "LICZBA MAREK",   
 count(marka) "LICZBA pojazd�w"FROM pojazdy left join wlasciciele USING (id_wlasciciela)  
 WHERE TYP='SAM_CIEZAROWY' group by id_wlasciciela, wlasciciel having count(*) BETWEEN 7 AND 16;
 SELECT * FROM pojazdy left join wlasciciele USING (id_wlasciciela) 
 WHERE wlasciciel='Firma Transportowa Rona Cecuzib Tapuc';
 
 --Zad17 W oparciu o dane zawarte w tabelach Pracownicy i Dzialy wy�wietl informacj� o �rednich warto�ciach p�ac
--(kolumna placa) pracownik�w aktualnie pracuj�cych w poszczeg�lnych dzia�ach firmy z uwzgl�dnieniem
--grupy pracownik�w nieposiadaj�cych przynale�no�ci do �adnego dzia�u. Dane wy�wietl uporz�dkowane
--w trybie nierosn�cym wg �redniej p�acy (patrz Rys. 17) .
SELECT id_dzialu, nazwa, TRUNC(avg(placa),2) "SREDNIA PLACA" FROM pracownicy left join dzialy USING (id_dzialu) 
WHERE data_zwol is NULL or data_zwol>sysdate group by id_dzialu, nazwa order by 3 desc;
SELECT * FROM dzialy;

--Zad18 W oparciu o dane zawarte w tabelach Pracownicy i Dzialy wy�wietl informacje o kosztach jakie ponosi
--firma w poszczeg�lnych miastach (z adresu dzia�u) z tytu�u wyp�acania miesi�cznej pensji swoim aktualnym
--pracownikom (p�aca+dodatki). Informacj� uzupe�nij o dane w zakresie liczby wszystkich pracownik�w
--pracuj�cych w danym mie�cie oraz ilu z nich posiada ubezpieczenie. W zestawieniu uwzgl�dnij
--pracownik�w �nieposiadaj�cych dzia�u� a dane wy�wietl w trybie nierosn�cym wg koszt�w pracowniczych
--(patrz Rys. 18).
select  substr( adres, regexp_instr(adres, '[[:digit:]](\s[[:alpha:]]{1,})?\s[[:alpha:]]{1,}$')+2) 
LOKALIZACJA, count(nr_akt ), count (koszt_ubezpieczenia), sum(placa) from Dzialy right JOIN PRACOWNICY
USING (ID_DZIALU) group by substr( adres, regexp_instr(adres, 
'[[:digit:]](\s[[:alpha:]]{1,})?\s[[:alpha:]]{1,}$')+2);
select adres from dzialy;

--Zad19 W oparciu o dane zawarte w tabelach Pracownicy i Stanowiska wy�wietl informacje w zakresie ilu
--aktualnie pracownik�w pracuje na danym stanowisku (z uwzgl�dnieniem nieobsadzonych stanowisk),
--ile wynosi �rednia, najni�sza i najwy�sza p�aca pracownika pracuj�cego na danym stanowisku.
--Dane wy�wietl uporz�dkowane w trybie niemalej�cym kolejno wg liczy pracownik�w oraz �redniej p�acy
--(patrz Rys. 19). 
SELECT stanowisko, count(nr_akt),TRUNC(avg(placa),2), min(placa), max(placa)  
FROM Pracownicy right join stanowiska USING (stanowisko) 
WHERE (data_zwol is null or data_zwol>sysdate) group by stanowisko ORDER BY 2,3;

--Zad20 W oparciu o dane zawarte w tabelach Rejestry i Gatunki wy�wietl statystyki po�ow�w poszczeg�lnych
--gatunk�w (w��cznie z tym, kt�re nigdy nie zosta�y nigdy z�owione) w zakresie liczby z�owionych sztuk,
--��cznej i �redniej ich wagi (z dok�adno�ci� do 1 grama) oraz �redniej d�ugo�ci (z dok�adno�ci� do 0.1 cm.).
--W zestawieniu uwzgl�dnij r�wnie� po�owy nieudane wstawiaj�c w kolumny id_gatunku i nazwa kolejno
--frazy brak i brak po�owu (patrz Rys. 20). Dane wy�wietl uporz�dkowane w trybie nierosn�cym wg liczby
--z�owionych ryb oraz wg nazwy gatunku (alfabetycznie).
SELECT DECODE(NVL(id_gatunku,0),0 ,'brak', id_gatunku) ID,
DECODE(NVL(id_gatunku,0), 0 ,'brak polowu', nazwa ) NAZWA,
count(nvl(id_gatunku,0)) LICZBA, ROUND(SUM(nvl(Waga,0)))SUMA_WAG, TRUNC(avg(nvl(dlugosc,0)),1) SREDNIA_DLUGOSCI
FROM rejestry left join gatunki USING(id_gatunku) group by id_gatunku, nazwa  order by 3 desc, 2;

--Zad21 W oparciu o dane zawarte w tabelach Rejestry i Lowiska wy�wietl informacje o �owiskach, na kt�rych
--z�owiono przynajmniej 6 ryb i odnotowano przynajmniej 2 nieudane po�owy w okresie trwaj�cym 2 lata
--21 dni 19 godzin i 28 sekund poczynaj�c od godz. 7:05 w dniu 14.07.2018. Informacj� uzupe�nij o liczb�
--w�dkarzy, kt�rzy przynajmniej raz odwiedzili dane �owisko w rozpatrywanym okresie (patrz Rys. 21). 
SELECT id_lowiska, nazwa, count(id_gatunku)"LICZBA POLOWOW", count(*)-count(id_gatunku)"LICZBA RYB",
count(id_wedkarza)"LICZBA WEDKARZY"FROM REJESTRY  
right JOIN LOWISKA  USING (id_lowiska) WHERE CZAS BETWEEN TIMESTAMP'2018-07-04 07:05:00' 
AND (TIMESTAMP'2018-07-04 07:05:00'+INTERVAL'02-00' YEAR to month + INTERVAL'21 19:00:28' day to second)
group by id_lowiska, nazwa having count(id_gatunku)>6 AND (count(*)-count(id_gatunku))>=2 ;

--Zad22 W oparciu o dane zawarte w tabelach Okregi, Oplaty i Licencje wy�wietl informacje ile licencji przez ilu
--w�dkarzy (r�nych) zosta�o wykupionych w danym roku u danego zarz�dcy w�d. W zestawieniu uwzgl�dnij
--wszystkie oferty z poszczeg�lnych lat (dane w tabeli Oplaty) w��cznie z tymi, z kt�rych nie skorzysta� �aden
--w�dkarz. Dane wy�wietl uporz�dkowane kolejno wg roku i identyfikatora okr�gu (patrz Rys. 22)
SELECT * FROM STUDENCI;
SELECT * FROM OCENY;
SELECT * FROM STUDENCI JOIN OCENY ON( nr_indeksu);

--24. Na podstawie danych zwartych w tabelach Pojazdy i Wlasciciele wy�wietl list� w�a�cicieli posiadajacych
--status osoby fizycznej, kt�rzy nie posiadaj� �adnego pojazdu lub posiadaj� dok�adnie 3 pojazdy 3-ech
--r�nych marek. Dane wy�wietl uporz�dkowane kolejno wg liczby posiadanych pojazd�w (w trybie
--niemalej�cym), nazwisk i imion (w trybie alfabetycznym; patrz Rys. 24)
select id_wlasciciela, wlasciciel, count(VIN), count(distinct(marka)) from pojazdy right join
wlasciciele using(id_wlasciciela)where status_wlasciciela like 'osoba_fizyczna' group by id_wlasciciela, wlasciciel
having count (VIN)=0 or count(VIN)=3 AND count(distinct(marka))=3;

SELECT REPLACE(lower(imiona),'an','ew'), TRANSLATE(lower(imiona),'ans','ewt'), adres, RPAD(lpad(imiona, LENGTH(imiona)+5,'*'),(LENGTH(imiona)+5)+5,'*'), SUBSTR(adres,INSTR(adres,'a'), 1 ) FROM studenci;


SELECT NVL2(koszt_ubezpieczenia,to_char(koszt_ubezpieczenia), 'brak'),koszt_ubezpieczenia FROM pracownicy;