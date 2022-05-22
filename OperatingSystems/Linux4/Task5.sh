#Task5
#Stwórz skrypt wykonujący działanie na dwóch liczbach. Po podaniu liczb działanie
#powinno być wybrane z listy.
echo Podaj a
read a
echo Podaj b
read b
echo 1-DODAWANIE
echo 2-ODEJMOWANIE
echo 3-MNOZENIE
echo 4-DZIELENIE
echo
echo Dokonaj wyboru:
read i
case $i in
 1) let c=$a+$b
    echo Wynik to:  $c ;;
 2) let c=$a-$b 
       echo Wynik to:  $c;;
 3) let c=$a*$b
     echo Wynik to:  $c ;;
 4) let c=$a/$b
      echo Wynik to:  $c ;;
 *) echo Podany znak nie odpowiada zadnej operacji ;;
esac