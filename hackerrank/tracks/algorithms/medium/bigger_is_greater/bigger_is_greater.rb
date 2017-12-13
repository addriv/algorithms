# Find which substring is ordered from smallest

# Steps
# 1. Find the longest non-increasing suffix from the right
# 2. Identify the pivot
# 3. Find the rightmost successor
# 4. Swap successor with pivot
# 5. Reverse suffix

# Replace the next letter with smallest letter
# sort the remaining
def bigger_is_greater(str)
  return "no answer" if str.length == 2 && str.reverse == str
  
  transformed = str.dup
  i = str.length - 1
  while i > 0 && transformed[i - 1] >= transformed[i]
    i -= 1
  end

  # pivot = i - 1
  suffix = transformed[i..-1].reverse
  preffix = transformed[0...i]

  suffix.each_char.with_index do |ch,idx|
    if ch > preffix[-1]
      preffix[-1], suffix[idx] = suffix[idx], preffix[-1]
      break
    end 
  end

  preffix + suffix
end