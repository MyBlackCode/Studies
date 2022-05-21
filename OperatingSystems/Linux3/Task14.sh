#Task14
#Znajdź błędy w skrypcie:

#if [-d plik ]; then      brak spacji
#mv plik plik2
#elif [ -f plik3 ] then   brak srednika
# mw plik3 plik4          mv zamiast mw
#fi

if [ -d plik ]; then
 mv plik plik2
elif [ -f plik3 ]; then
 mv plik3 plik4
fi

#Najczestrze bledy:
#brak spacji przy warunku if: poprawny zapis if [ $a –lt $b ]
#brak średnika jeżeli w linii występuje kilka komend: poprawnie: if [ … ] ; then
#spacje przy tworzeniu zmiennych (nie mogą występować): poprawnie a=5
#błędy w nazwach poleceń i składni (źle: mw i elseif)
