#! /bin/bash

# echo "This is present working directory $(pwd)"

# echo $(seq 5)

# NAME="1 2 3 4 5 6"

# for i in ${NAME}
# do
# 	echo $i
# done

# NAME=0
# while [ $NAME -le 5 ]
# do
#	if test $NAME -lt 2
# 	then
# 		TXT="time"
# 	else
# 		TXT="times"
# 	fi
# 	echo "Welcome $NAME $TXT"
# 	NAME=$((NAME+1))
# done

# read -p "Enter PWD " PWD
# if test ${PWD} = "Me"
# then
#	echo "Right PWD"
# else
#	echo "Access denied"
# fi

# USER INPUT
# read -p "Enter your name: " NAME
# echo "Hello $NAME, nice to meet you!"

# SIMPLE IF STATEMENT
# if [ "$NAME" == "BRAD" ]
# then
#	echo "Your name is Brad"
# elif [ "$NAME" == "Jack" ]
# then
#	echo "Your name is Jack"
# else
#	echo "Your name is not Brad, nor Jack"
# fi

# COMPARISON
# NUM1=31
# NUM2=50

# if test $NUM1 -gt $NUM2
# then
# 	echo "$NUM1 is greater than $NUM2"
# else
# 	echo "$NUM1 is less than $NUM2"
# fi
##########################
# -eq -ne -gt -ge -l -le #
##########################

# FILE CONDITIONS
# FILE="test.txt"

# if test -e $FILE
# then
# 	echo "File $FILE exists"
# else
# 	echo "File $FILE does not exist"
# fi

# read -p "Enter the file name you are looking for: " FILE

# if [ -e $FILE ]
# then
#	echo "File $FILE exists"
# else
#	echo "File $FILE does not exist"
# fi

# read -p "Enter the dir name you are looking for: " DIR

# if [ -d $DIR ]
# then
#  	echo "Directrory '$DIR' exists"
# else
#	echo "Directory '$DIR' does not exist"
# fi

# CASE STATEMENT
# read -p "Are you 21 or over? Y/N " ANS
# case "$ANS" in
#	[yY] | [yY][eE][sS])
#		echo "Your are over"
#		;;
#	[nN] | [nN][oO])
#		echo "You are below"
#		;;
#	*)
#		echo "Your age please"
#	;;
# esac

# SIMPLE FOR LOOP
# NAMES="Brad Kevin Alice Mark"
# for NAME in $NAMES
# do
# 	echo "Hello $NAME"
# done

# FOR LOOP TO RENAME FILES
# FILES=$(ls *.txt)
# NEW="new"
# for FILE in $FILES
# do
#	echo "RENAMING $FILE to new-$FILE"
#	mv $FILE new-$FILE
# done

# CREATE FOLDER & WRITE TO A FILE
# mkdir myTest
# MYFILE="myTest/text"
# touch $MYFILE
# echo "1111111" > $MYFILE
# echo "2222222" >> $MYFILE
# echo "3333333" >> $MYFILE
# WHILE LOOP - READ THROUGH A FILE LINE BY LINE
# LINE=1
# while read -r C_LINE
# do
# 	echo "$LINE: $C_LINE"
#	((LINE++))
# done < $MYFILE

# FUNCTION WITH ARGS
# function myFunc(){
#	echo "Hello $1 and $2. Are you $3"
#}

# myFunc "Ahmed" "Aymen" 38

# echo $HOME

# GRAB OUTPUT AND MAKE IT READABLE
# echo "The value of the pwd command is $(pwd)$"

# ASSIGN COMMAND OUPUT TO A VARIBALE
# OUTPUT=$(ls)
# echo "The value of the output variable is"
# echo ${OUTPUT}

# VIEW DATA ON THE COMMAND LINE
# echo "I saw $@ on the command line" # NOT WORKING!!!

# CHECK TO SEE IF A FILE EXISTS
if [ -f 1.aa ]
then 
	echo "File exit"
else
	echo "File does not exist"
fi
