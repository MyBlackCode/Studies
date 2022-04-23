::Zadanie 14.
::Napisać skrypt przyjmujący dwa argumenty:
:: liczbę liczb losowych które mają zostać wygenerowane (od 1 do 10)
:: maksymalną wartość jaka ma zostać wygenerowana (parametr opcjonalny)
::Wyświetlić odpowiednie komunikaty błędów.
::Skrypt może zostać oparty zarówno na pętli for jak i instrukcji skoku goto.
@echo off
echo Task14
set /P n=Podaj liczbe liczb do wygenerowania od 1 do 10: 
if %n% LEQ 10 (
    if %n% GEQ 1 (
	set /P s=Podaj maksymalna wartosc jaka ma zostac wygenerowana:
	SETLOCAL EnableDelayedExpansion
	for /L %%i in (%n%,-1,1) do (
	    set /A liczba=%random%%%%s%+1
	    echo !liczba!
	)
	SETLOCAL DisableDelayedExpansion	
    ) else (
	echo Podano za maly parametr
    )
) else (
    echo Podano za duzy parametr
)
::echo.
set /A liczba=%random%%%10+1
echo %liczba%
