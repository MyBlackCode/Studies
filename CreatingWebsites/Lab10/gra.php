<?php
    function losowy() { // zwraca losowy kolor
        $i = rand() % 3;
        switch($i) {
            case 0: return "kamień";
            case 1: return "papier";
            default: return "nożyce";
        }
    }
    $wybor = losowy();
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Gra</title>
    </head>
    
    <body>
    <div>

        <?php echo("wybór przeciwnika: ".$wybor); ?>;
        <br>
        <a href="gra.php?jaki=kamień">Kamień</a>
        <a href="gra.php?jaki=papier">Papier</a>
        <a href="gra.php?jaki=nożyce">Nożyce</a>
        <br><br>
        <?php
            $user = $_GET["jaki"];
            if(!empty($_GET)) { // czy przesłano coś przez POST
                echo("wybór przeciwnika: ".$user."<br>");
            }
            else{
                echo("wybór przeciwnika: brak <br>");

            }
         ?>
        
    </div>
    </body>
</html>