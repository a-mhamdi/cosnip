#!/bin/bash

# Loops and Iteration: for, while, until loops and loop control

echo "=== FOR Loop: Iterating over a list ==="
# Loop over a list of items
for color in red green blue yellow purple; do
    echo "Color: $color"
done
echo ""

echo "=== FOR Loop: Range of numbers ==="
# Range using {start..end}
for i in {1..5}; do
    echo "Count: $i"
done
echo ""

echo "=== FOR Loop: With step ==="
# Range with step {start..end..step}
for i in {0..20..5}; do
    echo "Multiples of 5: $i"
done
echo ""

echo "=== FOR Loop: Files in directory ==="
# Loop through files
echo "Files ending with .sh:"
for file in *.sh; do
    if [ -f "$file" ]; then
        echo "  - $file ($(wc -l < "$file") lines)"
    fi
done
echo ""

echo "=== FOR Loop: C-style ==="
# C-style for loop
for ((i=1; i<=5; i++)); do
    echo "Iteration $i"
done
echo ""

echo "=== WHILE Loop: Reading file line by line ==="
# Create a temporary file
echo "line 1" > /tmp/test.txt
echo "line 2" >> /tmp/test.txt
echo "line 3" >> /tmp/test.txt

echo "Contents of /tmp/test.txt:"
while IFS= read -r line; do
    echo "  > $line"
done < /tmp/test.txt
echo ""

echo "=== WHILE Loop: Count down ==="
counter=5
while [ $counter -gt 0 ]; do
    echo "Countdown: $counter"
    ((counter--))
    sleep 0.5  # Wait half a second
done
echo ""

echo "=== UNTIL Loop: Run until condition is true ==="
num=1
until [ $num -gt 5 ]; do
    echo "Until loop: $num"
    ((num++))
done
echo ""

echo "=== Loop Control: break and continue ==="
# break - exit loop early
echo "Break example (stop at 3):"
for i in {1..10}; do
    if [ $i -eq 3 ]; then
        echo "  Breaking at $i"
        break
    fi
    echo "  Number: $i"
done
echo ""

# continue - skip current iteration
echo "Continue example (skip even numbers):"
for i in {1..10}; do
    if [ $((i % 2)) -eq 0 ]; then
        continue
    fi
    echo "  Odd number: $i"
done
echo ""

echo "=== Nested Loops: Multiplication table ==="
echo "  1 2 3 4 5"
echo "  ---------"
for row in {1..5}; do
    echo -n "$row "
    for col in {1..5}; do
        printf "%2d " $((row * col))
    done
    echo ""
done
