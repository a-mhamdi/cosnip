# Vectors
# -------

# Logical
vtr1 = c(TRUE, FALSE)
class(vtr1)

# Numeric
vtr2 <- c(15, 5.674895, 99999999, 0.00000000000000005)
class(vtr2)

# Integer
c(5L, 7L, -8L) -> vtr3
class(vtr3)

# Mixture of Datatypes
vtr5 <- c(TRUE, 35L, 3.14)
vtr6 <- c(TRUE, "Text", -8L, 5.000007)


# Matrix
# ------

mat1 = matrix(c(0.5, 1.2, 3.25, 7.3), 2, 2, TRUE)
mat2 = matrix(c(0.5, 1.2, 3.25, 7.3), 2, 2, FALSE)


# Array
# -----

ary1 = array(c(1, 2, 0.3, 5.5, -5, -7, 8, 8), dim <- c(2, 2, 2))
ary2 <- array(c(0:15), dim = c(4, 4, 4))


# List
# ----

lst1 <- list(ary1, vtr2, vtr3)


# Data Frame
# ----------
vtr1 <- c(1:2)
vtr2 <- c("a", "b")
vtr3 <- c(15.2, -5.0004)

x = data.frame(vtr1, vtr2, vtr3)

data.frame(airquality)

# Operations
# ----------

print(6/6.9)
print(6%%3) # Modulus
print(2^7)
print(22%/%7) # Floor Division
print(floor(-3.14))
print(round(4.5))

var <- 25>=2


# Logical Operators
# -----------------

TRUE & TRUE # AND
TRUE | FALSE # OR
!TRUE # Neg


# Conditional Statements
# ----------------------

if (1>2){
  print("Hi")
} else if (0>2){
  print("Hello")
} else {
  print("Salem")
}


# Switch Case Statement
# ---------------------

xyzt = '7'

switch(xyzt,
  '1' = print("1"),
  '2' = print("2"),
  '3' = print("3"),
  print("Unknown")
)


# Loops
# -----

# Repeat

var1 = 5
repeat{
  print(var1)
  var1 = var1 + 1
  if (var1 > 20){
    break
  }
}

# While

while (var1 < 20){
  print(var1)
  var1 = var1 + 1
}


# For

for (i in c(1:5)){
  print(i)
}


# String

str1 <- 'Hey, R is fun'
print(str1)

str2 <- "Hey, R is fun"
print(str2)

str3 <- paste(str1, str2)
nchar(str3)
toupper(str3)
tolower(str3)
substring(str3, 3, 7)


# Functions
# ---------

fibo <- function(a){
  var1 = 0
  var2 = 1
  print(var1)
  print(var2)
  for (i in 1:a){
    var3 = var1 + var2
    print(var3)
    var1 = var2
    var2 = var3
  }
}