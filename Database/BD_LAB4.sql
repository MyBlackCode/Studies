--Lista4 

--Zad1  W oparciu o dane zawarte w tabelach Pojazdy i Wlasciciele wyœwietl uporz¹dkowan¹ listê pojazdów
--(od najstarszego) wyprodukowanych w 2018 roku wraz z danymi ich w³aœcicieli (patrz Rys. 1)
SELECT * FROM pojazdy JOIN wlasciciele  USING(id_wlasciciela) WHERE EXTRACT(YEAR FROM data_produkcji)
LIKE 2018  ORDER BY 10 ;

--Zad2 W oparciu o dane zawarte w tabelach Pojazdy i Wlasciciele wyœwietl listê zawieraj¹c¹ dane pojazdów
--starszych od swoich w³aœcicieli maj¹cych status osoby fizycznej. Lista poza danymi pojazdów
--i ich w³aœcicieli powinna zawieraæ informacjê o wielkoœci ró¿nicy pomiêdzy wiekiem pojazdu i wiekiem
--jego w³aœciciela, podanej w dniach i pe³nych latach (patrz Rys. 2 kolumny dni i lat). Dane uporz¹dkuj
--wg ró¿nicy wieku w trybie nierosn¹cym. 
SELECT nr_rejestracyjny, marka, modell, wlasciciel, data_up, data_produkcji, data_up - data_produkcji DNI,
TRUNC(MONTHS_BETWEEN(data_up, data_produkcji)/12) "pelne lata" 
FROM pojazdy JOIN wlasciciele  USING(id_wlasciciela) WHERE data_produkcji < data_up 
AND status_wlasciciela LIKE 'osoba_fizyczna';

--Zad3 W oparciu o dane zawarte w tabelach Pracownicy i Stanowiska wyœwietl listê pracowników, których p³aca
--nie mieœci siê w wide³kach wynagrodzeñ przewidzianych dla stanowisk, na których aktualnie pracuj¹.
--Zawartoœæ listy zgodnie z Rys. 3 (bez analizy okresów zatrudnienia).
SELECT * FROM PRACOWNICY JOIN STANOWISKA USING(stanowisko) WHERE placa NOT BETWEEN placa_min AND placa_max;

--Zad4 W oparciu o dane zawarte w tabelach Rejestry, Wedkarze, Gatunki i Lowiska wyœwietl listê wszystkich
--udanych po³owów ryb (tj. id_gatunku posiada wartoœæ) podaj¹c dane wêdkarza, nazwy gatunków i ³owisk.
--Dane wyœwietl chronologicznie wg dat zdarzeñ po³owów (patrz Rys. 4).
SELECT * FROM  rejestry;
SELECT * FROM  wedkarze;
SELECT * FROM  gatunki;
SELECT * FROM  lowiska;
SELECT imiona||' ' || nazwisko "Wedkarz", gatunki.nazwa "GATUNEK" , lowiska.nazwa "LOWISKO"
FROM rejestry join gatunki USING(id_gatunku) join lowiska USING(id_lowiska)  join wedkarze 
USING(id_wedkarza) order by czas;

--Zad5 Zadanie stanowi¹ce rozszerzenie zadania 4. W oparciu o dane zawarte w tabelach Rejestry, Wedkarze,
--Gatunki i Lowiska wyœwietl informacje o wszystkich próbach po³owów ryb na przestrzeni ostatniego roku
--(wzglêdem aktualnego dnia). W przypadku braku po³owu w ramach kolumny gatunek umieœæ frazê „ brak
--polowu” (patrz Rys. 5). Dane wyœwietl chronologicznie wg dat zdarzeñ po³owów.
SELECT CAST(CZAS AS DATE)"DZIEN POLOWU", nazwisko, imiona, NVL(gatunki.nazwa,'brak polowu') "gatunek", lowiska.nazwa "LOWSISKO", 
NVL(waga,0), NVL(dlugosc,0) FROM rejestry left join gatunki USING(id_gatunku) join lowiska USING (id_lowiska)
join wedkarze USING (id_wedkarza) WHERE EXTRACT(YEAR FROM czas)=EXTRACT(YEAR FROM sysdate) order by czas;

