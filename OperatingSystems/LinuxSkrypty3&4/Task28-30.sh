#Task28
#Zapisz w dowolnym pliku kilka wyrazów.
#touch plik
#echo raz > plik
#echo dwa >> plik
#echo trzy >> plik
#echo cztery >> plik
#Task29
#Napisz pętle wyświetlającą kolejno wyrazy z tego pliku.
#Task30 
#Po każdym wyrazie pętla powinna odczekać sekundę (polecenie sleep).

for i in plik 
do
	echo $i
	sleep 1
done

