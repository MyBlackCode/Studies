--Lista3
--Zad1 Wyœwietl o jak¹ kwotê (wartoœæ bezwzglêdna) odbiegaj¹ zarobki (pe³na pensja) aktualnych
--pracowników (tabela Pracownicy) od œredniej krajowej wynosz¹cej 5411.45 PLN. Uzyskane
--wartoœci zaokr¹glij kolejno do 1-ego miejsca po przecinku stosuj¹c funkcje Round oraz do pe³nych
--100-ek stosuj¹c funkcjê Trunc. Wyniki przedstaw od najlepiej do najgorzej zarabiaj¹cych podaj¹c
--m. in. ich nazwisko, zajmowane stanowisko oraz pensjê (Rys. 1).
SELECT nazwisko, stanowisko,
ROUND(placa+ NVL(dod_funkcyjny,0)+NVL(dod_staz,0)/placa*100-NVL(koszt_ubezpieczenia,0),1) pensja,
ROUND(((placa+ NVL(dod_funkcyjny,0)+NVL(dod_staz,0)/placa*100-NVL(koszt_ubezpieczenia,0)) -5411.45),3) odchylenie,
ROUND(ABS((placa+ NVL(dod_funkcyjny,0)+NVL(dod_staz,0)/placa*100-NVL(koszt_ubezpieczenia,0)) -5411.45),-2) "ROUND do 100-tek",
TRUNC(ABS((placa+ NVL(dod_funkcyjny,0)+NVL(dod_staz,0)/placa*100-NVL(koszt_ubezpieczenia,0)) -5411.45),1) "TRUNC do 0,1"
FROM pracownicy WHERE data_zwol is NULL ORDER BY 3 desc;

--Zad2 Wyœwietl wartoœci p³ac (kolumna placa) poszczególnych pracowników pomniejszone o 17% podatek
--(p³aca netto). W osobnej kolumnie wyœwietl p³acê netto zaokr¹glon¹ do setek (np. 2343.12 ? 2300)
--a w ostatniej ró¿nice w poszczególnych p³acach wynikaj¹ce z rodzaju zastosowanych funkcji
--zaokr¹glaj¹cych wartoœci p³ac „do setek” (funkcje Round i Trunc).
SELECT placa-(0.17*placa)"PLACA NETTO", ROUND(placa-(0.17*placa),-2)"ROUND PLACA NETTO", 
ABS((placa-(0.17*placa)) - (ROUND(placa-(0.17*placa),-2)))"ROZNICA PLACY NETTO I ROUND",
TRUNC(placa-(0.17*placa),-2)"TRUNC PLACA NETTO",
ABS((placa-(0.17*placa)) - (TRUNC(placa-(0.17*placa),-2)))"ROZNICA PLACY NETTO I TRUNC",
ABS(TRUNC(placa-(0.17*placa),-2) - (ROUND(placa-(0.17*placa),-2)))"ROZNICA ROUND I TRUNC"
FROM pracownicy;

--Zad3 Napisz zapytanie obliczaj¹ce wartoœæ nastêpuj¹cego wyra¿enia
--?(11.23^4+^4?2399+?(1234.56)+log(7) log12345) oraz wartoœci jakie uzyska siê po zastosowaniu
--wobec tego wyra¿enia funkcji Round, Trunc, Ceil oraz Floor.
SELECT SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7)) WYNIK, 
ROUND(SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7))) ROUND,
TRUNC(SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7))) TRUNC,
CEIL(SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7))) CEIL,
FLOOR(SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7))) FLOOR FROM dual;

--Zad4  Wyœwietl kolejno przedzia³ 101 lat i 11 miesiêcy oraz przedzia³ 25 dni 3 godziny 5 minut i 36.6
--sekund oraz znacznik czasowy obejmuj¹cy ³¹cznie oba te przedzia³y (Rys. 4).
SELECT INTERVAL '101-11' YEAR(3) TO MONTH "PRZEDZIAL 101 LAT I 11 MINUT",
INTERVAL'25 03:05:36.6' DAY TO SECOND "PRZEDZIAL 25 DNI 3 GODZINY",
TIMESTAMP '101-11-25 03:05:36.6' "OBA PRZEDZIALY" FROM dual;

