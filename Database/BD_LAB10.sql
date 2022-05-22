--Lista10
--1.Utw�rz tabele tymczasowe przechowuj�ce dane w ramach danej transakcji o nazwach
--Min_Ryby_Wedkarzy i Max_Ryby_Wedkarzy o strukturach jak na Rys. 1. Nast�pnie z uwzgl�dnieniem
--utworzonych tabeli w oparciu o dane zawarte w tabelach Wedkarze, Gatunki i Rejestry (dane dost�pne
--na kontach o nazwach DS i DataSource np. DS.Rejestry) dokonaj kolejno nast�puj�cych operacji:
--a) wprowad� dane najl�ejszych (Min_Ryby_Wedkarzy) i najci�szych (Max_Ryby_Wedkarzy) ryb
--z�owionych przez poszczeg�lnych w�dkarzy w ramach poszczeg�lnych gatunk�w, w zestawieniu
--uwzgl�dnij dokonania ka�dego w�dkarza w ramach wszystkich dost�pnych gatunk�w ryb
--(w przypadku braku po�owu ryby z danego gatunku min i max r�wne 0; patrz Rys .2),
--b) sprawd� zawarto�� tabel (Rys. 2) i zatwierd� transakcj�,
--c) wprowad� dane najkr�tszych (Min_Ryby_Wedkarzy) i najd�u�szych (Max_Ryby_Wedkarzy) ryb
--z�owionych przez poszczeg�lnych w�dkarzy w ramach poszczeg�lnych gatunk�w pod warunkiem,
--�e najkr�tsza d�ugo�� jest mniejsza od 35 (ale wi�ksza od 0) a najd�u�sza d�ugo�� jest wi�ksza od 60
--(warunki nale�y analizowa� osobno tzn. dane mog� zosta� wprowadzone tylko do 1-ej z tabel),
--d) sprawd� zawarto�� tabel (Rys. 3) a nast�pnie usu� obie tabele.
--W ramach rozwi�zania zastosuj wielotabelowy Insert. 

CREATE GLOBAL TEMPORARY TABLE MIN_RYBY_WEDKARZY(
ID_WEDKARZA NUMBER(5),
NAZWISKO VARCHAR(30),
ID_GATUNKU NUMBER(2),
NAZWA VARCHAR(30),
WARTOSC NUMBER(5,2),
KOMENTARZ VARCHAR(30)
) 
ON COMMIT DELETE ROWS;

CREATE GLOBAL TEMPORARY TABLE MAX_RYBY_WEDKARZY(
ID_WEDKARZA NUMBER(5),
NAZWISKO VARCHAR(30),
ID_GATUNKU NUMBER(2),
NAZWA VARCHAR(30),
WARTOSC NUMBER(5,2),
KOMENTARZ VARCHAR(30)
) 
ON COMMIT DELETE ROWS;

SELECT * FROM REJESTRY;

SELECT ID_WEDKARZA,NAZWISKO,ID_GATUNKU,NAZWA,
(SELECT NVL(MIN(WAGA),0) FROM REJESTRY WHERE ID_WEDKARZA=WE.ID_WEDKARZA
AND ID_GATUNKU=ga.id_gatunku) NAJLZEJSZA,
(SELECT NVL(MAX(WAGA),0) FROM REJESTRY WHERE ID_WEDKARZA=WE.ID_WEDKARZA
AND ID_GATUNKU=ga.id_gatunku) NAJCIEZSZA
FROM WEDKARZE WE CROSS JOIN GATUNKI GA;

