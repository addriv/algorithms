# Get number of queries
q = gets.chomp.to_i

# Helper method for parsing queries
def queue_stacks(str, stack)
  input = str.split.map(&:to_i)
  if input[0] == 1
    stack.push(input[1])
  elsif input[0] == 2
    stack.shift
  elsif input[0] == 3
    puts stack[0]
  end

  stack
end

stack = []

# test
q.times do
  input = gets.chomp
  stack = queue_stacks(input, stack)
end