--Zad5 Wyœwietl informacje o tym jaka data bêdzie za 4321 dni i jaka data by³a 4321 dni temu
--oraz w odrêbnych kolumnach ile pe³nych miesiêcy i ile pe³nych tygodni dzieli obie daty.
SELECT SYSDATE+4321 PRZYSZLOSC, SYSDATE-4321, TRUNC(MONTHS_BETWEEN((SYSDATE+4321),(SYSDATE-4321))) MESIACE,
TRUNC(MONTHS_BETWEEN((SYSDATE+4321),(SYSDATE-4321))/7) TYGODNIE FROM dual;

--Zad6 Wyœwietl datê i czas jaki by³ 1234 dni, 18 godzin i 6 minut temu oraz jaki bêdzie za
--189 lat i 5 miesiêcy (Rys. 6).
SELECT to_char(SYSTIMESTAMP,'YYYY-MM-DD HH:MM:SS') TERAZ, to_char(SYSTIMESTAMP - 
INTERVAL '1234 18:06:00.0' DAY(4) TO SECOND, 'YYYY-MM-DD HH:MM:SS') PRZESZLOSC,
to_char(SYSDATE + INTERVAL '189-05' YEAR(3) TO MONTH, 'YYYY-MM-DD HH:MM:SS') PRZYSZLOSC FROM dual;

--Zad7   Wyœwietl ile czasu up³ynê³o od 2013.12.15 21:14:09 do 2021.02.11 7:17. Wynik podaj w dwóch
--formach/kolumnach jak na Rys. 7.
SELECT TIMESTAMP '2021-02-11 7:17:00' - TIMESTAMP '2013-12-15 21:14:09',
(TIMESTAMP '2021-02-11 7:17:00' - TIMESTAMP '2013-12-15 21:14:09')YEAR to month
FROM dual;

--Zad8 W odrêbnych kolumnach kolejno wyœwietl aktualny rok, miesi¹c, dzieñ oraz aktualn¹ godzinê,
--minutê i sekundê (jak na Rys. 8).
SELECT EXTRACT(YEAR FROM SYSDATE)ROK, EXTRACT(MONTH FROM SYSDATE)MIESIAC, EXTRACT(DAY FROM SYSDATE) DIEN,
EXTRACT(HOUR FROM SYSTIMESTAMP)GODZINA , EXTRACT(MINUTE FROM SYSTIMESTAMP)MINUTA,
TRUNC(EXTRACT(SECOND FROM SYSTIMESTAMP)) SEKUNDA FROM dual;

--Zad9  W oparciu o dane zawarte w tabeli Studenci wyœwietl studentów, którzy dzisiaj obchodz¹ urodziny.
SELECT * FROM studenci where EXTRACT(MONTH FROM data_urodzenia) = EXTRACT(MONTH FROM SYSDATE)
AND EXTRACT(DAY FROM data_urodzenia) = EXTRACT(DAY FROM SYSDATE);

--Zad10 Napisz zapytanie zwracaj¹ce informacjê jaka data bêdzie za 123 miesi¹ce oraz który to bêdzie
--tydzieñ w roku.
SELECT to_char(add_months(sysdate,123), 'YYYY-MM-DD ww')DATA FROM dual;

--Zad11 Wyœwietl datê ostatniego dnia aktualnego miesi¹ca oraz informacjê jaki to bêdzie dzieñ tygodnia
--(s³ownie) np. 21/10/31 niedziela. 
SELECT to_char(LAST_DAY(sysdate), 'YYYY-MM-DD DAY' ) FROM dual;

--Zad12  Zaokr¹glij aktualn¹ datê kolejno do miesiêcy (funkcj¹ Round), lat (funkcj¹ Trunc) i wieków.
SELECT to_char(SYSDATE, 'YYYY-MM-DD' ) AKTUALNE, to_char(ROUND(SYSDATE,'MM'), 'YYYY-MM-DD' )MIESIECY,  
to_char(TRUNC(SYSDATE,'YYYY'), 'YYYY-MM-DD' )LAT, to_char(TRUNC(SYSDATE,'CC'), 'YYYY-MM-DD' )WIEKOW 
FROM dual;

