# Find the number of characters in common
# Subtract from the total length of strings
# All characters in both strings are lowercase

def making_anagrams(string1, string2)
  matching_chars = 0
  visited_chars = Hash.new
    
  longest_string = string1.length > string2.length ? string1 : string2
    
  longest_string.each_char do |ch|
    if visited_chars[ch]
      next
    else
      visited_chars[ch] = true
      matching_chars += [string1.count(ch), string2.count(ch)].min
    end
  end
  
  string1.length + string2.length - matching_chars * 2
end