# Parallel CPU-Bound Computation Bypassing the GIL

import time
from concurrent.futures import ProcessPoolExecutor

# 1. CPU-bound task (heavy computation)
def compute_factorial_sum(n: int) -> int:
    """Calculates sum of numbers up to n (CPU intensive)."""
    return sum(i * i for i in range(n))


def main():
    tasks = [15_000_000] * 4

    # Sequential Execution
    print("--- Starting Sequential CPU Tasks ---")
    start_seq = time.perf_counter()
    [compute_factorial_sum(t) for t in tasks]
    elapsed_seq = time.perf_counter() - start_seq
    print(f"Sequential Time: {elapsed_seq:.2f} seconds\n")

    # Parallel Execution (Multiprocessing)
    print("--- Starting Multiprocessing (ProcessPoolExecutor) ---")
    start_mp = time.perf_counter()

    # ProcessPoolExecutor creates separate Python interpreter processes
    with ProcessPoolExecutor() as executor:
        list(executor.map(compute_factorial_sum, tasks))

    elapsed_mp = time.perf_counter() - start_mp

    print(f"Multiprocessing Time: {elapsed_mp:.2f} seconds")
    print(f"Speedup: {elapsed_seq / elapsed_mp:.2f}x faster")


if __name__ == "__main__":
    # Standard entry point required for multiprocessing on Windows/macOS
    main()
