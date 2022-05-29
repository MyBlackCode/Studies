#Task26
#Napisz skrypt wykorzystujący pętle select (bez instrukcji case)) zawierającą 12 różnych opcji.
#Task27
#Pętla powinna się zakończyć gdy użytkownik wybierze opcję nr. 7
select i in 1 2 3 4 5 6 7 8 9 10 11 12
do
	if [ $i -eq 7 ]; then
		exit
	else
		echo $i 
	fi
done
