::Zadanie 1.
::Utworzyć dowolny plik tekstowy. Zaszyfrować go za pomocą polecenia cipher. Sprawdzić czy plik jest
::poprawnie zaszyfrowany (polecenie cipher bez przełączników). Spróbować otworzyć zaszyfrowany plik. Kto
::może otwierać takie pliki? 
@echo off
echo Task1
echo cos > plik.txt
cipher /E plik.txt
echo.

::Zadanie 2.
::Zastanowić się nad działaniem następującego skryptu:
echo Task2
setlocal EnableDelayedExpansion
set encr=0
for /F %%i in ('cipher') do (
 if %%i EQU E (
 set /A encr=!encr!+1
 )
)
echo Zaszyfrowanych: %encr%
echo.

::Zadanie 3.
::Wyświetlić pomoc dotyczącą komend kopiowania. Sprawdzić czy istnieją przełączniki umożliwiające nadawanie
::atrybutów i kopiowanie plików zaszyfrowanych na nośniki nie umożliwiające szyfrowania.
help copy
