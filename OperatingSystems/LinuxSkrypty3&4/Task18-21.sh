#Task18
#Napisz skrypt o nazwie ’czas’.
#vi czas.sh
#Task19
#Skrypt ten powinien wyświetlić datę w formacie RRRR-MM-DD (polecenie data).
date -I
#Task20
#W zależności od numeru miesiąca powinna wyświetlać się odpowiednia nazwa pory roku.
n=`date +%m`
case $n in
	"01") echo zima;;
	"02") echo zima;;
	"03") echo wiosna;;
	"04") echo wiosna;;
	"05") echo wiosna;;
	"06") echo lato;;
	"07") echo lato;;
	"08") echo lato;;
	"09") echo jesien;;
	"10") echo jesien;;
	"11") echo jesien;;
	"12") echo zima;;
	*) echo blad;;
esac

#Task21
#Zmień atrybuty skryptu tak, aby możliwe było jego wykonanie za pomocą ./czas.
