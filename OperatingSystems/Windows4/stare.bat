::19. Napisz skrypt o nazwie stare.bat, który wyświetli listę wszystkich nazw plików z
::rozszerzeniem txt we wszystkich katalogach na dysku C, następnie znajdzie pliki mające
::nazwę Readme, posortuje je od drugiego znaku i wynik zapisze do pliku stare.txt. Następnie
::wywołaj skrypt laboratorium (z pkt.4). Wyświetl bieżącą datę bez wyświetlenia monitu o
::nową datę i również zapisz ją do pliku stare.txt. Na końcu wyświetl napis ”koniec
::poszukiwań“.
cd /d c:\
dir /s /b *.txt
dir /s /b Readme.* > stare.txt
sort /+2 stare.txt /o stare.txt
call laboratorium.bat
date /t >> stare.txt
@echo koniec poszukiwań