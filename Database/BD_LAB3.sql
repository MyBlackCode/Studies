--Lista3
--Zad1 Wy�wietl o jak� kwot� (warto�� bezwzgl�dna) odbiegaj� zarobki (pe�na pensja) aktualnych
--pracownik�w (tabela Pracownicy) od �redniej krajowej wynosz�cej 5411.45 PLN. Uzyskane
--warto�ci zaokr�glij kolejno do 1-ego miejsca po przecinku stosuj�c funkcje Round oraz do pe�nych
--100-ek stosuj�c funkcj� Trunc. Wyniki przedstaw od najlepiej do najgorzej zarabiaj�cych podaj�c
--m. in. ich nazwisko, zajmowane stanowisko oraz pensj� (Rys. 1).
SELECT nazwisko, stanowisko,
ROUND(placa+ NVL(dod_funkcyjny,0)+NVL(dod_staz,0)/placa*100-NVL(koszt_ubezpieczenia,0),1) pensja,
ROUND(((placa+ NVL(dod_funkcyjny,0)+NVL(dod_staz,0)/placa*100-NVL(koszt_ubezpieczenia,0)) -5411.45),3) odchylenie,
ROUND(ABS((placa+ NVL(dod_funkcyjny,0)+NVL(dod_staz,0)/placa*100-NVL(koszt_ubezpieczenia,0)) -5411.45),-2) "ROUND do 100-tek",
TRUNC(ABS((placa+ NVL(dod_funkcyjny,0)+NVL(dod_staz,0)/placa*100-NVL(koszt_ubezpieczenia,0)) -5411.45),1) "TRUNC do 0,1"
FROM pracownicy WHERE data_zwol is NULL ORDER BY 3 desc;

--Zad2 Wy�wietl warto�ci p�ac (kolumna placa) poszczeg�lnych pracownik�w pomniejszone o 17% podatek
--(p�aca netto). W osobnej kolumnie wy�wietl p�ac� netto zaokr�glon� do setek (np. 2343.12 ? 2300)
--a w ostatniej r�nice w poszczeg�lnych p�acach wynikaj�ce z rodzaju zastosowanych funkcji
--zaokr�glaj�cych warto�ci p�ac �do setek� (funkcje Round i Trunc).
SELECT placa-(0.17*placa)"PLACA NETTO", ROUND(placa-(0.17*placa),-2)"ROUND PLACA NETTO", 
ABS((placa-(0.17*placa)) - (ROUND(placa-(0.17*placa),-2)))"ROZNICA PLACY NETTO I ROUND",
TRUNC(placa-(0.17*placa),-2)"TRUNC PLACA NETTO",
ABS((placa-(0.17*placa)) - (TRUNC(placa-(0.17*placa),-2)))"ROZNICA PLACY NETTO I TRUNC",
ABS(TRUNC(placa-(0.17*placa),-2) - (ROUND(placa-(0.17*placa),-2)))"ROZNICA ROUND I TRUNC"
FROM pracownicy;

--Zad3 Napisz zapytanie obliczaj�ce warto�� nast�puj�cego wyra�enia
--?(11.23^4+^4?2399+?(1234.56)+log(7) log12345) oraz warto�ci jakie uzyska si� po zastosowaniu
--wobec tego wyra�enia funkcji Round, Trunc, Ceil oraz Floor.
SELECT SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7)) WYNIK, 
ROUND(SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7))) ROUND,
TRUNC(SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7))) TRUNC,
CEIL(SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7))) CEIL,
FLOOR(SQRT(POWER(11.23,4)+POWER((2399+ SQRT(1234.56)),1/4)+ LOG(LN(12345),7))) FLOOR FROM dual;

--Zad4  Wy�wietl kolejno przedzia� 101 lat i 11 miesi�cy oraz przedzia� 25 dni 3 godziny 5 minut i 36.6
--sekund oraz znacznik czasowy obejmuj�cy ��cznie oba te przedzia�y (Rys. 4).
SELECT INTERVAL '101-11' YEAR(3) TO MONTH "PRZEDZIAL 101 LAT I 11 MINUT",
INTERVAL'25 03:05:36.6' DAY TO SECOND "PRZEDZIAL 25 DNI 3 GODZINY",
TIMESTAMP '101-11-25 03:05:36.6' "OBA PRZEDZIALY" FROM dual;

