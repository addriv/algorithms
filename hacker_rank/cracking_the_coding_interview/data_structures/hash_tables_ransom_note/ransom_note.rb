# Time complexity n^2 if using #include?
# Iterate through and create hashes for O(n) time complexity
# Check hashes 
# Return No if the ransom note has more words than the magazine

m,n = gets.strip.split(' ')
m = m.to_i
n = n.to_i
magazine = gets.strip
ransom = gets.strip

def ransom_note(num_magazine, num_ransom, magazine_str, ransom_str)
  if num_magazine < num_ransom
    puts "No"
    return
  end

  magazine_words = magazine_str.split(" ")
  ransom_words = ransom_str.split(" ")

  magazine_hash = Hash.new(0)
  ransom_hash = Hash.new(0)

  magazine_words.each_with_index do |word, idx|
    magazine_hash[word] += 1
    ransom_hash[ransom_words[idx]] += 1
  end

  ransom_hash.each do |word, count|
    break if word.nil?
    if count > magazine_hash[word]
      puts "No"
      return
    end
  end

  puts "Yes"
end

ransom_note(m, n, magazine, ransom)