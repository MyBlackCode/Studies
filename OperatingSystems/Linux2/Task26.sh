#Task26
#Czy wsród zmiennych srodowiskowych istnieja zmienne USER, UID, DIR, 
#HOSTNAME, PWD. Jesli tak wyprowadz ich wartosc oraz nazwy do pliku 
#(polecenia set i grep). 
$HOME/plik.txt
grep 'USER\|UID\|DIR\|HOSTNAME\|PWD' $HOME/plik.txt > $HOME/wynik.txt
cat wynik.txt