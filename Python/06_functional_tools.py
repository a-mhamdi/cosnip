# Processing Collections with High-Order Functions and Lambdas

# Sample dataset: Student exam scores out of 100
raw_scores = [45, 62, 78, 85, 90, 33, 95]

# 1. map(): Apply a transformation function to every item
# Goal: Scale scores by applying a 5% curve (multiply by 1.05)
scaled_scores = list(map(lambda score: min(100, round(score * 1.05, 1)), raw_scores))

print(f"Original Scores: {raw_scores}")
print(f"Scaled Scores:   {scaled_scores}")

print("-" * 50)

# 2. filter(): Retain items that satisfy a boolean condition
# Goal: Extract passing scores (score >= 60)
passing_scores = list(filter(lambda score: score >= 60, scaled_scores))

print(f"Passing Scores:  {passing_scores}")

print("-" * 50)

# 3. reduce(): Aggregate a collection into a single value
from functools import reduce  # IT IS RECOMMENDED TO PUT THIS LINE AT THE TOP ACCORDING TO PEP 8

# Goal: Calculate total points earned across all passing scores
total_passing_points = reduce(lambda acc, val: acc + val, passing_scores, 0)
average_passing = total_passing_points / len(passing_scores) if passing_scores else 0

print(f"Total Passing Points: {total_passing_points:.1f}")
print(f"Average Passing Score: {average_passing:.1f}")
