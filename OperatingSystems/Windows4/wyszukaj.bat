::21. Utwórz plik plik.txt z dowolną zawartością. Następnie napisz procedurę wyszukaj.bat, która
::ma za zadanie znaleźć ciąg znaków z plik.txt określony jako pierwszy parametr wywołania
::procedury, wynik zapisz do pliku o nazwie będącej drugim parametrem wywołania procedury
::(np. wynik.txt).
find %1 plik.txt > %2.txt