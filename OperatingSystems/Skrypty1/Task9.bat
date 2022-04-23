 ::Zadanie 9.
::Przetestować powyższy kod podając różne zestawy argumentów do skryptu.
echo Task9
@echo off
echo Argument 1: %1
echo Argument 2: %2
echo Nazwa skryptu: %0
echo Argumenty: %*
shift
echo Argument 1 po shift: %1
