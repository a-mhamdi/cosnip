# Concurrent I/O-Bound Operations using ThreadPoolExecutor

import time
from concurrent.futures import ThreadPoolExecutor

# 1. Simulate I/O-bound task (e.g., downloading data, database/file access)
def fetch_data(sensor_id: int) -> str:
    print(f"[Thread-Start] Reading Sensor {sensor_id}...")
    time.sleep(1)  # Simulates waiting for network/hardware I/O response
    print(f"[Thread-Done] Sensor {sensor_id} complete.")
    return f"Sensor-{sensor_id}-Data: 23.5 C"


sensor_ids = [101, 102, 103, 104, 105]

# Sequential Execution
print("--- Starting Sequential Execution ---")
start_seq = time.perf_counter()

seq_results = [fetch_data(sid) for sid in sensor_ids]

elapsed_seq = time.perf_counter() - start_seq
print(f"Sequential Execution Time: {elapsed_seq:.2f} seconds\n")


# Concurrent Execution (Multithreaded)
print("--- Starting Concurrent Execution (ThreadPoolExecutor) ---")
start_threads = time.perf_counter()

# Use ThreadPoolExecutor to run tasks in parallel workers
with ThreadPoolExecutor(max_workers=5) as executor:
    # map() distributes the iterable across the worker threads
    thread_results = list(executor.map(fetch_data, sensor_ids))

elapsed_threads = time.perf_counter() - start_threads

print("\n--- Summary ---")
print(f"Threaded Execution Time: {elapsed_threads:.2f} seconds")
print(f"Results collected: {thread_results}")