INSERT ALL 
INTO min_ryby_wedkarzy VALUES (ID_WEDKARZA,NAZWISKO,ID_GATUNKU,NAZWA,
NAJLZEJSZA,'NAJLZEJSZA')
INTO MAX_ryby_wedkarzy VALUES (ID_WEDKARZA,NAZWISKO,ID_GATUNKU,NAZWA,
NAJCIEZSZA,'NAJCIEZSZA')
SELECT ID_WEDKARZA,NAZWISKO,ID_GATUNKU,NAZWA,
(SELECT NVL(MIN(WAGA),0) FROM REJESTRY WHERE ID_WEDKARZA=WE.ID_WEDKARZA
AND ID_GATUNKU=ga.id_gatunku) NAJLZEJSZA,
(SELECT NVL(MAX(WAGA),0) FROM REJESTRY WHERE ID_WEDKARZA=WE.ID_WEDKARZA
AND ID_GATUNKU=ga.id_gatunku) NAJCIEZSZA
FROM WEDKARZE WE CROSS JOIN GATUNKI GA;

SELECT * FROM mAX_ryby_wedkarzy;
COMMIT;


--- w uj�ciu wagowym

SELECT ID_WEDKARZA,NAZWISKO,ID_GATUNKU,NAZWA,
(SELECT NVL(MIN(WAGA),0) FROM REJESTRY WHERE ID_WEDKARZA=WE.ID_WEDKARZA
AND ID_GATUNKU=ga.id_gatunku) NAJLZEJSZA,
(SELECT NVL(MAX(WAGA),0) FROM REJESTRY WHERE ID_WEDKARZA=WE.ID_WEDKARZA
AND ID_GATUNKU=ga.id_gatunku) NAJCIEZSZA
FROM WEDKARZE WE CROSS JOIN GATUNKI GA;

INSERT ALL 
WHEN NAJLZEJSZA>0 AND NAJLZEJSZA<1 THEN INTO min_ryby_wedkarzy VALUES (ID_WEDKARZA,NAZWISKO,ID_GATUNKU,NAZWA,
NAJLZEJSZA,'NAJLZEJSZA')
WHEN  NAJCIEZSZA>=4 THEN
INTO MAX_ryby_wedkarzy VALUES (ID_WEDKARZA,NAZWISKO,ID_GATUNKU,NAZWA,
NAJCIEZSZA,'NAJCIEZSZA')
SELECT ID_WEDKARZA,NAZWISKO,ID_GATUNKU,NAZWA,
(SELECT NVL(MIN(WAGA),0) FROM REJESTRY WHERE ID_WEDKARZA=WE.ID_WEDKARZA
AND ID_GATUNKU=ga.id_gatunku) NAJLZEJSZA,
(SELECT NVL(MAX(WAGA),0) FROM REJESTRY WHERE ID_WEDKARZA=WE.ID_WEDKARZA
AND ID_GATUNKU=ga.id_gatunku) NAJCIEZSZA
FROM WEDKARZE WE CROSS JOIN GATUNKI GA;

SELECT * FROM min_ryby_wedkarzy;

DROP TABLE  min_ryby_wedkarzy CASCADE CONSTRAINTS;

DROP TABLE  mAX_ryby_wedkarzy CASCADE CONSTRAINTS;
--2.Utw�rz tabele Najnizsze_Srednie i Najwyzsze_Srednie o strukturach jak na Rys. 4. Nast�pnie w oparciu
--o zawarto�� tabeli Studenci wprowad� do nich stosowane dane czyli dane o kolejno najgorszych
--i najlepszych �rednich uzyskanych przez poszczeg�lnych student�w w ramach danych kierunk�w,
--tryb�w i stopni studi�w (dane pobrane z konta o nazwie DataSource). W ramach rozwi�zania zastosuj
--wielotabelowy Insert. Na koniec usu� utworzone tabele. 
select * from studenci;
drop table najnizsze_srednie;

create global temporary table Najnizsze_srednie
(kierunek varchar(150),
tryb varchar(30),
stopien number(1),
nr_indeksu number(6),
srednia number(3,2)
) on commit delete rows;


create global temporary table Najwyzsze_srednie
(kierunek varchar(150),
tryb varchar(30),
stopien number(1),
nr_indeksu number(6),
srednia number(3,2)
) on commit delete rows;

