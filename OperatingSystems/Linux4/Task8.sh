#Task8
#Napisz skrypt wyświetlający same nazwy użytkowników aktualnie zalogowanych w
#systemie.
who -u | cut -d ' ' -f 1
#-u, --użytkownicy
#lista zalogowanych użytkowników 