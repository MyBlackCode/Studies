--Lista 8 
--Zad1
--a). Utwórz tabelê Zawodnicy sk³adaj¹c¹ siê z nastêpuj¹cych pól:
--? id_zawodnika (N – NUMBER),
--? nazwisko (V – VARCHAR lub VARCHAR2),
--? imie (V),
--? data_ur (D – DATE),
--? wzrost (N),
--? waga (N),
--? pozycja (V),
--? klub (V),
--? liczba_minut(N),
--? placa (N).
--oraz zdefiniuj nastêpuj¹ce ograniczenia:
--? id _zawodnika : klucz g³ówny,
--? nazwisko, imie: nie mog¹ byæ puste,
--? data_ur, wzrost, waga: zastosuj logiczne ograniczenia,
--? pozycja: mo¿e przyjmowaæ tylko nastêpuj¹ce frazy: bramkarz, obronca, pomocnik, napastnik,
--? klub: wartoœæ domyœlna to wolny zawodnik,
--? liczba_minut: wartoœæ domyœlna równa 0.
 --a przy ustalaniu w³aœciwoœci atrybutów tabeli (np. rozmiar) uwzglêdnij dane zawarte w Tabeli 1
CREATE TABLE Zawodnicy
(Id_zawodnika NUMBER(4) constraint Zawodnicy_PK primary key,
 Nazwisko VARCHAR(30) constraint Zawodnicy_nazwisko_nn not null,
 Imie Varchar(30) constraint Zawodnicy_imie_nn not null,
 Data_ur Date constraint Zawodnicy_data_ur_ch check(Data_ur > to_date('01.01.60','DD.MM.YYYY')),
 Wzrost Number(5,2) constraint Zawodnicy_wzrost_ch check( Wzrost BETWEEN 160 AND 230),
 Waga Number(5,2) constraint Zawodnicy_waga_ch check (Waga BETWEEN 60 AND 120),
 Pozycja Varchar(20) constraint Zawodnicy_pozycja_ch check(pozycja IN('bramkarz', 'obronca', 'pomocnik', 'napastnik')),
 KLUB  Varchar(40) Default 'wolny zawodnik',
 Liczba_minut NUMBER(4) default 0,
 placa Number(10,2)
);

--b)Nastêpnie do tabeli Zawodnicy wpisz dane zawodników na podstawie danych zamieszczonych w Tabeli 1
--a nastêpnie zatwierdŸ dotychczasowe operacje. W celu usprawnienia tego procesu zdefiniuj stosown¹
--sk³adniê dla zawodników o id_zawodnika wynosz¹cym 1001 i 1007, a dane pozosta³y zawodników
--wprowadŸ z pliku BD_Lab8_Dane.txt.

select * from user_constraints;
INSERT INTO zawodnicy VALUES(1001,'Nowak','Piotr',to_date('10.01.1990','dd.mm.yyyy')
,192, 81.5, 'bramkarz','Warta Czestachowa',360,4000);
INSERT INTO zawodnicy(id_zawodnika,nazwisko, imie, data_ur, wzrost, waga, pozycja)
VALUES(1007,'Oleksy','Robert', to_date('12.08.1996','dd.mm.yyyy'),185,85,'obronca' );

INSERT INTO Zawodnicy VALUES (1002, 'Kowalski', 'Adam', To_date('15-04-1992', 'DD-MM-YYYY'), 194, 83, 'bramkarz', 'Odra Wroclaw', 270, 3500);
INSERT INTO Zawodnicy VALUES (1003, 'Polak', 'Dariusz', To_date('11-06-1998', 'DD-MM-YYYY'), 189, 79.5, 'bramkarz', 'Wisla Warszawa', 450, 5000);

INSERT INTO Zawodnicy VALUES (1004, 'Malinowski', 'Adrian', To_date('21-11-1987', 'DD-MM-YYYY'), 190, 85, 'obronca', 'Warta Czestochowa', 300, 3000);
INSERT INTO Zawodnicy VALUES (1005, 'Czech', 'Piotr', To_date('04-12-1989', 'DD-MM-YYYY'), 187, 83, 'obronca', 'Odra Wroclaw', 200, 2600);
INSERT INTO Zawodnicy VALUES (1006, 'Podolski', 'Krystian', To_date('26-02-1997', 'DD-MM-YYYY'), 186, 89, 'obronca', 'Wisla Warszawa', 350, 3500);

