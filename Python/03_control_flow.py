# If/Else Statements, For Loops, While Loops, and Loop Control

# 1. Conditional Execution (if, elif, else)
score = 85

if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"

print(f"Score: {score} | Grade: {grade}")
print("-" * 40)

# 2. For Loop (Iterating over a range)
print("Counting with range():")
for i in range(1, 6):
    print(f"Step {i}")

print("-" * 40)

# 3. While Loop with break and continue
print("While loop demonstrating break and continue:")
count = 0

while count < 10:
    count += 1
    if count == 3:
        continue  # Skip printing 3
    if count == 6:
        break     # Stop loop entirely when reaching 6
    print(f"Count: {count}")