--Zad6 W oparciu o dane zawarte w tabelach Licencje i Wedkarze wyœwietl listê wêdkarzy, którzy w aktualnym roku
--kalendarzowym op³acili ju¿ roczn¹ sk³adkê podstawow¹ na rzecz dowolnego okrêgu PZW (Rys. 6). 
SELECT * FROM licencje;
SELECT * FROM wedkarze;
SELECT * FROM oplaty;
SELECT * FROM licencje JOIN wedkarze USING(id_wedkarza) WHERE id_okregu like 'PZW%' 
AND ROK=EXTRACT(YEAR FROM sysdate) AND od_dnia='01-01' AND do_Dnia='31-12' AND rodzaj='podstawowa';

--Zad7 W oparciu o dane zawarte w tabelach Licencje i Wedkarze wyœwietl listê wszystkich wniesionych op³at
--okresowych (dziennych) w 2019 roku. Struktura listy jak na Rys. 7.
SELECT * FROM licencje JOIN wedkarze USING(id_wedkarza) WHERE ROK=2019 AND NOT(od_dnia like '01-01' AND do_dnia like '31-12');

--Zad8  Zadanie stanowi¹ce rozszerzenie zadania 7. W oparciu o dane zawarte w tabelach Licencje, Oplaty
--i Wedkarze wyœwietl listê wszystkich wniesionych op³at okresowych (dziennych) w 2019 roku. W ramach
--prezentowanej informacji podaj liczbê dni obowi¹zywania danej licencji oraz jej koszt (patrz Rys. 8;
--uwaga, licencja obowi¹zuje na dany dzieñ co oznacza, ¿e np. rozpoczêcie po³owu o godz. 23:00
--a zakoñczenie po 2-óch godzinach (tj. o godz. 1:00) wymaga zakupu licencji na 2 dni. 
SELECT id_wedkarza, nazwisko, id_okregu, licencje.rok, od_dnia, do_dnia, 
((to_date(do_dnia||'-'||to_char(licencje.rok),'DD-MM-YYYY'))
-(to_date(od_dnia||'-'||to_char(licencje.rok),'DD-MM-YYYY'))+1) "DNI",
((to_date(do_dnia||'-'||to_char(licencje.rok),'DD-MM-YYYY'))
-(to_date(od_dnia||'-'||to_char(licencje.rok),'DD-MM-YYYY'))+1)*dzienna_oplata "OPLATA"
FROM licencje JOIN wedkarze USING(id_wedkarza) JOIN oplaty USING (ID_OKREGU) 
WHERE NOT(od_dnia like '01-01' AND do_dnia like '31-12') order by 8;

--Zad9 W oparciu o dane zawarte w tabeli Pracownicy wyœwietl listê porównuj¹c¹ parami (tj. ka¿dy z ka¿dym)
--p³ace pracowników dzia³u 20-ego z p³acami pracowników dzia³u 30-ego (bez analizy okresu zatrudnienia;
--patrz Rys. 9). 
select p1.nr_akt, p1.id_dzialu, p1.placa, p2.nr_akt, p2.id_dzialu, p2.placa from Pracownicy p1 cross join pracownicy p2
where p1.id_dzialu= 20 AND p2.id_dzialu= 30;

select p1.nr_akt, p1.id_dzialu, p1.placa, p2.nr_akt, p2.id_dzialu, p2.placa from Pracownicy p1 join pracownicy p2 
on (p1.nr_akt != p2.nr_akt ) where p1.id_dzialu= 20 AND p2.id_dzialu= 20;

--Zad10 W oparciu o dane zawarte w tabeli Pracownicy wyœwietl listê pracowników i ich prze³o¿onych (Rys. 10).
--W przypadku braku prze³o¿onego w ramach kolumny prze³o¿ony zastosuj frazê „ Brak” (bez analizy okresu
--zatrudnienia).
SELECT p1.nazwisko, p1.imiona, p1.stanowisko, DECODE(NVL(p1.przelozony,0),0,'brak',p1.przelozony) przelozony
, p2.nazwisko||' '||p2.imiona  szef FROM PRACOWNICY p1 left join Pracownicy p2 on(p1.przelozony=p2.nr_akt);


--Zad11 W oparciu o dane zawarte w tabeli Studenci wyœwietl informacjê ilu studentów kierunku informatyka
--studiuje na danym roku studiów (patrz Rys. 11). 
SELECT kierunek,rok, count(*) FROM studenci WHERE kierunek='INFORMATYKA' group by kierunek,rok order by 1,2;

--Zad12 W oparciu o dane zawarte w tabeli Studenci wyœwietl informacjê ilu studentów studiuje dany kierunek
--w danym trybie studiów. W zestawieniu uwzglêdnij tylko podzbiory sk³adaj¹ce siê z przynajmniej 100-u
--studentów (patrz Rys. 12).
SELECT kierunek,tryb, count(*) FROM studenci group by kierunek,tryb having count(*)>100 order by 1,2;

--Zad13 W oparciu o dane zawarte w tabeli Studenci wyœwietl informacjê ile studentek (pañ) studiuje w ramach
--danego stopnia, roku i grupy dziekañskiej na kierunku Matematyka stosowana i technologie informatyczne.
--Informacjê uzupe³nij o œredni¹ liczon¹ z œrednich ocen studentek w danej grupie (patrz Rys. 13). 
SELECT stopien, rok, gr_dziekan, ROUND(avg(nvl(srednia,0)),2)"SREDNIA" FROM studenci 
WHERE imiona LIKE '%a' AND TRIM(UPPER(kierunek))=
'MATEMATYKA_STOSOWANA_I_TECHNOLOGIE_INFORMATYCZNE' group by stopien, rok, gr_dziekan;

--Zad14 W oparciu o dane zawarte w tabeli Studenci wyœwietl informacje o datach urodzeñ najstarszego studenta
--i najm³odszego studenta studiuj¹cych na danym kierunku danego roku studiów pierwszego stopnia w trybie
--stacjonarnym. Listê uporz¹dkuj w trybie nierosn¹cym wg liczby pe³nych miesiêcy jakie dziel¹ daty urodzeñ
--tych studentów pod warunkiem, ¿e ró¿nica ta wynosi przynajmniej 100 miesiêcy (patrz Rys. 14). 
SELECT kierunek, rok, min(data_urodzenia) "NAJSTARSZY STUDENT", max(data_urodzenia)"NAJMLODSZY STUDENT",
TRUNC(MONTHS_BETWEEN(max(data_urodzenia),min(data_urodzenia))) "liczba miesiecy"
FROM studenci WHERE stopien=1 AND LOWER(tryb)='stacjonarny' group by kierunek, rok 
HAVING MONTHS_BETWEEN(max(data_urodzenia),min(data_urodzenia))>100;

--Zad15 W oparciu o dane zawarte w tabeli Rejestry wyœwietl informacje o liczbie wszystkich prób po³owów
--oraz o liczbie udanych po³owów zrealizowanych w danym dniu tygodnia (s³ownie) danego roku
--kalendarzowego w parzysty dzieñ miesi¹ca (2,4, …, 28, ew. 30). Dane wyœwietl uporz¹dkowane w trybie
--niemalej¹cym kolejno wg liczby wszystkich prób po³owów oraz liczby udanych po³owów (patrz Rys. 15).
select Extract(year from czas), to_char ( czas, 'day'), count(*), count (id_gatunku) from rejestry 
where mod( extract(month from czas), 2) = 0 group by Extract(year from czas), to_char ( czas, 'day')
order by 3 desc, 4 desc;

--Zad16  W oparciu o dane zawarte w tabelach Pojazdy i Wlasciciele wyœwietl informacjê o w³aœcicielach,
--którzy posiadaj¹ od 7-miu do 16-tu pojazdów ciê¿arowych. Dane uzupe³nij o informacjê z zakresu liczby
--marek posiadanych przez danego w³aœciciela a wyniki wyœwietl uporz¹dkowane w trybie nierosn¹cym
--kolejno wg liczby posiadanych pojazdów oraz liczby marek (patrz Rys. 16)
 SELECT id_wlasciciela, wlasciciel,  count(DISTINCT(marka)) "LICZBA MAREK",   
 count(marka) "LICZBA pojazdów"FROM pojazdy left join wlasciciele USING (id_wlasciciela)  
 WHERE TYP='SAM_CIEZAROWY' group by id_wlasciciela, wlasciciel having count(*) BETWEEN 7 AND 16;
 SELECT * FROM pojazdy left join wlasciciele USING (id_wlasciciela) 
 WHERE wlasciciel='Firma Transportowa Rona Cecuzib Tapuc';
 
 --Zad17 W oparciu o dane zawarte w tabelach Pracownicy i Dzialy wyœwietl informacjê o œrednich wartoœciach p³ac
--(kolumna placa) pracowników aktualnie pracuj¹cych w poszczególnych dzia³ach firmy z uwzglêdnieniem
--grupy pracowników nieposiadaj¹cych przynale¿noœci do ¿adnego dzia³u. Dane wyœwietl uporz¹dkowane
--w trybie nierosn¹cym wg œredniej p³acy (patrz Rys. 17) .
SELECT id_dzialu, nazwa, TRUNC(avg(placa),2) "SREDNIA PLACA" FROM pracownicy left join dzialy USING (id_dzialu) 
WHERE data_zwol is NULL or data_zwol>sysdate group by id_dzialu, nazwa order by 3 desc;
SELECT * FROM dzialy;

--Zad18 W oparciu o dane zawarte w tabelach Pracownicy i Dzialy wyœwietl informacje o kosztach jakie ponosi
--firma w poszczególnych miastach (z adresu dzia³u) z tytu³u wyp³acania miesiêcznej pensji swoim aktualnym
--pracownikom (p³aca+dodatki). Informacjê uzupe³nij o dane w zakresie liczby wszystkich pracowników
--pracuj¹cych w danym mieœcie oraz ilu z nich posiada ubezpieczenie. W zestawieniu uwzglêdnij
--pracowników „nieposiadaj¹cych dzia³u” a dane wyœwietl w trybie nierosn¹cym wg kosztów pracowniczych
--(patrz Rys. 18).
select  substr( adres, regexp_instr(adres, '[[:digit:]](\s[[:alpha:]]{1,})?\s[[:alpha:]]{1,}$')+2) 
LOKALIZACJA, count(nr_akt ), count (koszt_ubezpieczenia), sum(placa) from Dzialy right JOIN PRACOWNICY
USING (ID_DZIALU) group by substr( adres, regexp_instr(adres, 
'[[:digit:]](\s[[:alpha:]]{1,})?\s[[:alpha:]]{1,}$')+2);
select adres from dzialy;

--Zad19 W oparciu o dane zawarte w tabelach Pracownicy i Stanowiska wyœwietl informacje w zakresie ilu
--aktualnie pracowników pracuje na danym stanowisku (z uwzglêdnieniem nieobsadzonych stanowisk),
--ile wynosi œrednia, najni¿sza i najwy¿sza p³aca pracownika pracuj¹cego na danym stanowisku.
--Dane wyœwietl uporz¹dkowane w trybie niemalej¹cym kolejno wg liczy pracowników oraz œredniej p³acy
--(patrz Rys. 19). 
SELECT stanowisko, count(nr_akt),TRUNC(avg(placa),2), min(placa), max(placa)  
FROM Pracownicy right join stanowiska USING (stanowisko) 
WHERE (data_zwol is null or data_zwol>sysdate) group by stanowisko ORDER BY 2,3;

--Zad20 W oparciu o dane zawarte w tabelach Rejestry i Gatunki wyœwietl statystyki po³owów poszczególnych
--gatunków (w³¹cznie z tym, które nigdy nie zosta³y nigdy z³owione) w zakresie liczby z³owionych sztuk,
--³¹cznej i œredniej ich wagi (z dok³adnoœci¹ do 1 grama) oraz œredniej d³ugoœci (z dok³adnoœci¹ do 0.1 cm.).
--W zestawieniu uwzglêdnij równie¿ po³owy nieudane wstawiaj¹c w kolumny id_gatunku i nazwa kolejno
--frazy brak i brak po³owu (patrz Rys. 20). Dane wyœwietl uporz¹dkowane w trybie nierosn¹cym wg liczby
--z³owionych ryb oraz wg nazwy gatunku (alfabetycznie).
SELECT DECODE(NVL(id_gatunku,0),0 ,'brak', id_gatunku) ID,
DECODE(NVL(id_gatunku,0), 0 ,'brak polowu', nazwa ) NAZWA,
count(nvl(id_gatunku,0)) LICZBA, ROUND(SUM(nvl(Waga,0)))SUMA_WAG, TRUNC(avg(nvl(dlugosc,0)),1) SREDNIA_DLUGOSCI
FROM rejestry left join gatunki USING(id_gatunku) group by id_gatunku, nazwa  order by 3 desc, 2;

--Zad21 W oparciu o dane zawarte w tabelach Rejestry i Lowiska wyœwietl informacje o ³owiskach, na których
--z³owiono przynajmniej 6 ryb i odnotowano przynajmniej 2 nieudane po³owy w okresie trwaj¹cym 2 lata
--21 dni 19 godzin i 28 sekund poczynaj¹c od godz. 7:05 w dniu 14.07.2018. Informacjê uzupe³nij o liczbê
--wêdkarzy, którzy przynajmniej raz odwiedzili dane ³owisko w rozpatrywanym okresie (patrz Rys. 21). 
SELECT id_lowiska, nazwa, count(id_gatunku)"LICZBA POLOWOW", count(*)-count(id_gatunku)"LICZBA RYB",
count(id_wedkarza)"LICZBA WEDKARZY"FROM REJESTRY  
right JOIN LOWISKA  USING (id_lowiska) WHERE CZAS BETWEEN TIMESTAMP'2018-07-04 07:05:00' 
AND (TIMESTAMP'2018-07-04 07:05:00'+INTERVAL'02-00' YEAR to month + INTERVAL'21 19:00:28' day to second)
group by id_lowiska, nazwa having count(id_gatunku)>6 AND (count(*)-count(id_gatunku))>=2 ;

--Zad22 W oparciu o dane zawarte w tabelach Okregi, Oplaty i Licencje wyœwietl informacje ile licencji przez ilu
--wêdkarzy (ró¿nych) zosta³o wykupionych w danym roku u danego zarz¹dcy wód. W zestawieniu uwzglêdnij
--wszystkie oferty z poszczególnych lat (dane w tabeli Oplaty) w³¹cznie z tymi, z których nie skorzysta³ ¿aden
--wêdkarz. Dane wyœwietl uporz¹dkowane kolejno wg roku i identyfikatora okrêgu (patrz Rys. 22)
SELECT * FROM STUDENCI;
SELECT * FROM OCENY;
SELECT * FROM STUDENCI JOIN OCENY ON( nr_indeksu);

--24. Na podstawie danych zwartych w tabelach Pojazdy i Wlasciciele wyœwietl listê w³aœcicieli posiadajacych
--status osoby fizycznej, którzy nie posiadaj¹ ¿adnego pojazdu lub posiadaj¹ dok³adnie 3 pojazdy 3-ech
--ró¿nych marek. Dane wyœwietl uporz¹dkowane kolejno wg liczby posiadanych pojazdów (w trybie
--niemalej¹cym), nazwisk i imion (w trybie alfabetycznym; patrz Rys. 24)
select id_wlasciciela, wlasciciel, count(VIN), count(distinct(marka)) from pojazdy right join
wlasciciele using(id_wlasciciela)where status_wlasciciela like 'osoba_fizyczna' group by id_wlasciciela, wlasciciel
having count (VIN)=0 or count(VIN)=3 AND count(distinct(marka))=3;

SELECT REPLACE(lower(imiona),'an','ew'), TRANSLATE(lower(imiona),'ans','ewt'), adres, RPAD(lpad(imiona, LENGTH(imiona)+5,'*'),(LENGTH(imiona)+5)+5,'*'), SUBSTR(adres,INSTR(adres,'a'), 1 ) FROM studenci;


SELECT NVL2(koszt_ubezpieczenia,to_char(koszt_ubezpieczenia), 'brak'),koszt_ubezpieczenia FROM pracownicy;