select * from (
select kierunek, tryb, stopien, min(srednia) 
min_srednia, max(srednia)max_srednia from studenci 
group by kierunek, tryb, stopien) t join studenci st 
using(kierunek, tryb, stopien);

insert all
when srednia= min_srednia then into najnizsze_srednie 
values (kierunek, tryb, stopien, nr_indeksu, srednia)
when srednia= max_srednia then into najwyzsze_srednie 
values (kierunek, tryb, stopien, nr_indeksu, srednia)
select * from (
select kierunek, tryb, stopien, min(srednia) 
min_srednia, max(srednia)max_srednia from studenci 
group by kierunek, tryb, stopien) t join studenci st 
using(kierunek, tryb, stopien);

select * from najnizsze_srednie;

commit;
drop table najnizsze_srednie;
drop table najwyzsze_srednie;

--3.Utw�rz tabel� Zak (�ak; Rys. 6) sk�adaj�ca si� z nast�puj�cych p�l:
--? id_studenta (N6) � klucz g��wny,
--? nazwisko (V20) � nie mo�e by� puste,
--? imie (V15) � nie mo�e by� puste,
--? pseudonim (V30) � nie mo�e by� puste,
--? kierunek (V20) � domy�lnie INFORMATYKA,
--? stopien (N1) � mo�e przyjmowa� warto�� 1, 2 lub 3,
--? semestr (N1) � mo�e przyjmowa� warto�ci od 1 do 8. 
--W dalszej kolejno�ci utw�rz sekwencje Zak_id_seq zaczynaj�c� si� od warto�ci 99 985 przyjmuj�c�
--najni�sz� warto�� r�wn� 10000 ze zdefiniowan� maksymaln� warto�ci� 99999 i krokiem r�wnym 10 oraz
--z aktywowanym cyklem. Nast�pnie wstaw przynajmniej 4 rekordy ustalaj�c warto�� kolumny id_studenta
--za po�rednictwem sekwencji Zak_id_seq (skorzystaj z danych znajduj�cych si� w pliku
--BD_Lab10_Dane.txt).

create table zak(
id_studenta number(6) primary key,
nazwisko varchar(20) not null,
imie varchar(15) not null,
pseudonim varchar(30) not null,
kierunek varchar(20) default 'INFORMATYKA',
stopien number(1) check(stopien in (1,2,3)),
semestr number(1)check(semestr between 1 and 8)
);

create SEQUENCE zak_id_seq
start with 99985 
minvalue 10000
maxvalue 99999
increment by 10 
cycle ;


insert into zak values(Zak_id_seq.nextval, 'KOWALSKI', 'ROMAN', 'KOWAL',  'INFORMATYKA', 1, 2);
insert into zak values(Zak_id_seq.nextval, 'NOWAK', 'ANNA', 'NOWA', 'INFORMATYKA',  1, 3);
insert into zak values(Zak_id_seq.nextval, 'PIECH', 'EWA', 'PEWA',  'MECHANIKA', 1, 2);
insert into zak values(Zak_id_seq.nextval, 'POLAK', 'IZABELA', 'IZA',  'MECHANIKA', 2, 4);
select * from zak;
select zak_id_seq.currval from dual;
--4.Dokonaj modyfikacji sekwencji Zak_id_seq tak aby kolejna warto�� zawsze by�a zwi�ksza o 5.
--Nast�pnie do tabeli Zak wstaw kolejne 2 rekordy (z pliku BD_Lab10_Dane.txt).
alter sequence Zak_id_seq increment by 5;
insert into zak values(Zak_id_seq.nextval, 'WAWRZYNIEC', 'DAMIAN','WAWRZYN',  'INFORMATYKA',  2, 3);
insert into zak values(Zak_id_seq.nextval, 'KOSSAK', 'KATARZYNA', 'KOSA', 'INFORMATYKA',  1, 2);

