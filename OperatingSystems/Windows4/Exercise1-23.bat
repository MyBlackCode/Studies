::1. Przetestuj wszystkie przykładowe skrypty zawarte w ćwiczeniu.
    :: a)Wyświetl numery wierszy w których występuje aCzwartek.
    @echo off
    echo Exercise1.a
    find /n "aCzwartek" dni.txt
    echo.
    
    ::b)Posortuj w kolejności alfabetycznej dni. Wynik zapisz do pliku dni_sort.txt  
    echo Exercise1.b
    sort /+4 dni.txt /o dni_sort.txt
    type dni_sort.txt
    echo.

    :: c) Petle
    echo Exercise1.c
    for /L %%i in (1,1,5) do echo %%i
    echo.

::2. Zapisz w pliku aczwartek.txt numery wierszy i wiersze w których występuje aCzwartek.
echo Exercise2O
find /N "aCzwartek" dni.txt > aCzwartek.txt
type aCzwartek.txt
echo.

::3. Napisz skrypt, który posortuje pliki alfabetycznie w katalogu bieżącym
echo Exercise3
dir /b /o:n
echo.

::4. Napisz skrypt, który zlokalizuje uszkodzone woluminy.
echo Exercise4
chkdsk C: /f /r
echo.

::5. Zaproponuj własne pliki wsadowe, korzystając ze wszystkich znanych Ci poleceń i umieść je w 
::sprawozdaniu.
echo Exercise5
set /p imie=Jak masz na imie?
set /p nazwisko=Jak masz na nazwisko?
set /p wiek=Ile masz lat?
set personalia=%imie%_%nazwisko%
echo Imie: %imie% >> %personalia%.txt
echo Nazwisko: %nazwisko% >> %personalia%.txt
echo Wiek:: %wiek% >> %personalia%.txt
type %personalia%.txt
echo.

::6. Napisz skrypt, który zatrzymuje bufor wydruku czyści go i ponownie go uruchamia.
echo Exercise6
echo Czyszczenie bufora wydruku
net stop spooler
echo Usuwanie bufora
del /q /f /s "%systemroot%\system32\spool\PRINTERS\*.*"
net start spooler
echo Done
echo.

::7. Napisz skrypt, który kopiuje pliki z jednego folderu do drugiego
echo Exercise7 
copy C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\Windows4\%personalia%.txt C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\Windows4\klient\%personalia%.txt
echo.

::8. Napisz skrypt, który będzie zakładał katalogi o nazwie : 1,2,3,4,5,6 oraz wyświetli czy 
::zostały utworzone.
echo Exercise8 
for /L %%i in (1,1,6) do mkdir %%i
dir
echo.
::9. Napisz program, który będzie usuwał z dysku usb wszystkie pliki i foldery.
echo Exercise9
::format g: /q
echo.
::10. Napisz skrypt, który będzie wyświetlał informację o wersji systemu operacyjnego.
echo Exercise10
systeminfo
echo.

::11. Napisz skrypt który będzie odzyskiwał dane z dysku USB. Użytkownik musi podać nazwę pliku
::do odzyskania.
echo Exercise11
echo Wprowadz nazwe pliku z klawiatury
::set /p nazwa=chkdsk %nazwa% /r /f

::12. Napisz skrypt, który zmienia system plików z Fat na NTFS
echo Exercise12
::convert g: /fs:ntfs
echo.

::13. Napisz skrypt, który będzie wyświetlał mac karty sieciiowej oraz konfigurację Ip.
echo Ezercise13
ipconfig /all
echo.

::14. Napisz skrypt, który wyświetla informacje o serwerze, stacji roboczej, grupach
echo Exercise14
net config  server
net config workstation
net group
echo.
::15. Sprawdź działanie skryptu logowania na zajęciach poświęconym użytkownikom i grupom
::(ćwiczenie nr 6). Znając składnie poleceń napisz w punktach co robi nasz przykładowy skrypt
::logowania skrypt.bat

::16. Napisz skrypt kolejnosc.bat, który wypisze liczby w kolejności 5,4,3,2,1 oraz 75,50,25,0
::(zastosuj instrukcję pętli for).
echo Exercise16
for /L %%i in (5,-1,1) do echo %%i
for /L %%i in (75,-25,0) do echo %%i
echo.

::17. Napisz skrypt o nazwie laboratorium.bat, który wyświetli 5 razy słowo laboratorium.
echo Exercise17
for /L %%i in (1,1,5) do echo laboratorium
echo.

::18. Napisz skrypt, który wyświetli nazwę bieżąco zalogowanego użytkownika, literę dysku i
::ścieżkę na której znajduje się katalog macierzysty bieżącego użytkownika, wyświetl
::producenta procesora zainstalowanego w systemie.
echo Exercise18
echo Aktywny uzytkownik to: %username% a jego sciezka katalogu macierzystego to: %userprofile%
wmic cpu get caption, deviceid, name
echo.

::19. Napisz skrypt o nazwie stare.bat, który wyświetli listę wszystkich nazw plików z
::rozszerzeniem txt we wszystkich katalogach na dysku C, następnie znajdzie pliki mające
::nazwę Readme, posortuje je od drugiego znaku i wynik zapisze do pliku stare.txt. Następnie
::wywołaj skrypt laboratorium (z pkt.4). Wyświetl bieżącą datę bez wyświetlenia monitu o
::nową datę i również zapisz ją do pliku stare.txt. Na końcu wyświetl napis ”koniec
::poszukiwań“.
echo Exercise19
cd /d c:\ 
dir /s /b *.txt 
dir /s /b Readme.* > stare.txt 
sort /+2 stare.txt /o stare.txt 
call laboratorium.bat 
date /t >> stare.txt 
@echo koniec poszukiwań
echo.

::20. Napisz skrypt o nazwie przypisz.bat, który pod zmienną b przypisze słowo” blok“ a pod
::zmienną d słowo” krok“ jeśli zmienne nie mają różnych ciągów znaków to wyświetl napis”
::różne ciągi znaków. Natomiast jeśli pierwszy ciąg znaków (przypisany zmiennej b) jest
::leksykalnie mniejszy niż drugi (przypisany zmiennej d) to wyświetl napis ”pierwszy jest
::mniejszy“.
echo Exercise20
set b="blok"
set d="krok"
if /I %b%==%d% echo rozne ciagi znakow
if /I %b% LSS %d% echo pierwszy jest mniejszy
echo.

::21. Utwórz plik plik.txt z dowolną zawartością. Następnie napisz procedurę wyszukaj.bat, która
::ma za zadanie znaleźć ciąg znaków z plik.txt określony jako pierwszy parametr wywołania
::procedury, wynik zapisz do pliku o nazwie będącej drugim parametrem wywołania procedury
::(np. wynik.txt).
::echo Exercise21
::find %1 plik.txt > %2.txt
::echo.

::22. Napisz procedurę sortowanie.bat, która posortuje plik podany jako pierwszy parametr
::wywołania procedury według drugiego znaku w każdym wierszu i wynik zapisze do pliku
::podanego jako drugi parametr wywołania procedury.
::echo Exercise22
::sort /+2 %1.txt > %2.txt
::echo.

::23. Zaproponuj własne pliki wsadowe, korzystając ze wszystkich znanych Ci poleceń i zamieść je
::w sprawozdaniu.
set /p a=
set /p b=
set /a c=%a%+%b%
echo Wynik dodawania to %c%
pause
