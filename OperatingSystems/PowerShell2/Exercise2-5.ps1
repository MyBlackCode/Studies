<# Exercise2
PL
Pobierz zawartość pliku tekstowego do zmiennej typu string. Zdefiniuj typ zmiennej
przed pobraniem zawartości pliku.
ENG
Get the contents of the text file into a string variable. Define the type of the variable
before downloading the file contents.#>

[string]$variable = Get-Content -Path C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell2\Miesiące.txt


<# Exercise3
PL
Wyświetl zawartość zmiennej.
ENG
Display the contents of a variable. #>

$variable


<# Exercise4
PL
Znajdź indeks rozpoczynający nazwę drugiego miesiąca, następnie używając metody
substring zapisz ją do drugiego pliku tekstowego o nazwie {Miesiąc roku przestępnego}.
ENG
Find the index that begins with the name of the second month, then using the
substring, save it to a second text file named {Leap Year Month}. #>

$variable.Substring($variable.IndexOf("Luty"), 4) | Out-File C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell2\"Miesiąc roku przestępnego.txt"
type .\"Miesiąc roku przestępnego.txt"


<# Exercise5 
PL
Usuń Luty z utworzonej zmiennej.
ENG
Remove February from the created variable. #>

$variable = $variable.Remove($variable.IndexOf("Luty"), 5)
$variable