--5.W ramach tabeli Zak utw�rz trzy indeksy. Pierwszy na polu kierunek, drugi na polach stopien
--i semestr oraz trzeci unikalny na polu pseudonim. Dokonaj pr�by dopisanie danych nowego studenta (�aka)
--podaj�c jako pseudonim ju� wcze�niej wykorzystan� fraz�. Przy ewentualnym niepowodzeniu usu�
--stosowne ograniczenie a nast�pnie pon�w pr�b� wprowadzenia danych oraz dokonaj pr�by ponownego
--utworzenia usuni�tego ograniczenia. Na koniec usu� wszystkie utworzone indeksy oraz tabel� Zak.
create index imd_kier on zak(kierunek);
create index imd_stop on zak(stopien, semestr);
create unique index imd_pseud on zak(pseudonim);

insert into zak values((select max(id_studenta) from zak)+1, 'WAWRZYNIEC', 'JAN','WAWRZYN2',  'MATEMATYKA',  1, 2);
insert into zak values((select max(id_studenta) from zak)+1, 'WAWRZYNIEC', 'ADAM','WAWRZYNb2',  'MATEMATYKA',  1, 2);

drop index imd_kier;
drop table zak cascade constraints;

--6.. W oparciu o dane znajduj�ce si� w tabeli Studenci utw�rz tabel� StudenciBis (dane dost�pne na kontach
--o nazwach DS i DataSource). Nast�pnie w oparciu o powy�sz� tabel� (StudenciBis) utw�rz perspektywy
--Studentki i Zacy (studenci panowie). Perspektywa Zacy powinna uwzgl�dnia� opcj� tylko do odczytu.
--Zadbaj, aby dane prezentowane w ramach obu perspektyw by�y uporz�dkowane alfabetycznie kolejno
--wed�ug nazwisk i imion. Sprawd� zawarto�� utworzonych perspektyw.
--Sprawd� czy mo�liwe jest dopisywanie rekord�w to perspektyw Studentki i Zacy
--(z pliku BD_Lab10_Dane.txt). Sprawd� zawarto�� powy�szych perspektyw oraz tabeli StudenciBis
--(w szczeg�lno�ci nazwiska rozpoczynaj�ce si� od frazy Test).

create table studencibis as select * from studenci;
select * from studencibis;

create or replace view studentki as 
select * from studencibis where imiona like '%a'order by nazwisko, imiona;

select * from studentki;

create or replace view zacy as select * from studencibis where imiona not like '%a'
order by nazwisko, imiona with read only;

insert into Zacy values(123456, 'Testowski', 'Test', to_date('01-01-1995', 'dd-mm-yyyy'), 'adres', 'kierunek', 'tryb', 1, 1, 'specjalnosc', 1, 4);
insert into Studentki values(123456, 'Testowski', 'Test', to_date('01-01-1995', 'dd-mm-yyyy'), 'adres', 'kierunek', 'tryb', 1, 1, 'specjalnosc', 1, 4);
insert into Studentki values(123456, 'Testowski', 'Testa', to_date('01-01-1995', 'dd-mm-yyyy'), 'adres', 'kierunek', 'tryb', 1, 1, 'specjalnosc', 1, 4);

select * from studentki where nazwisko like 'Test%';
select * from zacy where nazwisko like 'Test%';
select * from studencibis where nazwisko like 'Test%';

--7.Na podstawie danych zawartych w perpektywie Zacy utw�rz perspektyw� o nazwie S1R1 z opcja WITH
--CHECK OPTION przechowuj�c� dane wszystkich student�w studiuj�cych na pierwszym roku studi�w
--pierwszego stopnia. Perspektywa S1R1 powinna zawiera� nast�puj�ce kolumny: nr_indeksu, nazwisko,
--imiona, rok i pseudonim (inicja�y+nr_indeksu np. PK123456; patrz Rys. 8).
--Podejmij pr�b� wprowadzenia danych do perspektywy S1R1. Usu� perspektywy S1R1, Zacy, Studentki
--oraz tabel� StudenciBis

