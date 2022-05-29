#Task23
#Zapoznaj się z pomocą polecenia seq (man seq lub seq − −help).
man seq
#Task24
#Wyświetl za pomocą seq liczby nieparzyste od 1 do 99.
seq -s " " 1 2 99

#Task25
#Napisz skrypt z pętlą przechodzącą po tych liczbach i tworzącą katalogi o nazwie ’kat$liczba’.
for i in `seq 1 2 99`; do
	mkdir kat$i
done 
