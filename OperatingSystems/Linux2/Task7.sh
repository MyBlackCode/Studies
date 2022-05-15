#Task7
#Utwórz pliki o nazwach politechnika, czestochowa. 
#Dla pierwszego pliku ustaw prawa na rw-rw-r-- dla drugiego 
#na rw-r--r-- dla trzeciego r--r--r--. Wykonaj to za pomoca 
#polecenia chmod i parametru w postaci liczby ósemkowej. .
touch $Home/politechnika.txt
touch $Home/czestachowa.txt
touch $Home/trzeci.txt
chmod 664 $Home/politechnika.txt
chmod 644 $Home/czestachowa.txt
chmod 444 $Home/trzeci.txt