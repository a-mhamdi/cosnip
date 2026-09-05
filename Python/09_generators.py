# Memory-Efficient Iteration with yield and Generator Expressions

import sys

# 1. Generator Function using 'yield'
def countdown(start):
    """Yields numbers counting down to 1 without storing them in memory."""
    current = start
    while current > 0:
        yield current
        current -= 1

print("Using Generator Function:")
for number in countdown(3):
    print(f"Count: {number}")

print("-" * 50)

# 2. Memory Comparison: List Comprehension vs Generator Expression
n = 1_000_000

# List comprehension creates the entire list in RAM immediately
list_comp = [x * 2 for x in range(n)]

# Generator expression creates values on-the-fly as requested
gen_exp = (x * 2 for x in range(n))

print(f"Memory size of List (1M items): {sys.getsizeof(list_comp):,} bytes")
print(f"Memory size of Generator Object:  {sys.getsizeof(gen_exp):,} bytes")

# Fetching first few items from the generator expression
print("First 3 items from Generator Expression:")
print(next(gen_exp))  # 0
print(next(gen_exp))  # 2
print(next(gen_exp))  # 4
