# Standard Output, Formatting, and Separators

# 1. Basic string output
print("Hello, Python!")

# 2. Printing multiple items with custom separators and end characters
print("Python", "is", "awesome", sep=" - ")
print("First line", end=" ---> ")
print("Second line on the same row!")

# 3. String formatting with F-Strings (Python 3.6+)
name = "Omar"
role = "CEO"
experience_years = 10

print(f"Instructor: {name} | Role: {role} | Experience: {experience_years} years")

# 4. Basic expression evaluation inside f-strings
a = 5
b = 3
print(f"Sum of {a} and {b} is {a + b}")
