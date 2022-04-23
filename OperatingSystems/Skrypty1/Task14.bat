::Zadanie 14.
::Napisać skrypt przyjmujący dwa argumenty:
:: liczbę liczb losowych które mają zostać wygenerowane (od 1 do 10)
:: maksymalną wartość jaka ma zostać wygenerowana (parametr opcjonalny)
::Wyświetlić odpowiednie komunikaty błędów.
::Skrypt może zostać oparty zarówno na pętli for jak i instrukcji skoku goto.
@echo off
echo Task14
SETLOCAL EnableDelayedExpansion
if %1 LEQ 10 (
    if %1 GEQ 1 (
	for /L %%i in (%n%,-1,1) do (
	    set /A liczba=%random%%%%2+1
	    echo !liczba!
	)
    ) else (
	echo Podano za maly parametr
	pause
	exit
    )
) else (
    echo Podano za duzy parametr
    pause
    exit
)
SETLOCAL DisableDelayedExpansion
echo.
