<# Exercise 10 
PL
Napisz skrypt, który będzie obsługiwał podanie dwóch nadmiarowych parametrów. Będą
one określać zakres liczb, które należy wypisać na standardowe wyjście za pomocą pętli
for.
ENG
Write a script that handles the supply of two redundant parameters. They will
they specify the range of numbers to be written to the standard output using a for loop.#>

if(($args[0] -AND $args[1]) -EQ "" -OR ($args[0] -AND $args[1]) -EQ $null)
{ Write-Host "Musisz podać dwa parametry początek i koniec przedziału"}
else
{
    for($i = $args[0];$i -le $args[1]; $i++)
    {
	Write-Host "$i"
    }
}
