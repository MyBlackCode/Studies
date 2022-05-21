#Task15
#Stwórz skrypt, który wyszuka nazwę procesu podaną jako parametr wśród wszystkich
#procesów obecnych w systemie i wyświetli informacje dotyczące tego procesu.
ps –f | grep $1
