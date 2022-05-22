--Lista9
--1. Utwórz tabelê Produkty posiadaj¹c¹ nastêpuj¹ce kolumny:
--? id_produktu – 4 cyfrowa wartoœæ unikatowa (UNIQUE),
--? nazwa – do 40-tu znaków; zawsze musi byæ okreœlona,
--? stan – liczba 6-cio cyfrowa liczba z dwoma cyframi po przecinku; wartoœæ domyœlna 0,
--? cena – 6-cio cyfrowa liczba z dwoma cyframi po przecinku; wartoœæ domyœlna 1.23,
--? wartosc – kolumna wirtualna przechowuj¹ca wynik iloczynu stan*cena.
Create table Produkty
(id_produktu NUMBER(4) constraint Produkty_id_produktu_UN Unique,
nazwa VARCHAR(40) constraint Produkty_nazwa_NN not null,
stan NUMBER(6,2) DEFAULT 0,
cena NUMBER(6,2) DEFAULT 1.23,
wartosc as (stan*cena)
);
--2.Utwórz tabelê Kasjerzy posiadaj¹c¹ nastêpuj¹ce kolumny:
--? id_kasjera – 5 cyfrowy klucz g³ówny,
--? nazwisko – kolumna przechowuj¹ca do 20-tu znaków,
--? data_zatrudnienia – data, która nie mo¿e byæ niezdefiniowana,
--? placa – 7-cio cyfrowa liczba z dwoma cyframi po przecinku
Create table Kasjerzy(
id_kasjera number(5) constraint Kasjerzy_id_kasjera_PK Primary Key,
nazwisko varchar(20),
data_zatrudnienia date constraint Kasjerzt_data_zatrudnienia_NN not null,
placa number(7,2) );

--3.Utwórz tabelê Transakcje posiadaj¹c¹ nastêpuj¹ce kolumny:
--? id_transakcji – 8-mio cyfrowy klucz g³ówny,
--? id_produktu – 4-ro cyfrowy klucz obcy wskazuj¹cy na tabele Produkty i pole id_produktu; kolumna
--nie mo¿e przechowywaæ wartoœci pustych,
--? id_sprzedawcy – 5-cio cyfrowy klucz obcy wskazuj¹cy na tabele Kasjerzy i pole id_kasjera;
--kolumna nie mo¿e przechowywaæ wartoœci pustych,
--? miara (iloœæ/liczba) – liczba 6-cio cyfrowa liczba z dwoma cyframi po przecinku; wartoœæ domyœlna
--to 1,
--? czas_transakcji – kolumna przechowuj¹ca czas transakcji z dok³adnoœci¹ do u³amkowych czêœci
--sekundy (timestamp).
create table transakcje(
id_transakcji number(8) constraint id_transakcji_pk primary key,
id_produktu number(4)constraint id_produktu_nn not null,
id_sprzedawcy number(5) constraint id_sprzedawcy_nn not null,
miara number(6,2) default 1,
czas_transakcji timestamp,
constraint id_produktu_fk foreign key (id_produktu) references produkty(id_produktu),
constraint id_sprzedawcy_fk foreign key (id_sprzedawcy)references kasjerzy(id_kasjera));

