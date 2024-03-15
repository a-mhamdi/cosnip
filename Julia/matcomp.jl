# Define two example matrices
A = [1 2 3; 4 5 6; 7 8 9]
B = [9 8 7; 6 5 4; 3 2 1]

# Matrix addition
C = A + B
println("Matrix Addition (A + B):")
println(C)

# Matrix subtraction
D = A - B
println("Matrix Subtraction (A - B):")
println(D)

# Matrix multiplication
E = A * B
println("Matrix Multiplication (A * B):")
println(E)

# Scalar multiplication
scalar = 2
F = scalar * A
println("Scalar Multiplication (scalar * A):")
println(F)

# Matrix transposition
G = A'
println("Matrix Transposition (A'):")
println(G)

# Matrix inversion
H = inv(A)
println("Matrix Inversion (inv(A)):")
println(H)
