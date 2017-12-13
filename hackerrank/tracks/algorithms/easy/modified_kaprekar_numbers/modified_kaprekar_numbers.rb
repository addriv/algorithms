# Given a range from p to q(inclusive), print all modified kaprekar numbers in a line
# A modified kaprekar number is a positive whole numver such that when we split 
# its square in half, the left and right side add up to the number
# If there are odd number of digits, the right side will be the longer half
# Print "INVALID RANGE" if no modified kaprekar numbers exist between given range

# Steps
# 1. Create helper method  
#   - Convert square to a string to allow for splitting
#   - Check if each half adds to number
# 2. Create main method to take in the range
#   - Iterate through each number within the range and check for modified kaprekar
#   - Print out joined numbers
#   - Print "INVALID RANGE" if no modified kaprekar numbers exist

def modified_kaprekars(p,q)
  # Assign new array
  modified_kaprekars = []

  # Iterate through the range and check for modified kaprekar numbers
  (p..q).each do |n|
    modified_kaprekars << n if is_modified_kaprekar?(n)
  end
  
  # Print invalid if no kaprekars found, else print kaprekars in a line
  if modified_kaprekars.empty?
    "INVALID RANGE"
  else
    modified_kaprekars.join(" ")
  end
end

def is_modified_kaprekar?(n)
  # Get square and convert to string
  square = (n**2).to_s

  # Find middle point of square
  mid = square.length / 2

  # Split to two halves with right side having longer digits
  left = square[0...mid]
  right = square[mid..-1]

  # Check if each half sums to n
  if left.to_i + right.to_i == n
    true
  else
    false
  end
end

