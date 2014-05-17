#This script reads a decimal and outputs its hexadecimal equivalent.
#Argument must be a positive integer to convert.
#
#eg. ./4.sh 4095
#output: FFF


#Argument checking

if [ $# != 1 ]
then
	echo "Incorrect number of parameters."
	echo "Usage: $0 [Number]"
	exit
fi

if [ $1 -lt 0 ]
then
	echo "Please enter a value not less than 0."
	exit
fi


n=$1

x=""

#Calculate the hexadecimal number
x=$(printf "%X\n" $n)

echo "hex : $x"