--4.Dokonaj nastêpuj¹cych zmian w powy¿szych tabelach
--a) zdefiniuj wartoœæ domyœln¹ atrybutu placa z tabeli Kasjerzy na 3200,
Alter table kasjerzy modify(placa default 3200 );
--b) zdefiniuj wartoœæ domyœln¹ atrybutu czas_transakcji z tabeli Transakcje na aktualny czas,
ALter table transakcje modify( czas_transakcji default systimestamp );
--c) dodaj ograniczenie dla kolumny id_kasjera z tabeli Kasjerzy, w ramach którego kolumna ta bêdzie
--mog³a przyjmowaæ wartoœci nie mniejsze ni¿ 100,
Alter table kasjerzy add constraint kasjerzy_id_kasjera_ch check(id_kasjera>=100); 
--d) zmieñ ograniczenie na³o¿one na kolumnê id_produktu z tabeli Produkty na klucz g³ówny oraz rozszerz
--„powi¹zanie” z tabel¹ Transakcje o dzia³anie ON DELETE CASCADE,
Alter table transakcje drop constraint id_produktu_fk;
Alter table produkty drop constraint produkty_id_klienta_UN;
Alter table produkty add constraint produkty_id_produktu_PK primary key (id_produktu);
Alter table transakcje add constraint id_produktu_fk foreign key (id_produktu) 
REFERENCES produkty(id_produktu) ON delete cascade;
--e) rozszerz zakres „powi¹zania” tabel Transakcje i Kasjerzy o dzia³anie ON DELETE SET NULL
--(uwzglêdnij ograniczenie z zdania nr 3 – zaproponuj logiczne rozwi¹zanie),
alter table transakcje drop constraint id_sprzedawcy_NN;
alter table transakcje drop constraint id_sprzedawcy_fk;
alter table transakcje add constraint id_sprzedawcy_fk FOREIGN key (id_sprzedawcy)
references kasjerzy(id_kasjera) on delete set null;
--f) dokonaj zmiany nazwy kolumny placa z tabeli Kasjerzy na pensja,
alter table  kasjerzy rename column placa to pensja;
--g) do tabeli Kasjerzy dodaj kolumnê data_urodzenia (D) przyjmuj¹c¹ daty od 01.01.1960
--oraz kolumnê data_zwolnienia (D) przyjmuj¹c¹ pust¹ wartoœæ domyœln¹,
ALTER TABLE kasjerzy ADD(data_urodzenia date CONSTRAINT ur_ch 
CHECK(data_urodzenia>=to_date('01-01-1960','DD-MM-YYYY')),
data_zwolnienia date DEFAULT NULL);

--h) do tabeli Kasjerzy dodaj ograniczenie, w ramach którego niemo¿liwe bêdzie podanie daty zwolnienia
--wczeœniejszej ni¿ data urodzenia lub data zatrudnienia,
alter table kasjerzy add constraint kasjerzy_data_zwolnienia_ch check (nvl(data_zwolnienia,data_urodzenia+1)
>data_urodzenia and nvl(data_zwolnienia,data_zatrudnienia+1)> data_zatrudnienia);

--i) ustal precyzjê przechowywanych liczb w ramach kolumny wirtualnej wartosc do 2-óch po przecinku
--(maksymaln¹ liczbê miejsc przed przecinkiem ustal na podstawie kolumn cena i stan) .
alter table Produkty MODIFY (wartosc NUMBER(10,2));
--WprowadŸ dane do powy¿szych tabel (dane z pliku BD_Lab9_dane.txt) oraz zatwierdŸ zrealizowane
--operacje. 
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(1, 'cukier', 100, 2.95);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(2, 'chleb', 50, 3.7);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(3, 'jogurt', 20, 1.15);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(4, 'schab', 6.5, 15.2);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(5, 'piwo', 200, 3.1);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(6, 'cukierki', 10, 23);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(7, 'kurczak', 10, 12.35);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(8, 'banan', 6.5, 5.20);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(9, 'mydlo', 40, 2.5);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(10, 'pomidory', 8.5, 8.5);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(11, 'olej', 20, 6.95);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(12, 'kisiel', 150, 1.15);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(13, 'ciastka', 25, 4.80);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(14, 'plyn do naczyn', 15, 8.20);
INSERT INTO Produkty (id_produktu, nazwa, stan, cena) VALUES(15, 'pieprz', 30, 3.15);


INSERT INTO Kasjerzy (id_kasjera, nazwisko, data_zatrudnienia, data_urodzenia) VALUES
(100, 'Kowalski', To_date('01-01-2010', 'DD-MM-YYYY'), To_date('11-03-1990', 'DD-MM-YYYY'));
INSERT INTO Kasjerzy (id_kasjera, nazwisko, data_zatrudnienia, data_urodzenia) VALUES
(101, 'Nowak', To_date('01-03-2012', 'DD-MM-YYYY'), To_date('21-10-1992', 'DD-MM-YYYY'));
INSERT INTO Kasjerzy (id_kasjera, nazwisko, data_zatrudnienia, data_urodzenia) VALUES
(102, 'Polak', To_date('01-10-2013', 'DD-MM-YYYY'), To_date('18-09-1983', 'DD-MM-YYYY'));
INSERT INTO Kasjerzy (id_kasjera, nazwisko, data_zatrudnienia, data_urodzenia) VALUES
(103, 'Zalas', To_date('01-01-2019', 'DD-MM-YYYY'), To_date('14-12-1985', 'DD-MM-YYYY'));
INSERT INTO Kasjerzy (id_kasjera, nazwisko, data_zatrudnienia, data_urodzenia) VALUES
(104, 'Pogonowska', To_date('01-11-2018', 'DD-MM-YYYY'), To_date('28-03-1993', 'DD-MM-YYYY'));

INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (1, 1, 100, 2);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (2, 1, 101, 1);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (3, 2, 100, 1);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (4, 3, 102, 5);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (5, 4, 100, 1.35);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (6, 5, 101, 4);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (7, 6, 100, 0.45);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (8, 7, 102, 1.84);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (9, 4, 101, 1.05);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (10, 6, 102, 1.55);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (11, 6, 102, 0.8);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (12, 7, 102, 2.5);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (13, 7, 103, 1.95);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (14, 11, 100, 2);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (15, 11, 104, 1);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (16, 12, 102, 8);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (17, 12, 103, 4);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (18, 12, 104, 5);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (19, 12, 103, 11);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (20, 13, 104, 2);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (21, 14, 102, 1);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (22, 14, 101, 2);

commit;

--5.Do tabeli Transakcje dodaj now¹ kolumnê rachunek (8-mio cyfrowa liczba z dwoma cyframi po przecinku)
--a nastêpnie dokonaj aktualizacji danych w zakresie tej kolumny (rachunek=cena * miara; patrz Rys. 2)
--oraz zwi¹zanej z powy¿sz¹ operacj¹ kolumny stan z tabeli Produkty (patrz Rys. 3; stan minus ³¹czna miara
--danego produktu sprzedana w ramach przeprowadzonych transakcji).
alter table transakcje add rachunek number(8,2);

update produkty pr set stan=stan-(select sum(miara) from transakcje where
id_produktu=pr.id_produktu and rachunek is null)
where EXISTS (select * from transakcje where
id_produktu=pr.id_produktu and rachunek is null);

update transakcje tr set rachunek = miara*(select cena from produkty where
id_produktu=tr.id_produktu) where rachunek is null;
commit;
--6.Deaktywuj odpowiednie ograniczenia w celu umo¿liwienia dokonania wpisu danych kasjerki o nazwisku
--Malinowska o id_kasjera = 10 urodzonej w dniu 13.05.1958 (patrz 4.c i 4.g; dane w pliku
--BD_Lab9_dane.txt). Po tej operacji dokonaj próby ponownego aktywowania deaktywowanych ograniczeñ.
--W przypadku niepowodzenia dokonaj:
--? w ramach nowego rekordu zmiany wartoœci id_kasjera na pierwszy wolny numer spe³niaj¹cych
--zdefiniowane ograniczenie (min. 100),
--? aktywacji obu ograniczeñ, w tym ograniczenia dotycz¹cego daty urodzin w trybie, w którym to warunki
--tego ograniczenia bêd¹ dotyczyæ tylko nowy danych.
alter table kasjerzy disable constraint  kasjerzy_id_kasjera_ch;
alter table kasjerzy disable constraint  ur_ch;

INSERT INTO Kasjerzy (id_kasjera, nazwisko, data_zatrudnienia, data_urodzenia)
VALUES (10, 'Malinowska', sysdate, To_date('13-05-1958', 'DD-MM-YYYY'));

alter table Kasjerzy enable constraint kasjerzy_id_kasjera_ch;
alter table Kasjerzy enable constraint ur_ch;

--***********************************************************************************
update Kasjerzy set id_kasjera = 
decode((select max(id_kasjera)+1 from Kasjerzy), 11, 100,
(select max(id_kasjera)+1 from Kasjerzy)) where id_kasjera = 10; 
--lub
UPDATE Kasjerzy
SET id_kasjera = CASE
                 WHEN (SELECT max(id_kasjera) + 1 FROM kasjerzy) < 100 THEN 100
                 ELSE (SELECT max(id_kasjera) + 1 FROM kasjerzy) END
