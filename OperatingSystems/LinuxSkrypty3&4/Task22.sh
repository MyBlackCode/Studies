#Task22
#Napisz funkcję zwracającą minimum z dwóch podanych parametrów
function minimum
{
	if [ $1 -lt $2 ]; then
		let c=$1
	else 
		let c=$2
	fi
	return $c
}

minimum 21 4
echo $c
