#This script gets 1 or 2 arguments to delete a file or directory.
#Argument 1 will be the name of the file or the name of a directory  
# at the working directory.
#If Argument 2 also given, this will be the new working directory for
# the same operation.
#
#eg1. ./6.sh "tempfile.txt" "/tmp"
#output: (tempfile.txt) have been successfully removed from (/tmp)


#Argument checking

if [ $# = 1 ]
then
	fr=$1
	if [ -f $fr ]
	#remove the file or directory if it exists
	then rm $fr
	else echo "$fr file or directory does not exist."
	fi

elif [ $# = 2 ]
then
	#Change the current directory
	TOCHANGE=$2
	cd $TOCHANGE
	fr=$1
	if [ -f $fr ]
	then 
		#remove the file or directory if it exists
		rm $fr
		echo "($1) have been successfully removed from ($2)"
	else 
		echo "$fr file or directory does not exist."
	fi

else
	echo "Incorrect number of arguments."
	echo "eg. $0 [file or directory to remove]"
	echo "OR"
	echo "$0 [new working directory] [file or directory to remove]"
fi
