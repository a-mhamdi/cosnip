function fibonacci(n::Integer)
    fib = [0, 1] # Initialize the Fibonacci sequence with the first two numbers
    
    if n <= 2
        return fib[1:n]
    end
    
    while length(fib) < n
        next_fib = fib[end] + fib[end-1]  # Calculate the next Fibonacci number
        push!(fib, next_fib)  # Append the next Fibonacci number to the sequence
    end
    
    return fib
end

# Usage
n = 16 
fib_seq = fibonacci(n)
println("The first $n numbers in the Fibonacci sequence are: $fib_seq")