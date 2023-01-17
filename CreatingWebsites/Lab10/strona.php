<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Strona</title>
    </head>
    
    <body>
        <?php
            $tab = [ 1, 2, 3, 5, 8, 13, 21 ];
            // przykład pętli for
            echo("Ranking słuchawek bezprzewodowych dousznych kolejny raz zdominowały modele TWS (true wireless),<br>
            czyli prawdziwie bezprzewodowe. Złoto i brąz dla AirPodsów – to Apple wymyśliło taką konstrukcję. <br>
            O resztę miejsc – wybieramy nasze hity sprzedażowe. Sprawdź jakie słuchawki znajdziesz i przeczytaj <br>
            o urządzeniach za niecałe 100 i za ponad 1500 zł. Oto najlepsze słuchawki bezprzewodowe douszne!<br><br>");

            $owoce = [ "jabłko", "banan", "gruszka", "kaki", "śliwka", "pomarańcza", "mandarynka", "cytryna" ];
            echo("Owoce: ");
            for ($i = 0; $i < count($owoce); $i++) { echo($owoce[$i].", "); }
            echo("<br><br>");

            sort($owoce);

            echo("Owoce: ");
            echo("<ul>");
            for ($i = 0; $i < count($owoce); $i++) { echo("<li>".$owoce[$i].",  </li>"); }

            echo("</ul>");
            
        ?>
    </body>
</html>