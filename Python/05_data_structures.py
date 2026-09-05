# Built-in Data Structures — Operations, Mutability, and Common Use Cases

# 1. List: Ordered, Mutable, Allows Duplicates
grades = [85, 92, 78, 92]
grades.append(88)             # Add element
grades[0] = 90                # Modify element
print(f"List (Grades): {grades}")
print(f"First element: {grades[0]}, Count of 92: {grades.count(92)}")

print("-" * 40)

# 2. Tuple: Ordered, Immutable, Allows Duplicates
dimensions = (1920, 1080)
# dimensions[0] = 1280       # TypeError: Tuples cannot be modified
width, height = dimensions   # Unpacking
print(f"Tuple (Resolution): {dimensions}")
print(f"Unpacked: Width={width}, Height={height}")

print("-" * 40)

# 3. Set: Unordered, Unique Elements Only
topics = {"variables", "loops", "functions", "loops"}  # Duplicate 'loops' dropped
topics.add("data structures")
print(f"Set (Unique Topics): {topics}")
print(f"Is 'loops' present? {'loops' in topics}")

print("-" * 40)

# 4. Dictionary: Key-Value Pairs, Fast Lookups
student = {
    "id": 101,
    "name": "Ahmed",
    "courses": ["ROS 2", "LINEAR ALGEBRA"]
}
student["score"] = 13.9         # Add new key-value pair
student["name"] = "Sami"        # Update existing key

print(f"Dictionary (Student): {student}")
print("Keys:", list(student.keys()))
print("Values:", list(student.values()))
