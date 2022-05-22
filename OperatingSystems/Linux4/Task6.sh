#Task6
#Napisz skrypt, który umożliwi dodawanie rozszerzenia do pliku. Skrypt powinien
#najpierw spytać o nazwę pliku, a następnie wyświetlić listę rozszerzeń (np.: .old, _bak,
#.--001) do wyboru.
echo Podaj nazwe pliku, ktory chcesz utworzyc?
read p
echo
echo 1 - .old
echo 2 - _bak
echo 3 - .--001
echo Wybierz rozszerzenie pliku
read w
case $w in
	1) touch $p.old;;
	2) touch $p._bak;;
	3) touch $p.--001;;
	*)echo zle dane;;
esac