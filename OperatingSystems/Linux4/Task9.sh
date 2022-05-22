#Task9
#Napisz skrypt wyświetlający rozmiar pliku, podanego jako parametr, w bajtach. 
wc -c $1 | cut -d " " -f 1 