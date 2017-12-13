# Find which substring is ordered from smallest
# Replace the next letter with smallest letter
# sort the remaining
def bigger_is_greater(str)
  transformed = str.dup

  i = -1
  while i > -transformed.length
    break if transformed[i..-1] < transformed[i..-1].reverse
    i -= 1
  end
  
  i += str.length
  
  left = transformed.split("")
                    .take(i)
  
  right = transformed.split("")
                     .drop(i)
                     .sort  

  right.each_with_index do |ch,idx|
    next if ch == str[i]
    if ch > str[i]
      right.delete(ch)
      right.unshift(ch)
      #right[0], right[idx] = right[idx], right[0] 
      break
    end
  end

  new_str = left.join + right.join
  
  if new_str == str
    "no answer"
  else
    new_str
  end
   
  # str[i], str[i + 1] = str[i + 1], str[i]
  # str
end