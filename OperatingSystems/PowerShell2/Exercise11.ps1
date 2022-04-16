<# Exercise11 
PL
Napisz skrypt, w którym wyświetlisz pory roku jako ponumerowaną listę. Użytkownik po wybraniu 
numeru z listy otrzyma informację jakie miesiące należą do danej pory roku. Użyj do tego instrukcji switch.
ENG
Write a script that displays the seasons as a numbered list. After selecting the number from the list, 
the user will receive information about which months belong to the given season. Use a switch statement for this. #>
Write-Host "Pory roku:`n1.Wiosna`n2.Lato`n3.Jesień`n4.Zima"

try{ [int32]$s = Read-Host -Prompt "Podaj numer pory roku którą chcesz wybrać:"}
catch{ Write-Host "Wprowadzono nieprawidłowe dane"}

Switch ($s){
    1 {Write-Host "Do wiosny należą: marzec,kwiecień,maj"}
    2 {Write-Host "Do lata należą: czerwiec,lipiec,sierpień"}
    3 {Write-Host "Do jesieni należą: wrzesień,październik,listopad"}
    4 {Write-Host "Do zimy należą: grudzień,styczeń,luty"}
    default{ Write-Host "Podany numer nie odpowiada żadnej pory roku"}}
