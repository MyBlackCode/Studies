:: PL - 1.Opróżnij zawartość pamięci podręcznej programu rozpoznawania nazw klientów DNS.
:: ENG - 1.Flush the DNS client resolver cache
echo Exercise1
ipconfig /flushdns

::PL - 2.Wyświetl statystyki dla stacji roboczej, tak aby po zapełnieniu ekranu system oczekiwał na
::naciśnięcie klawisza.
::ENG - 2.Display statistics for the workstation so that when the screen fills the system waits for
::pressing a key.
echo.
echo Exercise2
net statistics workstation & pause

::PL - 3.Włącz przywracanie bieżących połączeń przy każdym logowaniu, niezależnie od późniejszych
::zmian.
::ENG - 3.Enable restoration of current connections every time you log in, regardless of any subsequent changes.
echo.
echo Exercise3
net use /persistent:yes

::PL - 4.Uruchom kalkulator za pomocą wiersza poleceń.
::ENG - 4.Run the calculator via the command line.
echo.
echo Exercise4
calc.exe

::PL - 5.Proszę przećwiczyć wszystkie opcje polecenia net.
::ENG - 5.Please practice all net command options.
echo.
echo Exercise5
net accounts
net computer
net config
net pause netlogon
net continue netlogon
net file
net group
net help 
net localgroup
net name
net session

::PL - 6.Wyświetl zmienne środowiskowe, których nazwa zaczyna się na literę D.
::Klucz: Nie ma zmiennej środowiskowej na literę D. Poprawna odpowiedź to P.
::ENG - 6.Display environment variables beginning with the letter D.
echo.
echo Exercise6
set D

::PL - 7.Zamknij zadanie o id =7.
::ENG - 7.Close the task with id = 7.
echo.
echo Exercise7
taskkill /PID 7

::PL - 8.Zapoznaj się z innymi opcjami polecenia Winsat.
::ENG - 8.See the other Winsat command options.
echo.
echo Exercise8
winsat/?

::PL - 9.Ustaw maksymalną długość haseł na 8 znaków.
::ENG - 9.Set the maximum length of passwords to 8 characters.
echo.
echo Exercise9
:: minimalna długość hasła - get accounts /minplen:8 
::maksymalna liczba dni ważności - get accounts /minpwage:8

::PL - 10. Wyświetl ustawienia stacji roboczej.
::ENG - 10.View workstation settings.
echo.
echo Exercise10
net config worksation

::PL - 11.Dodaj nową grupę do listy na serwerze o nazwie nowa.
::ENG -11.Add a new group to the list on the server named new.
echo.
echo Exercise11
net group New /add /domain
net group
net group New /delete

::PL - 12.Zatrzymaj Harmonogram zadań.
::ENG - 12.Stop the Task Scheduler.
echo.
echo Exercise12
net stop Harmonogram zadań

::PL - 13.Udostępni zasoby z folderu dom z dysku USB.
::ENG - 13.Will share resources from the home folder on the USB drive.
echo.
echo Exercise13
net share dom=D:\dom /unlimite
net share
net share dom /delete
net share

::PL - 14.Utwórz konto o nazwie Test, które nie jest zabezpieczone hasłem i użytkownik może się logować
::od 8.00 do 11.00
::ENG - 14.Create an account called Test, which is not password protected, and the user can log in 
::from 8.00am to 11.00am.
echo.
echo Exercise14
net user Test /add /PASSWORDREQ:NO /times:monday-sunday,8:00-11:00
net user
net user Test /delete

::PL - 15.Zapoznaj się z poleceniami jakich możesz użyć na serwerze ftp.
::ENG - 15.Familiarize yourself with the commands you can use on the ftp server.
echo.
echo Exercise15
ftp/?

::PL - 16.Zapoznaj się z nowymi poleceniami: netsh, netstat, tracert, ping i pathping
::ENG - 16.Check out the new commands: netsh, netstat, tracert, ping, and pathping
