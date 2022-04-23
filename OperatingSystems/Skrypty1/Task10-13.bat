::Zadanie 10.
::Napisać skrypt wykonujący pętle wyświetlającą wartości parzyste: 10 8 6 4 2 0.
@echo off
echo Task10
for /L %%i in (10,-2,0) do (
    echo %%i
)
echo.

::Zadanie 11.
::Napisać pętlę przechodzącą po nazwach wszystkich procesów wyświetlanych za pomocą polecenia tasklist.
::Pętla powinna dodatkowo zliczać wystąpienia procesu o nazwie svchost.exe oraz notepad.exe.


::Zadanie 12.
::Napisać skrypt oparty na pętli for tworzący następujące katalogi: kat1 kat3 kat5 kat7 kat9
echo Task12
for /L %%i in (1,2,9) do (
    mkdir kat%%i
)
echo.

::Zadanie 13.
::Napisać skrypt pobierający od użytkownika 3 zmienne (działanie, x, y), w zależności od podanego numeru
::działania skrypt powinien:
:: działanie == 1 – zsumować wartość x i y
:: działanie == 2 – odjąć x od y
:: działanie == 3 – odjąć y od x
:: działanie == 4 – pomnożyć x przez y
echo Task13
echo działanie == 1 – zsumować wartość x i y
echo działanie == 2 – odjąć x od y
echo działanie == 3 – odjąć y od x
echo działanie == 4 – pomnożyć x przez y
echo.
set /P n=Podaj numer dzialania jaki chcesz wykonac: 
set /P x=Podaj x: 
set /P y=Podaj y: 
if %n%==1 (
    goto skok1
)
if %n%==2 (
    goto skok2
)
if %n%==3 (
    goto skok3
)
if %n%==4 (
    goto skok4
)
echo Podano zly parametr
goto pomin
:skok1
set /A c=%x%+%y%
echo Wynik to: %c%
goto pomin
:skok2
set /A c=%x%-%y%
echo Wynik to: %c%
goto pomin
:skok3
set /A c=%y%-%x%
echo Wynik to: %c%
goto pimin
:skok4
set /A c=%x%*%y%
echo Wynik to: %c%
:pomin
pause
echo.
