#Task6
#Utwórz pliki o nazwach studia, informatyka, linux. 
#Dla pierwszego pliku ustaw prawa na rwxr-xr-- dla drugiego 
#na rw-rw-rw dla trzeciego r--r-----. 
#Wykonaj to za pomoca polecenia chmod i parametrów tekstowych. 
touch $Home/studia.txt
touch $Home/informatyka.txt
touch $Home/linux.txt
chmod u+rwx,g+rx,o+r $Home/studia.txt
chmod u+rw,g+rw,o+rw $Home/informatyka.txt
chmod u-w,o-r $Home/linux.txt