#This script reads a number (argument) and outputs the sum 
#and the average of its digits.
#Argument must be a positive integer.
#
#eg. ./3.sh 1234
#output: Sum:10 & Avg:2.50


#Argument checking

if [ $# != 1 ]
then
	echo "Incorrect number of parameters."
	echo "Usage: $0 [Number]"
	exit
fi

if [ $1 -lt 0 ]
then
	echo "Please enter a positive value."
	exit
fi


dig=0

sum=0

num=$1

i=0


#Separate the digits and find the sum of all
while [ $num -gt 0 ]
do
	dig=$(( $num % 10 ))
	num=$(( $num / 10 ))
	sum=$(( $sum + $dig ))
	i=$(( $i + 1 ))
done

#Calculate the average of digits
avg=$(echo "scale=2;$sum / $i"|bc )

echo "Sum of all digits is $sum"
echo "Average of these digits is $avg"










	
	
	