--Zad5 Wy�wietl informacje o tym jaka data b�dzie za 4321 dni i jaka data by�a 4321 dni temu
--oraz w odr�bnych kolumnach ile pe�nych miesi�cy i ile pe�nych tygodni dzieli obie daty.
SELECT SYSDATE+4321 PRZYSZLOSC, SYSDATE-4321, TRUNC(MONTHS_BETWEEN((SYSDATE+4321),(SYSDATE-4321))) MESIACE,
TRUNC(MONTHS_BETWEEN((SYSDATE+4321),(SYSDATE-4321))/7) TYGODNIE FROM dual;

--Zad6 Wy�wietl dat� i czas jaki by� 1234 dni, 18 godzin i 6 minut temu oraz jaki b�dzie za
--189 lat i 5 miesi�cy (Rys. 6).
SELECT to_char(SYSTIMESTAMP,'YYYY-MM-DD HH:MM:SS') TERAZ, to_char(SYSTIMESTAMP - 
INTERVAL '1234 18:06:00.0' DAY(4) TO SECOND, 'YYYY-MM-DD HH:MM:SS') PRZESZLOSC,
to_char(SYSDATE + INTERVAL '189-05' YEAR(3) TO MONTH, 'YYYY-MM-DD HH:MM:SS') PRZYSZLOSC FROM dual;

--Zad7   Wy�wietl ile czasu up�yn�o od 2013.12.15 21:14:09 do 2021.02.11 7:17. Wynik podaj w dw�ch
--formach/kolumnach jak na Rys. 7.
SELECT TIMESTAMP '2021-02-11 7:17:00' - TIMESTAMP '2013-12-15 21:14:09',
(TIMESTAMP '2021-02-11 7:17:00' - TIMESTAMP '2013-12-15 21:14:09')YEAR to month
FROM dual;

--Zad8 W odr�bnych kolumnach kolejno wy�wietl aktualny rok, miesi�c, dzie� oraz aktualn� godzin�,
--minut� i sekund� (jak na Rys. 8).
SELECT EXTRACT(YEAR FROM SYSDATE)ROK, EXTRACT(MONTH FROM SYSDATE)MIESIAC, EXTRACT(DAY FROM SYSDATE) DIEN,
EXTRACT(HOUR FROM SYSTIMESTAMP)GODZINA , EXTRACT(MINUTE FROM SYSTIMESTAMP)MINUTA,
TRUNC(EXTRACT(SECOND FROM SYSTIMESTAMP)) SEKUNDA FROM dual;

--Zad9  W oparciu o dane zawarte w tabeli Studenci wy�wietl student�w, kt�rzy dzisiaj obchodz� urodziny.
SELECT * FROM studenci where EXTRACT(MONTH FROM data_urodzenia) = EXTRACT(MONTH FROM SYSDATE)
AND EXTRACT(DAY FROM data_urodzenia) = EXTRACT(DAY FROM SYSDATE);

--Zad10 Napisz zapytanie zwracaj�ce informacj� jaka data b�dzie za 123 miesi�ce oraz kt�ry to b�dzie
--tydzie� w roku.
SELECT to_char(add_months(sysdate,123), 'YYYY-MM-DD ww')DATA FROM dual;

--Zad11 Wy�wietl dat� ostatniego dnia aktualnego miesi�ca oraz informacj� jaki to b�dzie dzie� tygodnia
--(s�ownie) np. 21/10/31 niedziela. 
SELECT to_char(LAST_DAY(sysdate), 'YYYY-MM-DD DAY' ) FROM dual;

