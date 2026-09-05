# From Basics to Advanced Concurrency

A structured, ready-to-run code collection designed for teaching Python programming from fundamental syntax to advanced concurrent programming.

## Course Outline

### Phase 1: Procedural Foundations & Core Data
* **`01_print_basics.py`** — Standard output, string formatting, separators, and f-strings.
* **`02_variables_and_types.py`** — Dynamic typing, built-in types, type casting, and input handling.
* **`03_control_flow.py`** — Conditional branching (`if`/`elif`/`else`), loops (`for`/`while`), `break`, and `continue`.
* **`04_functions.py`** — Function definitions, default parameters, variable-length positional (`*args`) and keyword arguments (`**kwargs`).
* **`05_data_structures.py`** — Core collections: lists, tuples, sets, and dictionaries (mutability, indexing, unique sets, key-value lookups).
* **`06_functional_tools.py`** — Functional programming primitives: `map()`, `filter()`, `reduce()`, and lambda expressions.

### Phase 2: Object-Oriented Foundations & Language Protocols
* **`07_oop_basics.py`** — Object-Oriented Programming: classes, attributes, encapsulation (`_protected`/`__private`), inheritance (`super()`), and method overriding (polymorphism).
* **`08_iterators_and_iterables.py`** — The Iterator Protocol: `iter()`, `next()`, `StopIteration`, and creating custom iterator classes using `__iter__` and `__next__`.
* **`09_generators.py`** — Lazy evaluation with `yield` and generator expressions vs. memory-intensive list comprehensions.
* **`10_decorators.py`** — Higher-order functions, function wrappers, `@functools.wraps`, and applying decorator syntax `@`.
* **`11_context_managers.py`** — Resource management via `with`: class-based (`__enter__`/`__exit__`) and generator-based (`@contextlib.contextmanager`) approaches.

### Phase 3: Advanced Concurrency
* **`12_multithreading.py`** — Concurrent execution for **I/O-bound** tasks using `concurrent.futures.ThreadPoolExecutor`.
* **`13_multiprocessing.py`** — Parallel execution for **CPU-bound** tasks bypassing the Python GIL using `concurrent.futures.ProcessPoolExecutor`.
* **`14_asyncio.py`** — Single-threaded asynchronous cooperative multitasking using `async`/`await` and `asyncio.gather()`.
