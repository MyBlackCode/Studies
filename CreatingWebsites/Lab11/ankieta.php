<?php
    session_start();
    if (isset($_SESSION["licznik"])) {
        $_SESSION["licznik"]++; // jeżeli $_SESSION["licznik"] istnieje to inkrementujemy
    } else {
        $_SESSION["licznik"] = 0; // jeżeli $_SESSION["licznik"] nie istniała zaczynamy od 0
    }
?>

<!DOCTYPE html>
<html>
    <head>
      <meta charset="utf-8">
        <title>Gra</title>
    </head>
    
    <body>
    <?php
    if (isset($_POST["imie"])) {
        $imie = strip_tags($_POST["imie"]); 
    } else {
        $imie = "";
    }
    if (isset($_POST["wiek"])) { 
        $wiek = strip_tags($_POST["wiek"]); 
    } else {
        $wiek = "";
    }
    if (isset($_POST["kwota"])) { 
        $kwota = strip_tags($_POST["kwota"]); 
    } else {
        $kwota = ""; 
    }
    if (isset($_POST["wybor"])) { 
        $wybor = strip_tags($_POST["wybor"]); 
    } else {
        $wybor = ""; 
    }

?>
        <form method="post">
            Imię: <input name="imie"><br> <br>
            Wiek: <input name="wiek"><br> <br>
            Kwota oszczędności: <input name="kwota"><br> <br>
            <select name="wybor" multiple>
                <option>Nieruchomości</option>
                <option>Akcje</option>
                <option>Złoto</option>
                <option>Obligacje</option>
            </select>
            <button onclick="submit();">Prześlij</button>
        </form>
        <?php
            if($_SESSION["licznik"]<=1){
                if ($_SERVER["REQUEST_METHOD"] == "POST") { // czy dane są przesłane
                  echo("Imię: ".$_POST["imie"]."<br> <br>");
                  echo("Wiek: ".$_POST["wiek"]."<br> <br>");
                  echo("Kwota oszczędności: ".$_POST["kwota"]."<br> <br>");
                  echo("Wybór użytkownika: ".$_POST["wybor"]."<br>");
                }


                $plik = fopen("wyniki.txt", "a");
                fputs($plik,"imie ".$imie." "."wiek ".$wiek." "."kwota: ".$kwota." "."wybor: ".$wybor." ".date("Y-m-d H:i:s" )." ".$_SERVER["REMOTE_ADDR"]."\n");
                fclose($plik);
            }
            else{
                echo('<h4 style="color: red">Ankieta została już wypelniona przez użytkownika</h4>');
            }
        ?>
    </body>
</html>