WHERE id_kasjera = 10;
--***********************************************************************************

alter table Kasjerzy enable constraint kasjerzy_id_kasjera_ch;
alter table Kasjerzy enable novalidate constraint ur_ch;

--7.Utwórz tabelê Raport przechowuj¹c¹ informacjê o dokonanych transakcjach sprzeda¿y danego produktu
--przez danego sprzedawcê (liczba_transakcji, lacznie_kg_szt, rachunek). Wœród danych maj¹ równie¿
--znajdowaæ siê dane dotycz¹ce produktów, które znajduj¹ siê w tabeli Produkty ale jak dot¹d nie by³y
--przedmiotem ¿adnej transakcji oraz sprzedawcy (Kasjerzy), którzy nie dokonali ¿adnej transakcji
--(nie sprzedali ¿adnego produktu). Tabela Raport powinna powstaæ na podstawie danych zwróconych przez
--zapytanie Select (struktura tabeli jak na Rys. 4, zamiast wartoœci pustych wstaw frazê brak lub wartoœæ 0,
--adekwatnie do typu kolumny; powy¿sza uwaga nie dotyczy kolumn id_produktu i id_kasjera).
--Po utworzeniu tabeli zdefiniuj „tymczasowy” klucz g³ówny oparty o kolumny produkt i kasjer.
create table raport as(
select nazwa produkt, pr.id_produktu, nazwisko kasjer,id_kasjera,
count(id_transakcji) liczba_transakcji, sum(nvl(miara,0)) lacznie_kg_szt,
sum(nvl(rachunek,0)) rachunek from transakcje tr 
right join produkty pr on (pr.id_produktu = tr.id_produktu)
full join kasjerzy ka on (tr.id_sprzedawcy=ka.id_kasjera)
group by nazwa, pr.id_produktu, nazwisko, id_kasjera);
select * from raport;

--8. Dopisz dane nowych transakcji (dane z pliku BD_Lab9_dane.txt), dokonaj aktualizacji kolumny stan
--w tabeli Produkty oraz kolumny rachunek z tabeli Transakcje (z zad. 5).
--Ponadto dokonaj stosownych aktualizacji danych w tabeli Raport. Zaproponuj rozwi¹zanie problemu braku
--spójnoœci danych jaki powsta³ w momencie gdy kasjerka Malinowska sprzeda³a produkty plyn do naczyn
--(id_produktu = 14) oraz pieprz (id_produktu = 15).

INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (23, 14, 105, 1);
INSERT INTO Transakcje (id_transakcji, id_produktu, id_sprzedawcy, miara) VALUES (24, 15, 105, 2);

--9.Z tabeli Kasjerzy usuñ wpis dotycz¹cy kasjera, który dokona³ najwiêcej operacji sprzeda¿y (najwiêksza
--liczba przeprowadzonych transakcji). W przypadku gdy kryterium spe³nia wiêksza liczba kasjerów
--procesowi usuniêcia poddane zostan¹ dane zwi¹zane tylko z jednym z nich).
delete from kasjerzy where id_kasjera=
(select id_sprzedawcy from 
(select id_sprzedawcy, count(id_transakcji) liczba from transakcje group by 
id_sprzedawcy)t1 join
(select max(count(id_transakcji)) max_liczba from transakcje 
group by id_sprzedawcy)t2 on(liczba=max_liczba)where rownum=1);

--10.Z tabeli Produkty usuñ produkty, których cena jednostkowa nie jest wiêksza ni¿ 5 i by³y przedmiotem
--co najwy¿ej 1 transakcji.
delete from produkty pr where cena<=5 and (1=(select count(*) from transakcje 
where id_produktu=pr.id_produktu) or not exists(select * from transakcje 
where id_produktu=pr.id_produktu));

--11.Usuñ tabele Produkty, Kasjerzy, Transakcje, Raport oraz zwi¹zane z nimi elementy.
drop table transakcje CASCADE CONSTRAINTS;
drop table produkty CASCADE CONSTRAINTS;
drop table kasjerzy CASCADE CONSTRAINTS;