--Zad12  Zaokr�glij aktualn� dat� kolejno do miesi�cy (funkcj� Round), lat (funkcj� Trunc) i wiek�w.
SELECT to_char(SYSDATE, 'YYYY-MM-DD' ) AKTUALNE, to_char(ROUND(SYSDATE,'MM'), 'YYYY-MM-DD' )MIESIECY,  
to_char(TRUNC(SYSDATE,'YYYY'), 'YYYY-MM-DD' )LAT, to_char(TRUNC(SYSDATE,'CC'), 'YYYY-MM-DD' )WIEKOW 
FROM dual;

--Zad13 . W oparciu o dane zawarte w tabeli Studenci wy�wietl nazwiska i imiona student�w, kt�rych imi�
--rozpoczyna si� na 'M' uporz�dkowanych od najstarszego do najm�odszego z informacj� ile aktualnie
--maj� lat (Rys. 11). Zaproponuj dwa rozwi�zania w zakresie szacowania wieku student�w: pe�ne
--sko�czone lata oraz tzw. metod� �rocznikow��. 
SELECT imiona, nazwisko, data_urodzenia, EXTRACT(YEAR FROM sysdate)- EXTRACT(YEAR FROM data_urodzenia) "METODA ROCZNIKOWA",
TRUNC((MONTHS_BETWEEN(sysdate,data_urodzenia))/12) "PELNE LATA"
FROM studenci where substr(imiona,1,1) = 'M' order by 3;

--Zad14 Dokonaj konwersji aktualnego znacznika czasowego do daty (zastosuj funkcj� Cast; Rys. 12)
SELECT Current_timestamp "aktualny czas"  ,CAST(SYSDATE AS DATE) data FROM dual;

--Zad15 W ramach zapytania dokonaj po��czenia dw�ch �a�cuch�w '987' i '654' oraz wy�wietl wynik
--r�nicy otrzymanej liczby i warto�ci 123456 (zastosuj konwersj� typ�w; Rys. 13). 
SELECT CONCAT('987','654') LANCUCH, TO_NUMBER(CONCAT('987','654'))LICZBA,
TO_NUMBER(CONCAT('987','654'))- 123456 WYNIK FROM dual;

--Zad16 Wy�wietl aktualny wiek cyframi rzymskimi
SELECT to_char(to_char(sysdate,'CC'),'RN')FROM dual;

--Zad17 Wy�wietl aktualn� dat� w postaci np. cz��, jest dzisiaj czwartek, 2 stycze� 2021 roku.
SELECT 'jest dzisiaj '|| to_char(SYSDATE, 'DAY'), to_char(SYSDATE,'DD month YYYY') FROM dual;

--Zad18  Wy�wietl wiek, kwarta�, miesi�c, tydzie� miesi�ca oraz dzie� tygodnia daty podanej w formie
--'27-09-1959' (patrz przyk�ad na Rys. 14).
SELECT 'wiek ' ||  to_char(to_date('27-09-1959','DD-MM-YYYY'),'CC') || ' kwartal ' ||
to_char(to_date('27-09-1959','DD-MM-YYYY'),'Q') || ' miesiac ' ||
to_char(to_date('27-09-1959','DD-MM-YYYY'),'month') || ' tydzien miesica ' ||
to_char(to_date('27-09-1959','DD-MM-YYYY'),'W') || ' dzien tygodnia ' ||
to_char(to_date('27-09-1959','DD-MM-YYYY'),'DAY') FROM dual;

--Zad19 W oparciu o dane zawarte w tabeli Studenci wy�wietl dane studentek (patrz Rys. 15), kt�re urodzi�y
--si� w wakacyjny weekend (w lipcow� lub sierpniow� sobot� lub niedziel�) pod warunkiem,
--�e dzie� miesi�ca nie jest dzielnikiem liczby 5 (np. 6.07.1999 ale 10.08.1999 ju� nie; Rys. 15).
SELECT * FROM studenci where imiona like '%a' AND EXTRACT(month FROM data_urodzenia) IN (7,8)
AND  UPPER(TRIM(to_char(data_urodzenia, 'DAY'))) IN ('SOBOTA','NIEDZIELA')AND 
MOD(EXTRACT(DAY FROM data_urodzenia),5)!=0;

