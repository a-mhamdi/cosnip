#! /bin/bash
#============================================================#
echo "This is present working directory $(pwd)" # $PWD
#============================================================#
echo $(seq 5)
#============================================================#
NAME="1 2 3 4 5 6" # It's preferable to put variable names in UPPERCASE
#============================================================#
for i in ${NAME} 
do
    echo $i
done
#============================================================#
VAL=0
while [ $VAL -le 3 ]
do
    if test $VAL -lt 2
    then
        NT="time"
    else
        NT="times"
    fi
    echo "Welcome $VAL $NT"
    VAL=$((VAL+1))
done
#============================================================#
read -p "Enter PWD " PWD # If `ZSH`, run `$ man zshbuiltins`

if test ${PWD} = "Me"
then
    echo "Access Granted"
else
    echo "Access Denied"
fi
#============================================================#
# Wait for an user input.
read -p "Enter your name: " LASTNAME
echo "Hello $LASTNAME, nice to meet you!"

# Simple IF statement
if [ "$LASTNAME" == "BEN MOHAMED" ]
then
    echo "Your last name is BEN MOHAMED"
elif [ "$LASTNAME" == "KAHLAOUI" ]
then
    echo "Your last name is KAHLAOUI"
else
    echo "Your name is not BEN MOHAMED, nor KAHLAOUI"
fi
#================================== COMPARISON ==================================#

##########################
# -eq -ne -gt -ge -l -le #
##########################

NUM1=31
NUM2=50

if test $NUM1 -gt $NUM2
then
    echo "$NUM1 > $NUM2"
else
    echo "$NUM1 <= $NUM2"
fi
#============================================================#
## FILE CONDITIONS
read -p "Enter the file name you are looking for: " FILE
# FILE="test.txt"

if test -e $FILE # [ -e $FILE ]
then
    echo "File $FILE exists"
else
    echo "File $FILE does not exist"
fi
## CHECK IF A DIR EXISTS
read -p "Enter the dir name you are looking for: " DIR

if [ -d $DIR ]
then
    echo "Directrory '$DIR' exists"
else
    echo "Directory '$DIR' does not exist"
fi
#===========================================================#
## CASE STATEMENT
read -p "Are you 21 or over? S[kip]/y[es]/n[o] " ANS
case $ANS in
    [yY] | [yY][eE][sS])
        echo "Your are over 21 years!"
        ;;
    [nN] | [nN][oO])
        echo "You are below 21 years!"
        ;;
    *)
        echo "Skip..."
        ;;
esac

## SIMPLE FOR LOOP
NAMES="Ahmed Mohamed Hamed Hamdi"
for NAME in $NAMES
do
    echo "Hello $NAME"
done

# FOR LOOP TO RENAME FILES
touch file{1..9}.file
FILES=$(ls *.file)
NEW="new"
for FILE in $FILES
do
    echo "RENAMING $FILE to new-$FILE"
    mv $FILE new-$FILE
done

# CREATE FOLDER & WRITE TO A FILE
mkdir myTest
MYFILE="myTest/text"
touch $MYFILE
echo "1111111" > $MYFILE # WRITE
echo "2222222" >> $MYFILE # APPEND
echo "3333333" >> $MYFILE # APPEND

# WHILE LOOP - READ THROUGH A FILE LINE BY LINE
LINE=1
while read -r C_LINE
do
    echo "$LINE: $C_LINE"
    ((LINE++))
done < $MYFILE

# FUNCTION WITH ARGS
function Foo(){
    echo "I saw $# arguments" 
    echo "Hello $1 and $2. Are you $3"
}

Foo "Ahmed" "Aymen" 38

echo $HOME

# Grab the output of a command and make it more readable
echo "The value of the pwd command is $(pwd)$"  # $PWD

# Assign the command's output to some variable
OUTPUT=$(ls)
echo "The value of the output variable is"
echo ${OUTPUT}

#============================================================#
# Check if a file exists
if [ -f 1.a ] # `1.a` is the name of the file
then 
    echo "File exists"
else
    echo "File does not exist"
fi
#============================================================#
ls -ial | tee logfile.txt

#============================================================#
loginctl terminate-user $USER # logout
#============================================================#
