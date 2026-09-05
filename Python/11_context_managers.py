# Resource Management, contextlib and __enter__/__exit__

from contextlib import contextmanager
import time

# 1. Generator-Based Context Manager (using contextlib)
@contextmanager
def timer(label):
    """Measures execution time of a block of code."""
    start = time.perf_counter()
    print(f"[Timer] Starting block: '{label}'")
    try:
        yield
    finally:
        elapsed = time.perf_counter() - start
        print(f"[Timer] Finished '{label}' in {elapsed:.4f} seconds")


# Using Generator-based Context Manager
with timer("Heavy Loop Simulation"):
    total = sum(i ** 2 for i in range(500_000))
    print(f"Calculated sum: {total}")


# 2. Class-Based Context Manager
class ManagedFile:
    """Safely opens and automatically closes a file."""
    def __init__(self, filename, mode):
        self.filename = filename
        self.mode = mode
        self.file = None

    def __enter__(self):
        print(f"[Class] Opening file: {self.filename}")
        self.file = open(self.filename, self.mode)
        return self.file

    def __exit__(self, exc_type, exc_val, exc_tb):
        if self.file:
            print(f"[Class] Closing file: {self.filename}")
            self.file.close()
        # Returning True suppresses exceptions if needed; False propagates them
        return False


# Using Class-based Context Manager
with ManagedFile("demo.txt", "w") as f:
    f.write("Teaching Python context managers!")
