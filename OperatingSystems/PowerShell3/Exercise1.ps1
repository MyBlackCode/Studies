<# Exercise 1 #>
<#1.Utwórz skrypt, w którym zostanie stworzony interfejs graficzny dla programu.#>
Add-Type -AssemblyName System.Windows.Forms
$okno = New-Object System.Windows.Forms.Form
<#2.Utwórz okno programu o wymiarach 800x600.#>
$okno.Width=800
$okno.Height= 600
<#3.Ustaw tytuł okna na Laboratorium 3.1.#>
$okno.Text = "Laboratorium 3.1."
<#4.Wyłącz możliwość skalowania okna.#>
$okno.minimumSize = New-Object System.Drawing.Size(800,600)
$okno.maximumSize = New-Object System.Drawing.Size(800,600)
<#5.Wewnątrz okna stwórz 2 pola tekstowe, do których będzie można wprowadzać wartości.#>
$poleTekstowe1 = New-Object System.Windows.Forms.TextBox
$poleTekstowe1.Location = New-Object System.Drawing.Size(100,50)
$poleTekstowe1.Width = 200
$okno.Controls.Add($poleTekstowe1)
$poleTekstowe2 = New-Object System.Windows.Forms.TextBox
<#6. Stwórz etykietę która będzie wyświetlała wynik działania, na początku wyświetlana ma
być wartość 0.#>
<#7.Utwórz przycisk Kolor#>
<#8.Wciśniecie przycisku ma wywoływać okno dialogowe wyboru koloru, który po wybraniu
zostanie zastosowany do okna programu. #>
<#9.Stwórz 4 przyciski: Suma, Różnica, Iloczyn oraz Iloraz. Każdy z nich będzie odpowiadał
za inne działanie w oparciu o podane dwie wartości.#>
<#10. Po naciśnięciu klawisza ma nastąpić wykonanie odpowiedniego działania. W przypadku
gdy jedno z pól tekstowych będzie puste należy zmienić tekst etykiety na „Błąd”. Taki sam
komunikat musi zostać wyświetlony w przypadku, gdy nastąpi próba dzielenia przez zero.
Obsługę błędów można zrealizować poprzez instrukcję try{} catch{}.#>
<#11.Dodaj kolejny przycisk o nazwie Czcionka.#>
<#12. Kliknięcie przycisku ma wywoływać okno wyboru czcionki. W oknie wyboru czcionki
należy włączyć możliwość wyboru koloru.#>
<#13.Wybrana czcionka wraz z kolorem ma stosować się do etykiety wyświetlającej wynik.
#>
$okno.ShowDialog()
