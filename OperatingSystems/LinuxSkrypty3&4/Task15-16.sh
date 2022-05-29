#Task15
#Napisać skrypt wczytujący od użytkownika dwie liczby (polecenie read) oraz typ działania do wykonania (1 - dodawanie, 2 - odejmowanie, 3 - mnożenie, 4 - dzielenie).
#Task16
#Skrypt powinien (w zależności od numeru instrukcji) wyświetlić odpowiedni wynik.
echo 1 - dodawanie
echo 2 - odejmowanie
echo 3 - mnożenie
echo 4 - dzielenie
echo Podaj numer operacji: 
read n
echo Podaj dwie liczby
read a b
case $n in
	1) let c=$a+$b
		echo $c;;
	2) let c=$a-$b
                echo $c;;
	3) let c=$a*$b
                echo $c;;
	4) let c=$a/$b
                echo $c;;
	*) echo Zly numer operacji;;
esac
