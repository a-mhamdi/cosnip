#!/bin/bash

# Conditionals and Testing: If/else statements, test operators, and comparisons

echo "=== File and Directory Tests ==="
# Check if a file exists
filename="03_conditionals_and_testing.sh"
if [ -f "$filename" ]; then
    echo "✓ File '$filename' exists"
else
    echo "✗ File '$filename' does not exist"
fi

# Check if a directory exists
dirname="/tmp"
if [ -d "$dirname" ]; then
    echo "✓ Directory '$dirname' exists"
else
    echo "✗ Directory '$dirname' does not exist"
fi

# Other file tests: -r (readable), -w (writable), -x (executable), -s (non-empty)
echo ""

echo "=== Numeric Comparisons ==="
# Numeric operators: -eq (equal), -ne (not equal), -gt (greater than) -lt (less than), -ge (greater or equal), -le (less or equal)
age=18
if [ $age -ge 18 ]; then
    echo "You are $age years old - You can vote!"
else
    echo "You are $age years old - Too young to vote"
fi

score=75
if [ $score -ge 90 ]; then
    echo "Grade: A"
elif [ $score -ge 80 ]; then
    echo "Grade: B"
elif [ $score -ge 70 ]; then
    echo "Grade: C"
elif [ $score -ge 60 ]; then
    echo "Grade: D"
else
    echo "Grade: F"
fi
echo ""

echo "=== String Comparisons ==="
str1="hello"
str2="world"
str3=""

if [ "$str1" = "$str2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi

if [ -z "$str3" ]; then
    echo "String is empty (zero length)"
fi

if [ -n "$str1" ]; then
    echo "String is not empty (has length > 0)"
fi
echo ""

echo "=== Logical Operators ==="
# AND (-a or &&), OR (-o or ||)
age=25
has_license=true

if [ $age -ge 18 ] && [ "$has_license" = true ]; then
    echo "You can drive a car"
else
    echo "You cannot drive a car"
fi

# Using double brackets [[ ]] (more powerful, allows regex)
name="Mohammed"
if [[ $name == M* ]]; then
    echo "Name starts with 'M'"
fi

# Case statement (alternative to multiple if/elif)
echo "=== Case Statement ==="
echo "Choose an option: (1) Start (2) Stop (3) Restart"
read choice

case $choice in
    1|start|Start)
        echo "Starting service..."
        ;;
    2|stop|Stop)
        echo "Stopping service..."
        ;;
    3|restart|Restart)
        echo "Restarting service..."
        ;;
    *)
        echo "Invalid option"
        ;;
esac
