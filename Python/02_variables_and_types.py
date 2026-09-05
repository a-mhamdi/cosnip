# Variable Assignment, Dynamic Typing, Basic Types, and User Input

# 1. Variable assignment and core data types
course_code = "ROS 2"         # str (string)
enrolled_students = 25        # int (integer)
pass_rate = 0.92              # float (floating-point number)
is_active = True              # bool (boolean)

# Displaying types using the built-in type() function
print(f"course_code: {course_code} -> Type: {type(course_code).__name__}")
print(f"enrolled_students: {enrolled_students} -> Type: {type(enrolled_students).__name__}")
print(f"pass_rate: {pass_rate} -> Type: {type(pass_rate).__name__}")
print(f"is_active: {is_active} -> Type: {type(is_active).__name__}")

print("-" * 40)

# 2. Type casting (conversion)
raw_input_val = "15"                # Currently a string
converted_val = int(raw_input_val)  # Converted to integer
print(f"Original + 5 (string concatenation): {raw_input_val + '5'}")
print(f"Converted + 5 (numeric addition):   {converted_val + 5}")

print("-" * 40)

# 3. Reading interactive input
user_name = input("Enter your name: ")
print(f"Welcome to the class, {user_name}!")