INSERT INTO Zawodnicy VALUES (1008, 'Grzyb', 'Krzysztof', To_date('17-09-1995', 'DD-MM-YYYY'), 173, 75, 'pomocnik', 'Warta Czestochowa', 400, 3200);
INSERT INTO Zawodnicy VALUES (1009, 'Kwasek', 'Artur', To_date('30-10-1991', 'DD-MM-YYYY'), 180, 75, 'pomocnik', 'Odra Wroclaw', 370, 3300);
INSERT INTO Zawodnicy VALUES (1010, 'Kukla', 'Kamil', To_date('01-02-1993', 'DD-MM-YYYY'), 179, 75, 'pomocnik', 'Wisla Warszawa', 250, 3000);
INSERT INTO Zawodnicy (id_zawodnika, nazwisko, imie, data_ur, wzrost, waga, pozycja) VALUES
(1011, 'Drozd', 'Adam', To_date('19-03-1995', 'DD-MM-YYYY'), 182, 77, 'pomocnik');

INSERT INTO Zawodnicy VALUES (1012, 'Jankowski', 'Marek', To_date('23-09-1999', 'DD-MM-YYYY'), 185, 80, 'napastnik', 'Warta Czestochowa', 60, 2000);
INSERT INTO Zawodnicy VALUES (1013, 'Knysak', 'Fabian', To_date('10-10-1994', 'DD-MM-YYYY'), 175, 73, 'napastnik', 'Odra Wroclaw', 250, 4000);
INSERT INTO Zawodnicy VALUES (1014, 'Tyrek', 'Tomasz', To_date('31-01-1998', 'DD-MM-YYYY'), 179, 74, 'napastnik', 'Wisla Warszawa', 200, 6000);
INSERT INTO Zawodnicy VALUES (1015, 'Zachara', 'Mateusz', To_date('09-09-2000', 'DD-MM-YYYY'), 181, 73, 'napastnik', NULL, NULL, NULL);

INSERT INTO Zawodnicy VALUES (1016, 'Jaskola', 'Milosz', To_date('13-09-1997', 'DD-MM-YYYY'), 187, 81, 'napastnik', 'Warta Czestochowa', 160, 2300);
INSERT INTO Zawodnicy VALUES (1017, 'Knus', 'Franciszek', To_date('10-03-1984', 'DD-MM-YYYY'), 177, 71, 'napastnik', 'Odra Wroclaw', NULL, 3700);
INSERT INTO Zawodnicy VALUES (1018, 'Toborek', 'Tomasz', To_date('31-03-1997', 'DD-MM-YYYY'), 183, 72, 'napastnik', 'Wisla Warszawa', 230, 6200);
INSERT INTO Zawodnicy VALUES (1019, 'Zasepa', 'Michal', To_date('19-09-2001', 'DD-MM-YYYY'), 180, 76, 'napastnik', NULL, NULL, NULL);

INSERT INTO Zawodnicy VALUES (1020, 'Borel', 'Jan', To_date('11-02-2002', 'DD-MM-YYYY'), 179, 75, 'pomocnik', 'Warta Czestochowa', NULL, NULL);
INSERT INTO Zawodnicy VALUES (1021, 'Czok', 'Damian', To_date('28-08-1995', 'DD-MM-YYYY'), 190, 82, 'obronca', 'Odra Wroclaw', NULL, NULL);
 

Select * From Zawodnicy order by 1;

commit;

--Zad2 Kolejno z tabeli Zawodnicy:
--a) usuñ dane zwi¹zane z zawodnikami, którzy nie ukoñczyli 21 roku ¿ycia,
DELETE FROM Zawodnicy WHERE (EXTRACT(year from sysdate)-EXTRACT(year from data_ur))< 21;
--b) usuñ dane wszystkich zawodników,
DELETE FROM Zawodnicy; --delete nie zapisuje transakcji
--c) sprawdŸ zawartoœæ tabeli Zawodnicy,
SELECT * FROM Zawodnicy;
--d) wycofaj/anuluj wczeœniejsze operacje,
ROLLBACK;
--e) sprawdŸ zawartoœæ tabeli Zawodnicy,
SELECT * FROM Zawodnicy;
--f) usuñ tabelê Zawodnicy wraz ze wszystkimi zwi¹zanymi z ni¹ ograniczeniami,
DROP TABLE Zawodnicy cascade constraints;
--g) wycofaj/anuluj wczeœniejsze operacje,
ROLLBACK;
--h) sprawdŸ zawartoœæ tabeli Zawodnicy,
select * from Zawodnicy;
--i) przywróæ stan pocz¹tkowy (przed realizacj¹ zadania nr 2).
select * from Zawodnicy;
--j)Podaj przyk³ady, w ramach których próba dopisania danych zawodnika do tabeli Zawodnicy
--nie powiedzie siê ze wzglêdu na naruszenie na³o¿onych na tabelê ograniczeñ
Insert into Zawodnicy(id_zawodnika,nazwisko,imie, data_ur) VALUES (1002,'Andryskiewicz','Artur',
TO_DATE('28-05-1995','DD-MM-YYYY'));
--Zad3 Dokonaj uporz¹dkowania danych przechowywanych w tabeli Zawodnicy poprzez przypisanie wszystkim
--zawodnikom nieposiadaj¹cym:
--? przynale¿noœci klubowej frazy wolny zawodnik,
--? okreœlonej wartoœci liczby minut (kolumna liczba_minut) wartoœæ 0,
--? okreœlonej wartoœci p³acy (kolumny placa) wartoœæ 0.
UPDATE Zawodnicy SET klub='wolny zawodnik', liczba_minut=0, placa=0 WHERE klub is null;