--Zad20 W oparciu o dane zawarte w tabeli Pracownicy wy�wietl aktualnie pracuj�cych pracownik�w,
--porz�dkuj�c ich wed�ug sta�u pracy podanego w pe�nych latach i miesi�cach pracy oraz kolejno�ci
--alfabetycznej nazwisk (Rys. 16).
SELECT NAZWISKO, STANOWISKO, DATA_ZATR, DATA_ZWOL,  TRUNC(TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_ZATR))/12) || ' lat ' || 
MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_ZATR)),12) || ' miesiecy' "pracuje juz" FROM pracownicy 
WHERE data_zwol is NULL order by (TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_ZATR))/12) desc, nazwisko; 

--Zad21 W oparciu o dane zawarte w tabeli Pracownicy wy�wietl list� wynagrodze� pracownik�w
--za miesi�c maj 2018, kt�rzy byli pracownikami przez ca�y ten okres (Rys. 17).
SELECT nazwisko, stanowisko, data_zatr, data_zwol, placa+ NVL(dod_funkcyjny,0)+ placa* NVL(dod_staz,0)*0.01 - NVL(koszt_ubezpieczenia,0) PENSJA
FROM pracownicy WHERE data_zatr <= to_date('01.05.2018', 'dd.mm.yyyy') AND (data_zwol is NULL
OR data_zwol >= to_date('30.05.2018', 'dd.mm.yyyy'));

--Zad22  W oparciu o dane zawarte w tabeli Studenci wy�wietl uporz�kowan� list� student�w
--(od najstarszego do najm�odszego), kt�rzy urodzili si� w pierwsz� sobot� (6-ty dzie� tygodnia)
--danego miesi�ca w okresie od 13.08.1997 do 23.01.2000.
SELECT * FROM studenci WHERE UPPER(TRIM(to_char(data_urodzenia,'DAY'))) LIKE 'SOBOTA' AND 
TRIM(to_char(data_urodzenia,'DD'))<=7 AND data_urodzenia BETWEEN to_date('1997-08-13','yyyy-mm-dd') 
AND to_date('2000-01-23','yyyy-mm-dd') order by data_urodzenia;

--Zad23 W oparciu o dane zawarte w tabeli Studenci wy�wietl personalia student�w (kolumny imiona
--i nazwisko), kt�rych imi� sk�ada si� dok�adnie z 5 liter a nazwisko rozpoczyna od frazy Ko a ko�czy
--fraz� ski (patrz Rys. 18). 
SELECT * FROM studenci WHERE regexp_like(imiona,'[[:alpha:]]{5}') 
AND NOT regexp_like(imiona,'[[:alpha:]]{6}');

SELECT * FROM studenci WHERE regexp_like(imiona,'^([[:alpha:]]{5})$');

SELECT * FROM studenci WHERE regexp_count(imiona,'[[:alpha:]]')=5 
AND regexp_like(UPPER(nazwisko),'^(KO)[[:alpha:]]{0,}(SKI)$');

--Zad24 W oparciu o dane zgromadzone w tabeli Studenci za po�rednictwem wyra�e� regularnych dokonaj
--prezentacji zawarto�ci kolumny adres w �zaszyfrowanej� formie, w kt�rej to ka�dy wyraz
--sk�adaj�cy si� z przynajmniej 3 liter b�dzie zast�piony fraz� Alpha a ka�da cyfra/liczba b�dzie
--zast�piona fraz� Digit (patrz Rys. 19).
SELECT nazwisko, imiona, adres, regexp_replace(regexp_replace(adres,'[[:alpha:]]{3,}','Alpha'), 
'[[:digit:]]','Digit') FROM studenci;

--Zad25 W oparciu o dane zgromadzone w tabeli Studenci wy�wietl adresy (kolumna adres) wskazuj�ce
--na ulice (ul. na pocz�tku adresu), kt�rych nazwa rozpoczyna si� od litery D, O, P lub T,
--a numer domu/budynku to dok�adnie 188 (patrz Rys. 20). 
SELECT * FROM studenci WHERE regexp_like(adres,'^((al)|(ul))\.\s(D|O|P|T)[[:alpha:]]{0,}\s
([[:alpha:]]{1,})\s?188');

