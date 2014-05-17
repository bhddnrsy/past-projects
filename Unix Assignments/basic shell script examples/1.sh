#This script reads a number (argument) and outputs if it is prime or not.
#Argument must be greater than 2 and less than the MAX.
#
#eg. ./1.sh 8
#output: 8 is not a prime number.


MAX=100000000


#Argument checking

if [ $# != 1 ]
then
	echo "Incorrect number of parameters."
	echo "Usage: $0 [Integer Number]"
	exit
fi

if [ $1 -lt 2 ]
then
	echo "Values less than 2 are not prime numbers."
	exit
fi

if [ $1 -gt $MAX ]
then
	echo "Max limit of value exceeded. Please enter a smaller value."
	exit
fi


num=$1

#Divide the given number until it approaches to zero

for (( i=2; i<$num; i++ ))
do
	rem=$[ $num % $i ]
	if [ $rem -eq 0 ]
	then
		echo "$num is not a prime number"
		exit
	fi
done

#If it not approaches to zero, then it is a prime number

echo "$num is a prime number"