create or replace view S1R1 as select nr_indeksu,nazwisko,imiona,rok,stopien,
substr(imiona,1,1)||substr(nazwisko,1,1)||nr_indeksu pseudonim from zacy 
where stopien=1 and rok=1 with check option;
select * from S1R1;

insert into S1R1 values(12345, 'RAKOWSKI', 'TOMASZ', 1,1, 'TR12345');
drop table studencibis;
drop view S1R1;
drop view studentki;
drop view zacy;

--8. W oparciu o dane znajduj�ce si� w tabeli Pracownicy utw�rz tabel� PracownicyBis (dane dost�pne
--na kontach o nazwach DS i DataSource). Nast�pnie w oparciu o dane zawarte w tabeli PracownicyBis
--utw�rz perspektyw� Lista_plac z opcja WITH CHECK OPTION o nast�puj�cych kolumnach:
--? nr_akt,
--? nazwisko,
--? id_dzialu,
--? stanowisko,
--? pensja (p�aca+dodatek_funkcyjny+staz-koszty_ubezpiecznia).
--Perspektywa powinna zawiera� dane aktualnych pracownik�w (w kolejno�ci alfabetycznej) pracuj�cych
--w ramach kolejnych dzia��w (uporz�dkowana kolejno wg dzia�u i nazwiska) o numerze akt nie ni�szym ni�
--1000.
--Podejmij pr�b� wprowadzenia danych (z pliku). W ramach perspektywy Lista_Plac podejmij pr�b� zmiany
--nazwiska pracownika o numerze akt 1234 na Adamski. Sprawd� zawarto�� powy�szej perspektywy
--oraz tabeli PracownicyBis. Usu� perspektyw� Lista_Plac
create table pracownicybis as select * from pracownicy;

create or replace view lista_plac as 
select nr_akt, nazwisko, id_dzialu,
stanowisko, placa + placa * dod_staz * 1/100 + nvl(dod_funkcyjny, 0)
- nvl(koszt_ubezpieczenia, 0) pensja from pracownicybis 
where nr_akt >= 1000 and (data_zwol is null or data_zwol >= sysdate)
order by id_dzialu, nazwisko with check option;

select * from lista_plac;
INSERT INTO Lista_Plac VALUES(1222, 'TESTOWSKI', 10, 'INFORMATYK', 5000);

SELECT * FROM Lista_plac; 
select * from pracownicybis;


drop view lista_plac;
--9.Na podstawie danych zawartych w tabeli PracownicyBis utw�rz perspektyw� Szefowie zawieraj�c�
--nast�puj�ce kolumny:
--? nr_akt,
--? nazwisko,
--? liczba_podwladnych,
--? data_zatr,
--? placa,
--? id_dzialu.
--W ramach perspektywy maj� zosta� uwzgl�dnione dane wy��cznie aktualnych pracownik�w oraz maj�
--znajdowa� si� w niej dane wszystkich pracownik�w, kt�rzy maj� podw�adnych (ich numer akt widnieje
--przynajmniej raz w kolumnie przelozony). 
--Podejmij pr�b� wprowadzenia danych do perspektywy Szefowie. Usu� powy�sz� perspektyw� oraz tabel�
--PracownicyBis.
create or replace view szefowie as
select nr_akt, nazwisko, liczba liczba_podwladnych, data_zatr, 
placa, id_dzialu from
(select przelozony, count(*) liczba from pracownicybis p1 
where data_zwol is null or data_zwol>=sysdate
group by przelozony) s1 join pracownicybis p2 on (p2.nr_akt=s1.przelozony)
where p2.data_zwol is null or p2.data_zwol>=sysdate;

delete from szefowie where nr_akt<=2000;
select * from szefowie;

INSERT INTO Szefowie VALUES(9999, 'TESTOWSKI', 0, sysdate, 5000,  10);

drop table pracownicybis;
drop view szefowie;

