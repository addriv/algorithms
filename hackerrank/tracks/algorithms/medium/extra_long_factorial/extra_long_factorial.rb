# Given an integer N, print the factorial of this number.
# 1. Recursion
# 2. Iteration

# 4mins
def extra_long_factorial(n)
  return n if n <= 1
  n * extra_long_factorial(n - 1)
end

