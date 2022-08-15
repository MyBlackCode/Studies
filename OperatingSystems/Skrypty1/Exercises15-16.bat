::Zadanie 15.
::Napisać skrypt wyświetlający informacje o systemie operacyjnym i procesorze (na podstawie zmiennych
::środowiskowych)
@echo off
echo System:
echo %SystemRoot%
echo Litera  dysku na ktorym jest system: %SYSTEMDRIVE%
echo Procesor:
echo Numer modelu procesora: %PROCESSOR_LEVEL%
echo Liczba procesorów zainstalowanych na komputerze: %NUMBER_OF_PROCESORS%
echo Architekturę procesora:%PROCESSOR_ARCHITECTURE%
echo Numer wersji procesora: %PROCESSOR_REVISION%
echo Opis procesora: %PROCESSOR_IDENTFIER%
echo.
::Zadanie 16.
::Napisać skrypt zliczający liczbę parametrów podanych jako argumenty. 

