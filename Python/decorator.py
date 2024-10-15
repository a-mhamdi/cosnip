# Decorator function
def greeting_decorator(func):
    def wrapper():
        print("Before calling the function")
        func()
        print("After calling the function")
    return wrapper

# Decorating the greet function
@greeting_decorator
def greet():
    print("Hello, World!")

# Calling the decorated function
greet()
