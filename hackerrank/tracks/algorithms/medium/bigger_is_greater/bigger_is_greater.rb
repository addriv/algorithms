# Given a word, rearrange the letters to construct another word s in such a way that is
# lexicographically greater than w. In case of multiple answers find the lexicographically
# smallest one among them 

# Steps
# 1. Find the longest non-increasing suffix from the right
# 2. Identify the pivot
# 3. Find the rightmost successor
# 4. Swap successor with pivot
# 5. Reverse suffix


def bigger_is_greater(str)
  transformed = str.dup
  i = str.length - 1
  while i > 0 && transformed[i - 1] >= transformed[i]
    i -= 1
  end

  return "no answer" if i == 0
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