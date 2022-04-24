<#1. Użyj polecenia Get-Help dla komendy Get-Help, aby dowiedzieć się więcej o
uzyskiwaniu pomocy. (2.2) #>
Write-Host Zadanie1
Get-Help Get-Help

<#2. Utwórz strukturę katalogów, stosując polecenia z PowerShella, zawierającą katalog główny
o nazwie {Dom} oraz dwa podkatalogi o nazwach {Drzwi} oraz {Okno}.(Dodatek A) #>
Write-Host Zadanie2
New-Item -ItemType Directory Dom
Get-ChildItem
cd Dom
New-Item -ItemType Directory Drzwi
New-Item -ItemType Directory Okno
Get-ChildItem

<#3. Wewnątrz katalogu {Drzwi} utwórz pliki tekstowe {Klamka.txt} zawierający rodzaj klamki
np.: Mosiężna, Chromowana itp. oraz {Zamek.txt} zawierający rodzaj zamka np.:
Wpuszczany, Nawierzchniowy itp. Do utworzenia pliku użyj strumienia lub przesyłania
potokowego. (2.9) #>
Write-Host "`n Zadanie3"
cd Drzwi
"Mosieżna, Chromowana" > Klamka.txt
"Wpuszczany, Nawierzchniowy" > Zamek.txt
Get-Content Klamka.txt
Get-Content Zamek.txt

<#4. Ustaw atrybut pliku {Klamka.txt} na ukryty oraz atrybut pliku Zamek.txt na tylko do
odczytu. (3.3) #>
Write-Host "`n Zadanie4"
attrib +h Klamka.txt 
attrib +r Zamek.txt
Get-ChildItem -Force

<#5. Skopiuj plik {Klamka.txt} do katalogu {Okno}. Kopiując ustaw jego nazwę na {Klamka
okienna.txt}. (Dodatek A) #>
 Write-Host " `n Zadanie5"
 Copy-Item Klamka.txt  C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom\Okno\"Klamka okienna".txt
 cd..
 cd Okno
 Get-ChildItem
 Get-ChildItem -Force

<#6. Wyświetl zawartość pliku {Klamka okienna.txt} wewnątrz konsoli.(2.9) #>
Get-Content '.\Klamka okienna.txt'

<#7. Znajdź sposób na edycję pliku {Klamka okienna.txt}.(3.3) #>
attrib -h

<#8. Zmień zawartość pliku {Klamka okienna.txt} na Plastikowa. Użyj w tym celu strumienia.#>
"Plastikowa" > '.\Klamka okienna.txt'

<#9. Wyświetl zawartość katalogu {Drzwi}.#>
Get-ChildItem C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom\Drzwi

<#10. Wyświetl pomoc w zewnętrznym oknie na temat polecenia Get-ChildItem. Znajdź
sposób na wyświetlenie plików ukrytych. #>
Get-Child -Force

<#11. Używając polecenia Get-ChildItem wyświetl zawartość katalogu i podkatalogów
folderu {Dom}. Wyświetl tylko pliki o rozszerzeniu *.txt. Wyświetl pliki ukryte.#>
Get-ChildItem C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom -Recurse -Force *.txt

<#12. Używając poprzedniego polecenia oraz przetwarzania potokowego i strumieni skonstruuj
polecenie, które odnajdzie wszystkie pliki o rozszerzeniu *.txt, a następnie zapisze ich
nazwy do pliku {Dokumenty.txt} w folderze {Dom}.#>
Get-ChildItem C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom -Recurse -Name -Force *.txt > C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom\Dokumenty.txt

<#13. Utwórz folder {Dokumenty} w katalogu {Dom}. #>
cd C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom
New-Item -ItemType Directory Dokumenty

<#14. Wyszukaj wszystkie pliki *.txt w podkatalogach folderu {Dom}, a następnie przenieś je do
katalogu {Dokumenty}. Wykonaj polecenie stosując jeden, ciągły zapis z wykorzystaniem
potoków.#>
$directoryInfo=  Get-ChildItem C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom -Recurse *.txit | Measure-Object
For($i=1;$i -le $directoryInfo.count;$i++)
{
     $a=Get-ChildItem C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom -Recurse -Name -Force *.txt | Select -Index $i
 Move-Item C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom\$a C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom\Dokumenty
}

<# 15. Utwórz foldery {Katalogi} oraz {Parzyste} wewnątrz folderu {Dom}. #>
cd C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom
New-Item -ItemType Directory Katalogi
New-Item -ItemType Directory Parzyste

<#16. Napisz funkcję UtwórzKatalogi, która utworzy w folderze {Katalogi} 9 folderów o
nazwach {Katalog1},{Katalog2} itd. Użyj w tym celu pętli for. (3.1) #>
function UtworzKatalogi()
{
    for($i=1; $i -le 9; $i++)
    {
	New-Item -ItemType Directory "Katalog$i"
    }
}

UtworzKatalogi

<#17. Skonstruuj polecenie które wyświetli zawartość folderu katalogi, a następnie wybierze te z
parzystą cyfrą na końcu i przeniesie je do katalogu {Parzyste}.
#>
for($i=1; $i -le 9; $i++)
{
    if (-not ($i%2)) {
	Move-Item C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom\Katalogi\"Katalog$i"     C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell1\Dom\Parzyste         
	}
}