--Zad13 . W oparciu o dane zawarte w tabeli Studenci wyœwietl nazwiska i imiona studentów, których imiê
--rozpoczyna siê na 'M' uporz¹dkowanych od najstarszego do najm³odszego z informacj¹ ile aktualnie
--maj¹ lat (Rys. 11). Zaproponuj dwa rozwi¹zania w zakresie szacowania wieku studentów: pe³ne
--skoñczone lata oraz tzw. metod¹ „rocznikow¹”. 
SELECT imiona, nazwisko, data_urodzenia, EXTRACT(YEAR FROM sysdate)- EXTRACT(YEAR FROM data_urodzenia) "METODA ROCZNIKOWA",
TRUNC((MONTHS_BETWEEN(sysdate,data_urodzenia))/12) "PELNE LATA"
FROM studenci where substr(imiona,1,1) = 'M' order by 3;

--Zad14 Dokonaj konwersji aktualnego znacznika czasowego do daty (zastosuj funkcjê Cast; Rys. 12)
SELECT Current_timestamp "aktualny czas"  ,CAST(SYSDATE AS DATE) data FROM dual;

--Zad15 W ramach zapytania dokonaj po³¹czenia dwóch ³añcuchów '987' i '654' oraz wyœwietl wynik
--ró¿nicy otrzymanej liczby i wartoœci 123456 (zastosuj konwersjê typów; Rys. 13). 
SELECT CONCAT('987','654') LANCUCH, TO_NUMBER(CONCAT('987','654'))LICZBA,
TO_NUMBER(CONCAT('987','654'))- 123456 WYNIK FROM dual;

--Zad16 Wyœwietl aktualny wiek cyframi rzymskimi
SELECT to_char(to_char(sysdate,'CC'),'RN')FROM dual;

--Zad17 Wyœwietl aktualn¹ datê w postaci np. czêœæ, jest dzisiaj czwartek, 2 styczeñ 2021 roku.
SELECT 'jest dzisiaj '|| to_char(SYSDATE, 'DAY'), to_char(SYSDATE,'DD month YYYY') FROM dual;

--Zad18  Wyœwietl wiek, kwarta³, miesi¹c, tydzieñ miesi¹ca oraz dzieñ tygodnia daty podanej w formie
--'27-09-1959' (patrz przyk³ad na Rys. 14).
SELECT 'wiek ' ||  to_char(to_date('27-09-1959','DD-MM-YYYY'),'CC') || ' kwartal ' ||
to_char(to_date('27-09-1959','DD-MM-YYYY'),'Q') || ' miesiac ' ||
to_char(to_date('27-09-1959','DD-MM-YYYY'),'month') || ' tydzien miesica ' ||
to_char(to_date('27-09-1959','DD-MM-YYYY'),'W') || ' dzien tygodnia ' ||
to_char(to_date('27-09-1959','DD-MM-YYYY'),'DAY') FROM dual;

--Zad19 W oparciu o dane zawarte w tabeli Studenci wyœwietl dane studentek (patrz Rys. 15), które urodzi³y
--siê w wakacyjny weekend (w lipcow¹ lub sierpniow¹ sobotê lub niedzielê) pod warunkiem,
--¿e dzieñ miesi¹ca nie jest dzielnikiem liczby 5 (np. 6.07.1999 ale 10.08.1999 ju¿ nie; Rys. 15).
SELECT * FROM studenci where imiona like '%a' AND EXTRACT(month FROM data_urodzenia) IN (7,8)
AND  UPPER(TRIM(to_char(data_urodzenia, 'DAY'))) IN ('SOBOTA','NIEDZIELA')AND 
MOD(EXTRACT(DAY FROM data_urodzenia),5)!=0;

