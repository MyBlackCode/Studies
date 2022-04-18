::Exercise4
::PL
::Utwórz plik i nadaj mu atrybuty.
::ENG
::Create a file and give it attributes.
@echo off
echo Exercise4
echo test > plik.txt
attrib plik.txt +h +r +s +i
attrib

::Exercise5
::PL
::Wyświetl datę i godzinę systemową.
::ENG
::Display the system date and time.
echo.
echo Exercise5
echo Data:
date /t
echo Godzina:
time /t

::Exercise6
::PL
::Zdejmij z pliku atrybuty które nadałeś.
::ENG
::Remove the attributes you have given from the file.
echo.
echo Exercise6
attrib plik.txt -h -r -s -i
attrib

::Exercise7
::PL
::Utwórz katalog i usuń go za pomocą polecenia rd lub rmidir.
::ENG
::Create a directory and delete it with the rd or rmidir command.
echo.
echo Exercise7
::tworzenie
mkdir NewFolder
dir
::usuwanie
rmdir NewFolder
dir

::Exercise8
::PL
::Zaszyfruj katalog.
::ENG 
::Encrypt the directory.
echo.
echo Exercise8
mkdir NewFolder
cipher /E NewFolder
cipher

::Exercise9
::PL
::Skompresuj katalog.
::ENG
::Compress the directory.
echo.
echo Exercise9
compact /c NewFolder
compact

::Exercise10
::PL
:: Wyświetl zawartość pliku tekstowego.
::ENG
::View the contents of a text file.
echo.
echo Exercise10
type plik.txt


::Exercise11
::PL
::Skopiuj pliki systemowe na dysk USB.
::ENG
::Copy the system files to a USB drive.
echo.
echo Exercise11
xcopy C:\Users\User\MyRepositoriesGH\Studies\OperatingSystems\Windows1 D:\ /h

::Exercise12
::PL 
::Sprawdza dysk USB i wyświetla raport o jego stanie.
::ENG
::Checks the USB drive and displays a status report.
echo.
echo Exercise12
chkdsk C: /f /r

::Exercise13 
::PL
::Zaszyfruj pliki na dysku USB.
::ENG
::Encrypt files on the USB drive.
echo.
echo Exercise13
cipher /e d:/plik.txt 
cipher

::Exercise14
::PL
::Odszyfruj katalog.
::ENG
::Decrypt directory.
echo.
echo Exercise14
cipher /d Newfolder
cipher

::Exercise15
::PL
::Sformatuj dysk USB.
::ENG
::Format the USB drive.
echo.
echo Exercise15
format d:

::Exercise16 
::PL
::Użyj polecenia cmd potem EXIT.
::ENG
::Use the command cmd, followed by EXIT.
echo.
echo Exercise16
cmd
exit

::Exercise17 
::PL
::Użyj polecenia cls potem EXIT.
::ENG
::Use the command cls, followed by EXIT.
echo.
echo Exercise17
cls
exit
