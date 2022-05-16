#Task8
#Utwórz katalog o nazwie cwiczenie2, przenies do niego pliki z powyzszych 
#dwóch punktów. Zmien prawa dostepu dla katalogu na rw------- 
#Czy jestes w stanie przejrzec zawartosc katalogu? 

mkdir $Home/cwiczenie2
mv $HOME/studia.txt $HOME/informatyka.txt $HOME/linux.txt $HOME/politechnika.txt $HOME/czestochowa.txt $HOME/trzeci.txt $HOME/info.txt $HOME/cwiczenie2
chmod 600 $HOME/cwiczenie2
cd $Home/cwiczenie2
ls -l