
def bigger_is_greater(str)
  i = -2
  while i > -str.length
    break if str[i..-1] < str[i..-1].reverse
  end
  str[i], str[i + 1] = str[i + 1], str[i]
  str
end