select* from zawodnicy;

--Zad4 Rozegrano spotkanie Warta Czestochowa – Odra Wroclaw. Dokonaj aktualizacji danych w tabeli
--Zawodnicy poprzez dodanie zawodnikom obu dru¿yn w ramach kolumny liczba_minut wartoœci:
--? 90 w przypadku zawodników, którzy przed tym spotkaniem spêdzili na boisku powy¿ej
--100 minut,
--? 45 w przypadku zawodników, którzy przed tym spotkaniem spêdzili na boisku przynajmniej
--1 minutê,
--? 15 w przypadku zawodników, którzy przed tym spotkaniem nie rozegrali nawet 1 minuty.
-- Zadanie zrealizuj w ramach jednego polecenia.

UPDATE Zawodnicy SET liczba_minut=liczba_minut+(CASE 
WHEN liczba_minut>100 THEN 90 
WHEN liczba_minut BETWEEN 1 AND 100 THEN 45 
ELSE 15 END) 
WHERE klub IN ('Odra Wroclaw','Warta Czestochowa');

--Zad5 W tabeli Zawodnicy zwiêksz o 25% p³acê zawodnika (zawodników), który rozegra³ najwiêksz¹ liczbê
--minut w danej dru¿ynie oraz zmniejsz o 10% p³acê zawodnika (zawodników), który rozegra³ najmniejsz¹
--liczbê minut w danej dru¿ynie.
--Zaproponuj dwa rozwi¹zania, w tym rozwi¹zanie realizuj¹ce zadanie w ramach jednego polecenia.

UPDATE Zawodnicy z SET placa=placa*(case
when liczba_minut=(select max(liczba_minut)from zawodnicy where klub= z.klub) then 1.25
when liczba_minut=(select min(liczba_minut) from zawodnicy where klub = z.klub ) then 0.9
else 1 end) where klub is not null and klub not like 'wolny zawodnik';

select * from zawodnicy where ROWNUM=1;

--Zad6 W tabeli Zawodnicy zawodnikom nieposiadaj¹cym przynale¿noœci klubowej przypisz klub, który aktualnie
--dysponuje najmniej liczn¹ kadr¹ (najmniejsza liczba zawodników) oraz ustal ich place na poziomie 2123
--(w sytuacji gdy najmniej liczn¹ kadr¹ dysponuje kilka klubów wówczas wszystkim zawodnikom przypisz
--jeden z nich).
update zawodnicy set klub=(select klub from(select min(count(*))min_liczba from zawodnicy 
where klub is not null and klub not like 'wolny zawodnik' group by klub)p1 join 
(select klub,(count (*))liczba from zawodnicy where 
klub is not null and klub not like 'wolny zawodnik'
group by klub)p2
on (min_liczba=liczba)where ROWNUM=1),placa=2123 where
klub is null or klub like 'wolny zawodnik' ;

select * from zawodnicy where rownum < 5;

--zad 7 W tabeli Zawodnicy zrealizuj transfer najm³odszego zawodnika klubu Odra Wroclaw do klubu Warta
--Czestochowa jednoczeœnie podwy¿szaj¹c mu p³acê o 2500 PLN. W przypadku gdyby kilku to kryterium
--wówczas transferowi ma podlegaæ tylko jeden z nich (dowolny – bez narzuconych warunków).
commit;
rollback;

update zawodnicy set placa = NVL(placa, 0) + 2500, klub = 'Warta Czestochowa' 
where id_zawodnika = 
(select id_zawodnika from zawodnicy where klub = 'Odra Wroclaw' and data_ur =
(select max(data_ur) from zawodnicy where klub = 'Odra Wroclaw') and rownum =1);

select * from zawodnicy where rownum =1;

