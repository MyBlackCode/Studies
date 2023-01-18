<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <?php
           

            function is_prime($number) {
                if ($number < 2) {
                    return false;
                }
                for ($i = 2; $i <= sqrt($number); $i++) {
                    if ($number % $i == 0) {
                        return false;
                    }
                }
                return true;
            }
            if (isset($_GET["a"])) {
                $val = (int)$_GET["a"];
                if (is_prime($val)) {
                    echo "$val jest liczbą pierwszą";
                } else {
                    echo "$val nie jest liczbą pierwszą";
                }
            } else {
                echo "Nie podano parametru 'a'";
            }
            echo("<br>kombinacje:<br>");
            $tab[1]="admin"; 
            $tab[2]="123";
            $tab[3]="root";
            $tab[4]="!@#";
            $tab[5]="zaqwsx";
            $tab[6]="password";

            $result = "";
            foreach($tab as $key1 => $va1){
                foreach($tab as $key2 => $va2){
                    global $result;
                    $result = "$result$va1$va2, ";
                }
                $result = "$result\n";
            }

            echo($result);
            $plik = fopen("kombinacje.txt","w");
            fputs($plik, $result."\r\n");
            fclose($plik);
        ?>
    </body>
</html>