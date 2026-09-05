# Defining Functions, Default Parameters, *args, **kwargs, and Return Values

# 1. Basic function with parameters and return value
def calculate_final_grade(exam_score, assignment_score, weight: float = 0.6):
    """Calculates weighted grade (default 60% exam, 40% assignments)."""
    return (exam_score * weight) + (assignment_score * (1.0 - weight))

score1 = calculate_final_grade(85, 90)               # Using default weight
score2 = calculate_final_grade(85, 90, weight=0.7)   # Overriding default weight
print(f"Default Weighting Grade:  {score1:.2f}")
print(f"Custom Weighting Grade:   {score2:.2f}")

print("-" * 40)

# 2. Variable-length positional arguments (*args)
def sum_all(*numbers):
    """Accepts any number of numeric arguments and returns their sum."""
    total = 0
    for num in numbers:
        total += num
    return total

print(f"Sum of 3 numbers: {sum_all(10, 20, 30)}")
print(f"Sum of 5 numbers: {sum_all(1, 2, 3, 4, 5)}")

print("-" * 40)

# 3. Variable-length keyword arguments (**kwargs)
def print_student_profile(**attributes):
    """Accepts arbitrary key-value pairs representing student attributes."""
    for key, value in attributes.items():
        print(f"  {key.capitalize()}: {value}")

print("Student Details:")
print_student_profile(name="Sarah", ID=10293, major="Robotics", Score=17.8)
