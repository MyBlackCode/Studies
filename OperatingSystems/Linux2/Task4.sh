#Task 4
#Utwórz w katalogu domowym pliki o nazwie informacja, wprowadz do niego swoja nazwe uzytkownika. 
#Ustaw prawa do odczytu i zapisu tylko dla wlasciciela pliku. Spróbuj odczytac pliki informacja 
#z katalogów domowych innych uzytkowników. Jaki skutek? 
#
touch $Home\info.txt
whoami > $Home\info.txt
cat $Home\info.txt
chmod -rw------- $Home\info.txt