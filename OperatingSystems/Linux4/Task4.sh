#Task4
#Napisz skrypt wypisujący tylko ilość słów w pliku tekstowym podanym jako
#parametr.
wc -w $HOME/$1 | cut -d ' ' -f 1 