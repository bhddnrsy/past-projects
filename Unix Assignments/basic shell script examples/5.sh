#This script gets two files as argument and swap them if both of them exists.
#Both arguments should be quoted to avoid issues.
#
#eg. ./5.sh "src.txt" "des.txt"
#output: The files src.txt and des.txt have been successfully swapped.


#Argument checking

if [ $# != 2 ]
then
	echo "Incorrect number of parameters."
	echo "Usage: $0 "file1.txt" "file2.txt""
	exit
fi

if ! [ -f $1 ]
then 
	echo "$1 does not exist."

elif ! [ -f $2 ]
then 
	echo "$2 does not exist."

else
	#Create a temporary file and use it for swapping
	TEMP=/tmp/tempfile

	#Swapping operation
	cat "$2" > "$TEMP" &&
	cat "$1" > "$2" &&
	cat "$TEMP" > "$1" &&
	echo "The files $1 and $2 have been successfully swapped."

fi

