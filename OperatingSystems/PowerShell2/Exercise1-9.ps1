<# Exercise1 
PL
Utwórz plik tekstowy, w którym znajdować się będą nazwy kolejnych miesięcy w roku,
każdy miesiąc w nowej linii dokumentu. Skorzystaj w tym celu ze strumieni.
ENG
Create a text file containing the names of the next months of the year,
each month in a new line of the document. Use streams for this purpose.#>

"Styczeń`nLuty`nMarzec`nKwiecień`nMaj`nCzerwiec`nLipiec`nSierpień`nWrzesień`nPaździernik`nListopad`nGrudzień" > Miesiące.txt
Write-Host "Exercise1"
type Miesiące.txt

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

Write-Host "`nExercise2,3"
$variable


<# Exercise4
PL
Znajdź indeks rozpoczynający nazwę drugiego miesiąca, następnie używając metody
substring zapisz ją do drugiego pliku tekstowego o nazwie {Miesiąc roku przestępnego}.
ENG
Find the index that begins with the name of the second month, then using the
substring, save it to a second text file named {Leap Year Month}. #>

Write-Host "`nExercise4"
$variable.Substring($variable.IndexOf("Luty"), 4) | Out-File C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell2\"Miesiąc roku przestępnego.txt"
type .\"Miesiąc roku przestępnego.txt"


<# Exercise5 
PL
Usuń Luty z utworzonej zmiennej.
ENG
Remove February from the created variable. #>

Write-Host "`nExercise5"
$variable.Remove($variable.IndexOf("Luty"), 5)


<# Exercise6 
PL
Napisz funkcję IlośćDni, do której przekażesz wcześniej utworzoną zmienną z zapisem
wszystkich miesięcy. Funkcja ta ma za zadanie wstawiać na końcu nazwy miesiąca dopisek
na temat ilości dni w następującym formacie: Marzec-31dni, Kwiecień-30dni itd. zaczynając
od stycznia. Funkcja ma zwracać zmodyfikowany ciąg znaków tak, aby można było go
przypisać do innej zmiennej.
ENG 
Napisz funkcję IlośćDni, do której przekażesz wcześniej utworzoną zmienną z zapisem
wszystkich miesięcy. Funkcja ta ma za zadanie wstawiać na końcu nazwy miesiąca dopisek
na temat ilości dni w następującym formacie: Marzec-31dni, Kwiecień-30dni itd. zaczynając
od stycznia. Funkcja ma zwracać zmodyfikowany ciąg znaków tak, aby można było go
przypisać do innej zmiennej.#>

function IloscDni($variable) 
{
	$dni1="Styczeń-"+[DateTime]::DaysInMonth(2022, 1) +"dni"
	$variable = $variable -replace "Styczeń", $dni1
	$dni2="Luty-"+[DateTime]::DaysInMonth(2022, 2)+"dni"
	$variable = $variable -replace "Luty", $dni2
	$dni3="Marzec-"+[DateTime]::DaysInMonth(2022, 3)+"dni"
	$variable = $variable -replace "Marzec", $dni3
	$dni4="Kwiecień-"+[DateTime]::DaysInMonth(2022, 4)+"dni"
	$variable = $variable -replace "Kwiecień", $dni4
	$dni5="Maj-"+[DateTime]::DaysInMonth(2022, 5)+"dni"
	$variable = $variable -replace "Maj", $dni5
	$dni6="Czerwiec-"+[DateTime]::DaysInMonth(2022, 6)+"dni"
	$variable = $variable -replace "Czerwiec", $dni6
	$dni7="Lipiec-"+[DateTime]::DaysInMonth(2022, 7)+"dni"
	$variable = $variable -replace "Lipiec", $dni7
	$dni8="Sierpień-"+[DateTime]::DaysInMonth(2022, 8)+"dni"
	$variable = $variable -replace "Sierpień", $dni8
	$dni9="Wrzesień-"+[DateTime]::DaysInMonth(2022, 9)+"dni"
	$variable = $variable -replace "Wrzesień", $dni9
	$dni10="Październik-"+[DateTime]::DaysInMonth(2022, 10)+"dni"
	$variable = $variable -replace "Październik", $dni10
	$dni11="Listopad-"+[DateTime]::DaysInMonth(2022, 11)+"dni"
	$variable = $variable -replace "Listopad", $dni11
	$dni12="Grudzień-"+[DateTime]::DaysInMonth(2022, 12)+"dni"
	$variable = $variable -replace "Grudzień", $dni12
	return $variable
}


<# Exercise7
PL
Wywołaj wcześniej utworzoną funkcję a następnie przypisz jej wartość zwracaną do nowej
zmiennej
ENG
Call the previously created function and then assign its return value to the new one
variable.#>

$variable = IloscDni($variable)

<#Exercise8 
PL
Zmień zapis wewnątrz zmiennej tak, aby każdy miesiąc z przypisaną mu ilością dni
zapisany był w nowej linii.
ENG
Change the record inside the variable so that each month with the number of days assigned to it
was written on a new line.#>

Write-Host "`nExercise6,7,8"
$variable.Split(" ")


<#Exercise9 
PL
Zapisz powstałą zmienną do pliku tekstowego {Miesiące.txt} używając strumienia lub
potoku.
ENG
Zapisz powstałą zmienną do pliku tekstowego {Miesiące.txt} używając strumienia lub
potoku.#> 

Write-Host "`nExercise9"
$variable.Split(" ") | Out-File C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\PowerShell2\Miesiące.txt
type Miesiące.txt
