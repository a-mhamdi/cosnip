# Understanding __iter__(), __next__(), and Custom Iterators

# 1. Iterable vs. Iterator on built-in types
numbers = [10, 20, 30]

# Obtain an iterator from the iterable list using iter()
num_iterator = iter(numbers)

print("Fetching elements manually with next():")
print(next(num_iterator))  # 10
print(next(num_iterator))  # 20
print(next(num_iterator))  # 30

# Reaching the end raises StopIteration
try:
    print(next(num_iterator))
except StopIteration:
    print("Caught StopIteration: No more items left to yield.")

print("-" * 50)

# 2. Creating a Custom Iterator Class
class CountDown:
    """An iterable/iterator object that counts down from a start value to 1."""
    def __init__(self, start_value):
        self.current = start_value

    def __iter__(self):
        # An iterator must return itself
        return self

    def __next__(self):
        if self.current <= 0:
            raise StopIteration
        val = self.current
        self.current -= 1
        return val

# Using the custom iterator directly in a standard Python for-loop
print("Custom CountDown Iterator in action:")
for count in CountDown(5):
    print(f"Countdown: {count}")
