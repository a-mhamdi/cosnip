function is_prime(n::Integer)
    if n <= 1
        return false
    end
    
    for i in 2:isqrt(n)
        if n % i == 0
            return false
        end
    end
    
    return true
end

# Usage case 1
number = 17
result = is_prime(number)
println("$number is prime? $result")

# Usage case 2
seq = 1:100
primes = filter(is_prime, seq)
println("The prime numbers between 1 and 100 are: $primes")