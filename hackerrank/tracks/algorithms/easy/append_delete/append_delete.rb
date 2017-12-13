# Given string (s), can perform appending a letter OR deleting last letter
# Given k, and two string, s and t, determine if s can be converted to t by performing
# exactly k operations. Print Yes or No

# First find up to what index is the same

# 15mins
def append_delete(k,s,t)
  return "Yes" if s.length + t.length < k
    
  i = 0
  while s[0..i] == t[0..i] && i < s.length
    i += 1
  end

  # deletes = i + 1
  # appends = t.length - deletes
  deletes = s.length - i
  appends = t.length - i
  minimum = deletes + appends

  # print minimum
  if minimum > k
    "No"
  else
    if (k - minimum).even?
      "Yes"
    else
      "No"
    end
  end
end