--Zad20 W oparciu o dane zawarte w tabeli Pracownicy wyœwietl aktualnie pracuj¹cych pracowników,
--porz¹dkuj¹c ich wed³ug sta¿u pracy podanego w pe³nych latach i miesi¹cach pracy oraz kolejnoœci
--alfabetycznej nazwisk (Rys. 16).
SELECT NAZWISKO, STANOWISKO, DATA_ZATR, DATA_ZWOL,  TRUNC(TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_ZATR))/12) || ' lat ' || 
MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_ZATR)),12) || ' miesiecy' "pracuje juz" FROM pracownicy 
WHERE data_zwol is NULL order by (TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_ZATR))/12) desc, nazwisko; 

--Zad21 W oparciu o dane zawarte w tabeli Pracownicy wyœwietl listê wynagrodzeñ pracowników
--za miesi¹c maj 2018, którzy byli pracownikami przez ca³y ten okres (Rys. 17).
SELECT nazwisko, stanowisko, data_zatr, data_zwol, placa+ NVL(dod_funkcyjny,0)+ placa* NVL(dod_staz,0)*0.01 - NVL(koszt_ubezpieczenia,0) PENSJA
FROM pracownicy WHERE data_zatr <= to_date('01.05.2018', 'dd.mm.yyyy') AND (data_zwol is NULL
OR data_zwol >= to_date('30.05.2018', 'dd.mm.yyyy'));

--Zad22  W oparciu o dane zawarte w tabeli Studenci wyœwietl uporz¹kowan¹ listê studentów
--(od najstarszego do najm³odszego), którzy urodzili siê w pierwsz¹ sobotê (6-ty dzieñ tygodnia)
--danego miesi¹ca w okresie od 13.08.1997 do 23.01.2000.
SELECT * FROM studenci WHERE UPPER(TRIM(to_char(data_urodzenia,'DAY'))) LIKE 'SOBOTA' AND 
TRIM(to_char(data_urodzenia,'DD'))<=7 AND data_urodzenia BETWEEN to_date('1997-08-13','yyyy-mm-dd') 
AND to_date('2000-01-23','yyyy-mm-dd') order by data_urodzenia;

--Zad23 W oparciu o dane zawarte w tabeli Studenci wyœwietl personalia studentów (kolumny imiona
--i nazwisko), których imiê sk³ada siê dok³adnie z 5 liter a nazwisko rozpoczyna od frazy Ko a koñczy
--fraz¹ ski (patrz Rys. 18). 
SELECT * FROM studenci WHERE regexp_like(imiona,'[[:alpha:]]{5}') 
AND NOT regexp_like(imiona,'[[:alpha:]]{6}');

SELECT * FROM studenci WHERE regexp_like(imiona,'^([[:alpha:]]{5})$');

SELECT * FROM studenci WHERE regexp_count(imiona,'[[:alpha:]]')=5 
AND regexp_like(UPPER(nazwisko),'^(KO)[[:alpha:]]{0,}(SKI)$');

--Zad24 W oparciu o dane zgromadzone w tabeli Studenci za poœrednictwem wyra¿eñ regularnych dokonaj
--prezentacji zawartoœci kolumny adres w „zaszyfrowanej” formie, w której to ka¿dy wyraz
--sk³adaj¹cy siê z przynajmniej 3 liter bêdzie zast¹piony fraz¹ Alpha a ka¿da cyfra/liczba bêdzie
--zast¹piona fraz¹ Digit (patrz Rys. 19).
SELECT nazwisko, imiona, adres, regexp_replace(regexp_replace(adres,'[[:alpha:]]{3,}','Alpha'), 
'[[:digit:]]','Digit') FROM studenci;

--Zad25 W oparciu o dane zgromadzone w tabeli Studenci wyœwietl adresy (kolumna adres) wskazuj¹ce
--na ulice (ul. na pocz¹tku adresu), których nazwa rozpoczyna siê od litery D, O, P lub T,
--a numer domu/budynku to dok³adnie 188 (patrz Rys. 20). 
SELECT * FROM studenci WHERE regexp_like(adres,'^((al)|(ul))\.\s(D|O|P|T)[[:alpha:]]{0,}\s
([[:alpha:]]{1,})\s?188');

