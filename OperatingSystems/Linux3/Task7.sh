#Task7
#Stwórz skrypt nadający prawo do zapisu dla grupy, plikowi podanemu jako parametr
#(wywołanie: skrypt nazwapliku). Jeśli nazwa pliku nie zostanie podana wyświetl
#komunikat o błędzie.
if [ $1 ] ; then
 chmod g+w $1
else
 echo "Nie podano nazwy pliku"
fi
