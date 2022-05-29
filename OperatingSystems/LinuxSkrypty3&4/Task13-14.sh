#Task13
#Napisać skrypt sprawdzający czy podano trzy parametry skryptu, jeżeli tak to wyświetlić ich sumę. 
if [ $# -eq 3 ]
then 
	let c=$1+$2+$3
	echo $c
fi
#Task14
#Zapisać i przetestować utworzony skrypt.
