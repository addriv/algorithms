# Create a brackets hash for corresponding pairs
# Iterate through the string
# If next bracket is a left bracket, queue it in the stack
# If next bracket is a right bracket, pop off stack and it must match right bracket
# Return "NO" if right bracket doesn't match
# Return "YES" at the end, meaning all brackets match
# Return "NO" if stack is not empty at the end meaning brackets didn't close 

def balanced_brackets(brackets_str)
  brackets = {
    "[" => "]",
    "(" => ")",
    "{" => "}"
  }
  
  stack = []
  
  brackets_str.each_char do |bracket|
    if brackets[bracket]
      stack.push(bracket)
    else
      return "NO" if brackets[stack.pop] != bracket
    end
  end
  
  stack.empty? ? "YES" : "NO"
end

# Parse input given through Hacker Rank
t = gets.strip.to_i
for a0 in (0..t-1)
    expression = gets.strip
end
