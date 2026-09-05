# Single-Threaded Asynchronous I/O Co-routines with asyncio

import asyncio
import time

# 1. Define an asynchronous coroutine using 'async def'
async def fetch_api_data(endpoint_id: int, delay: float) -> dict:
    print(f"[Async-Start] Requesting Endpoint {endpoint_id}...")

    # Non-blocking pause: yields control back to the event loop
    await asyncio.sleep(delay)

    print(f"[Async-Done] Received Response from Endpoint {endpoint_id}.")
    return {"id": endpoint_id, "status": 200, "data": f"Payload_{endpoint_id}"}


async def main():
    print("--- Starting Async Tasks concurrently on Event Loop ---")
    start_time = time.perf_counter()

    # Define tasks with varying simulated delays
    tasks = [
        fetch_api_data(endpoint_id=1, delay=2.0),
        fetch_api_data(endpoint_id=2, delay=1.0),
        fetch_api_data(endpoint_id=3, delay=1.5),
    ]

    # asyncio.gather runs all coroutines concurrently on a single thread
    results = await asyncio.gather(*tasks)

    elapsed = time.perf_counter() - start_time
    print(f"\nAll API calls completed in {elapsed:.2f} seconds")
    print(f"Results: {results}")


if __name__ == "__main__":
    # Standard entry point to start the asyncio Event Loop
    asyncio.run(main())
