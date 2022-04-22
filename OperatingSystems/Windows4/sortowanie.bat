::22. Napisz procedurę sortowanie.bat, która posortuje plik podany jako pierwszy parametr
::wywołania procedury według drugiego znaku w każdym wierszu i wynik zapisze do pliku
::podanego jako drugi parametr wywołania procedury.
sort /+2 %1.txt > %2.txt
