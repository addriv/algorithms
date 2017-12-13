# Find which substring is ordered from smallest
# Replace the next letter with smallest letter
# sort the remaining
def bigger_is_greater(str)
  transformed = str.dup

  i = -2
  while i > -transformed.length
    break if transformed[i..-1] < transformed[i..-1].reverse
    i -= 1
  end
  left = transformed.split("")
            .take(i)
  right = transformed.split("")
             .drop(i)
             .sort

  right.each_with_index do |ch,idx|
    next if ch == str[i]
    if ch > str[i]
      right[0], right[idx] = right[idx], right[0] 
      break
    end
  end

  left + right

  # str[i], str[i + 1] = str[i + 1], str[i]
  # str
end