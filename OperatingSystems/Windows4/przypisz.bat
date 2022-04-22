::20. Napisz skrypt o nazwie przypisz.bat, który pod zmienną b przypisze słowo” blok“ a pod
::zmienną d słowo” krok“ jeśli zmienne nie mają różnych ciągów znaków to wyświetl napis”
::różne ciągi znaków. Natomiast jeśli pierwszy ciąg znaków (przypisany zmiennej b) jest
::leksykalnie mniejszy niż drugi (przypisany zmiennej d) to wyświetl napis ”pierwszy jest
::mniejszy“.
set b="blok"
set d="krok"
if /I %b%==%d% echo rozne ciagi znakow
if /I %b% LSS %d% echo pierwszy jest mniejszy