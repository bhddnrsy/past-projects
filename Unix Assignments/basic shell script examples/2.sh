#This script finds the reverse order of the given argument.
#Argument must be a positive integer.
#
#eg. ./2.sh 4623
#output: 3264



#Argument checking

if [ $# != 1 ]
then
	echo "Incorrect number of parameters."
	echo "Usage: $0 [Number]"
	exit
fi

if [ $1 -le 0 ]
then
	echo "Please enter a value greater than 0."
	exit
fi


dig=0

rev=""

num=$1

#Separate digits and append in reverse order
while [ $num -gt 0 ]
do
	dig=$(( $num % 10 ))
	num=$(( $num / 10 ))
	rev=$( echo ${rev}${dig} )
done

echo "Reverse order : $rev"
