#!/bin/bash

# Variables and User Input: Demonstrating different types of variables and reading from user

# System variables (already set by system)
echo "=== System Variables ==="
echo "Your home directory: $HOME"
echo "Your username: $USER"
echo "Current shell: $SHELL"
echo ""

# User-defined variables
echo "=== User Variables ==="
name="Ali"                     # String
age=25                         # Integer (Bash treats as string but can do math)
height=1.76                    # Float (Bash handles as string)
is_student=true                # Boolean (just a string)

echo "Name: $name"
echo "Age: $age"
echo "Height: $height"
echo "Is student: $is_student"
echo ""

# Reading input from user
echo "=== User Input ==="
echo "What's your favorite programming language?"
read language
echo "Nice! $language is a great choice!"

echo "Enter two numbers to add:"
read num1 num2
sum=$((num1 + num2))
echo "Sum: $num1 + $num2 = $sum"
echo ""

# Command substitution
echo "=== Command Substitution ==="
current_date=$(date +"%A, %B %d, %Y")
echo "Today is: $current_date"

files_count=$(ls -1 | wc -l)
echo "You have $files_count files in this directory"
echo ""

# Exporting variables (making them available to child processes)
export GREETING="Hello from bash!"
echo "GREETING variable exported: $GREETING"
echo "You can check it in sub-shell: bash -c 'echo \$GREETING'"
