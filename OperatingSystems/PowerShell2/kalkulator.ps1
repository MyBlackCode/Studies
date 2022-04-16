<# Exercise12 
PL
Napisz skrypt o nazwie Kalkulator. Wartości do skryptu będą podawane jako nadmiarowe
parametry. Skrypt ma za zadanie wykonywać podstawowe działania matematyczne. Jeśli
podane zostaną dwa parametry, skrypt zaproponuje działania takie jak dodawanie,
odejmowanie, mnożenie i dzielenie. Jeżeli do skryptu przekazany zostanie tylko jeden
parametr skrypt za pomocą polecenia switch zaproponuje takie działania jak
pierwiastkowanie, podniesienie do kwadratu i funkcje trygonometryczne Sin, Cos oraz Tan.
W razie większej ilości lub braku parametrów skrypt ma zwracać komunikat błędu
wykorzystując strumień błędów.
ENG
Write a script called Calculator. Script values ​​will be given as redundant
parameters. The script is designed to perform basic math operations. If
two parameters will be given, the script will suggest actions such as adding,
subtraction, multiplication and division. If only one is passed to the script
the script parameter with the switch command will suggest actions such as
square root, square and trigonometric functions of Sin, Cos and Tan.
In case of more or no parameters, the script should return an error message
using the error stream. #>
Write-Host "KALKULATOR"
if((($args[0] -eq $null) -or ($args[0] -eq "")) -or ($args[2] -ne $null))
{ Write-Error "Zła liczba parametrów"}
else{
    if($args[1] -eq $null)
    {
	Write-Host "1.Pierwiastkowanie"
	Write-Host "2.Potęgowanie"
	Write-Host "3.Sinus"
	Write-Host "4.Cosinus"
	Write-Host "5.Tangens"
	try{ [int32] $n = Read-Host -Prompt "Podaj numer operacji, którą chcesz wykonać"}
	catch{Write-Error"Wprowadzono złe dane"}
	switch($n)
	{
	    1 {$c=[math]::SQRT($args[0]) 
		Write-Host "$c"}
	    2 {$c=[math]::POW($args[0],2)  
		Write-Host "$c"}
	    3 {$c=[math]::SIN($args[0])
		Write-Host "$c"}
	    4 {$c=[math]::Cos($args[0])
		Write-Host "$c"}
	    5 {$c=[math]::TAN($args[0])                 
		Write-Host "$c"}
	    default{Write-Host "Podanemu numerowi nie odpowiada żadna operacja."}
	}
    }
    else{
	Write-Host "1.Dodawanie"
	Write-Host "2.Mnożenie"
	Write-Host "3.Odejmowanie"
	Write-Host "4.Dzielenie"
	 try{ [int32] $n = Read-Host -Prompt "Podaj numer operacji, którą chcesz wykonać:"}
         catch{Write-Error"Wprowadzono złe dane"}
	 switch($n)
          {
              1 {$c=$args[0]+$args[1]
		Write-Host "$c"}
              2 {$c=$args[0]*$args[1]
		Write-Host "$c"}
              3 {$c=$args[0]-$args[1]
		Write-Host "$c"}
              4 {$c=$args[0]/$args[1]
		Write-Host "$c"}
              default{Write-Host "Podanemu numerowi nie odpowiada żadna operacja."}
          }
    }

    }
