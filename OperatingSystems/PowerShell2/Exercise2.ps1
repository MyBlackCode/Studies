<# Exercise2
PL
Pobierz zawartość pliku tekstowego do zmiennej typu string. Zdefiniuj typ zmiennej
przed pobraniem zawartości pliku.
ENG
Get the contents of the text file into a string variable. Define the type of the variable
before downloading the file contents.#>

[string]$variable = Get-Content -Path C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell2\Miesiące.txt
