::Zadanie 2.
::Uruchomić wiersz poleceń i za jego pomocą wywołać skrypt utworzony w zadaniu 1. 
::Sprawdzić różnice w wywołaniu skryptu wpisując jego nazwę i wykorzystując komendę call
@echo off
echo Task2
call Task1.bat
echo.

::Zadanie 3.
::Wyświetlić informacje o przedstawionych powyżej komendach. Wywołać komendę dir w taki sposób aby
::wyświetlała za pomocą małych liter tylko nazwy plików i folderów ukrytych z katalogu C:\Windows.
echo. Task3
help
echo.
echo nazwy plikow ukrytych:
dir C:\Windows  /b /l /a:h
echo.

::Zadanie 4.
::Uruchomić skrypty z powyższych przykładów. Zastanowić się nad uzyskanym wynikiem.
echo Task4
echo Przyklad1
set zm1 = 10
set zm2=40
set zm3=test
set zm4=drugi test
set zm5="trzeci test"
echo %zm1% - %zm2% - %zm3% - %zm4% - %zm5% 
echo.

echo Przyklad2
set zm1=5
set zm2=10
set zm3=%zm1%+%zm2%
set /A zm4=%zm1%+%zm2%
echo %zm3%-%zm4%
echo.

::Zadanie 5.
::Napisać skrypt który zmieni kolor konsoli (polecenie color), zmieni tytuł okna 
::(polecenie title) oraz tryb zgłoszenia (polecenie prompt), wyświetli tekst powitania 
::zawierający nazwę użytkownika (należy ją odnaleźć w zmiennych środowiskowych), bieżącą datę 
::oraz jedną liczbę losową.
echo Task5
::color 37
::title polecenie title
::prompt Witaj %username% Data: %Date% Wylosowana liczba: %random%
echo.

::Zadanie 6.
::Uruchomić kilkakrotnie skrypty z powyższych przykładów. Zastanowić się nad uzyskanym wynikiem
echo Task6
echo Przyklad1
mkdir katalog1
if %ERRORLEVEL%==0 echo Brak bledu
if not %ERRORLEVEL%==0 echo Wystapil blad: %ERRORLEVEL% 
echo.

echo Przyklad2
mkdir katalog2
if %ERRORLEVEL%==0 ( 
    echo Brak bledu
) else ( 
    echo Wystapil blad: %ERRORLEVEL% 
)
echo.

::Zadanie 7
::Wykorzystując przełącznik /P polecenia set pobrać od użytkownika nazwę katalogu jaki ma zostać 
::utworzony. Jeżeli dany katalog istnieje, zmienić jego nazwę na nazwa.old (lub zapytać użytkowni
::a co zrobić – np. czy usunąć dany katalog). Przykład wczytania danych od użytkownika: set /P 
::katalog="Podaj nazwe katalogu: "
echo Task7
set /P katalog="Podaj nazwe katalogu:
mkdir %katalog%
if %ERRORLEVEL%==0 ( 
    echo Utworzono katalog %katalog% 
)else ( 
    echo Istnieje katalog o podanej nazwie
    rename %katalog% %katalog%.old
    mkdir %katalog%
    echo Zmieniono nazwe straszego katalogu na %katalog%.old oraz utworzono nowy katalog o nazwie: %katalog%
)
dir
echo.

::Zadanie 8.
::Napisać skrypt który będzie sumował wartości liczbowe podawane przez użytkownika (po podaniu wartości
::należy ją doliczyć do sumy). W przypadku podania wartości równej 0 skrypt powinien zakończyć działanie. 
echo Task8
set /P a=Podaj pierwsza liczbe do zsumownia: 
set /P b=Podaj druga liczbe do zsumowania: 
if %a%==0 (
    exit
)else (
    if %b%==0 (
	exit
    )
)
set /A c=%a%+%b%
echo Suma to:%c%
echo.