-- zad 8 Do tabeli Zawodnicy wprowadŸ dwa nowe rekordy (Tabela 2), w ramach których id_zawodnika zawsze
--bêdzie przyjmowa³o pierwsz¹ woln¹ wartoœæ (bez wzglêdu na aktualn¹ zawartoœæ). Nastêpnie w tabeli
--Zawodnicy dokonaj aktualizacji liczby minut spêdzonych przez poszczególnych (wszystkich) zawodników
--obliczaj¹c wartoœæ dodawan¹ (do dotychczasowej wartoœci) wed³ug nastêpuj¹cego algorytmu:
--? (liczba liter w imieniu + liczba liter w nazwisku)*10 – dla zawodników klubu Warty Czestochowa,
--? liczba liter w nazwisku * 20 – dla zawodników klubu Odry Wroclaw,
--? liczba liter w imieniu * 20 – dla zawodników klubu Wisly Warszawa,
--? liczba okreœlaj¹ca, który aktualnie jest dzieñ roku (np. 123) – dla zawodników innych klubów.
--pod warunkiem, ¿e dany zawodnik spêdzi³ na boisku przynajmniej 1 minutê. 

INSERT INTO zawodnicy VALUES
((select max(id_zawodnika) + 1 from zawodnicy),'NOWAK','Pawel',to_date('10.01.1984','DD.MM.YYYY')
,172,90,'obronca','Orzel Krakow',500,4500);

INSERT INTO zawodnicy VALUES
((select max(id_zawodnika) + 1 from zawodnicy),'Testowski','Pawel',to_date('10.01.1995','DD.MM.YYYY')
,172,100,'obronca','Orzel Krakow',500,null);

commit;

update zawodnicy set liczba_minut = nvl(liczba_minut, 0) +
case
when klub = 'Warta Czestochowa' then length(concat(nazwisko, imie)) * 10
when klub = 'Odra Wroclaw' then length(nazwisko) * 20
when klub = 'Wisla Warszawa' then length(imie) * 20
else 0 end
where liczba_minut >= 1;

--Zad9 W tabeli Zawodnicy najstarszemu zawodnikowi (zawodnikom) wœród wszystkich zawodników
--(ze wszystkich klubów) zmieñ przynale¿noœæ klubow¹ (klub) na „wolny zawodnik” (co oznacza placa = 0)
--ale pod warunkiem, ¿e nie jest zawodnikiem, który w swoim klubie spêdzi³ na boisku najwiêksz¹
--liczbê minut.
UPDATE zawodnicy z SET z.klub = 'wolny zawodnik', z.placa = 0 WHERE klub IS NOT NULL
AND klub != 'wolny zawodnik' AND z.data_ur = (SELECT MIN(data_ur) FROM zawodnicy
WHERE klub IS NOT NULL AND klub != 'wolny zawodnik')
AND z.liczba_minut <(SELECT MAX(liczba_minut)FROM zawodnicy WHERE klub = z.klub);

--Zad10 W tabeli Zawodnicy dokonaj aktualizacji p³ac zawodników posiadaj¹cych przynale¿noœæ klubow¹ wed³ug
--nastêpuj¹cego algorytmu:
--? obni¿enie p³acy o 20% w przypadku zawodników, których liczba minut spêdzonych na boisku jest
--mniejsza ni¿ 50% wartoœci œredniej liczby minut spêdzonych na boisku przez zawodników
--ich dru¿yn,
--? obni¿enie p³acy o 10% w przypadku zawodników, których liczba minut spêdzonych na boisku
--mieœci siê w przedziale [50%, 80%] wartoœci œredniej liczby minut spêdzonych na boisku przez
--zawodników ich dru¿yn,
--? podwy¿szenie p³acy o 10% w przypadku zawodników, których liczba minut spêdzonych na boisku
--mieœci siê w przedziale [120%, 150%] wartoœci œredniej liczby minut spêdzonych na boisku przez
--zawodników ich dru¿yn,
--? podwy¿szenie p³acy o 20% w przypadku zawodników, których liczba minut spêdzonych na boisku
--jest wiêksza ni¿ 150% wartoœci œredniej liczby minut spêdzonych na boisku przez zawodników
--ich dru¿yn.
UPDATE zawodnicy z SET placa = placa * case 
WHEN nvl(liczba_minut, 0) < 0.5 * (SELECT avg(liczba_minut) FROM zawodnicy WHERE klub = z.klub) THEN 0.8
WHEN nvl(liczba_minut, 0) BETWEEN 0.5 * (SELECT avg(liczba_minut) FROM zawodnicy WHERE klub = z.klub) 
AND 0.8 * (SELECT avg(liczba_minut) FROM zawodnicy WHERE klub = z.klub) THEN 0.9
WHEN nvl(liczba_minut, 0) BETWEEN 1.2 *(SELECT avg(liczba_minut) FROM zawodnicy WHERE klub = z.klub) 
AND 1.5 * (SELECT avg(liczba_minut) FROM zawodnicy WHERE klub = z.klub)THEN 1.1
WHEN nvl(liczba_minut, 0) > 1.5 *(SELECT avg(liczba_minut) FROM zawodnicy WHERE klub = z.klub) THEN 1.2
ELSE 1 
END
WHERE klub is not null or klub not like 'wolny zawodnik';

drop table Zawodnicy cascade constraints;

