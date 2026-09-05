# Functions as First-Class Objects, Wrapper Functions, and Decorators

import time
from functools import wraps

# 1. Defining a Decorator Function
def execution_timer(func):
    """Decorator that measures and prints execution time of a function."""
    @wraps(func)  # Preserves original function name and docstring
    def wrapper(*args, **kwargs):
        start_time = time.perf_counter()
        result = func(*args, **kwargs)
        elapsed_time = time.perf_counter() - start_time
        print(f"[{func.__name__}] Executed in {elapsed_time:.6f} seconds")
        return result
    return wrapper


# 2. Applying the Decorator using @ syntax
@execution_timer
def compute_squares(n):
    """Calculates the sum of squares up to n."""
    return sum(i * i for i in range(n))


@execution_timer
def simulate_delay(seconds):
    """Simulates a slow network or I/O operation."""
    time.sleep(seconds)
    return "Data loaded"


# 3. Running Decorated Functions
print("--- Test 1: Computation ---")
total = compute_squares(1_000_000)
print(f"Result: {total}")

print("\n--- Test 2: Simulated I/O Delay ---")
status = simulate_delay(0.5)
print(f"Status: {status}")
