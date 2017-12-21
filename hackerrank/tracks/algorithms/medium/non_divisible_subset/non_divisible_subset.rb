# Given a set, S, of n distinct integers, print the size of the largest possible 
# subset of integers where no pair sums to k
# Ex. k = 3, S = [1,7,2,4] => Result = 3

# Naive solution, two iterators i & j. Get all subsets, push n into subset if matching
# pair (k - modulo) does not exist in the subset
# Time complexity: O(n) = n^2
def naive_non_divisible_subsets(s, k)
  modulos = s.map { |n| n % k }
  subsets = []
  
  i = 0
  while i < modulos.length
    subset = [modulos[i]]
    subsets_hash = Hash.new
    subsets_hash[modulos[i]] = true

    j = 0
    while j < modulos.length
      if i == j
        j += 1
        next
      else
        pair = k - modulos[j]
        if subsets_hash[pair].nil?
          subset << modulos[j]
          subsets_hash[modulos[j]] = true
        end
        j += 1
      end
    end

    subsets << subset
    i += 1
  end

  counts = subsets.map { |subset| subset.length }
  counts.max
end

# More efficient solution: Use hash tables for checking if matching pair integer exists
# Start with max size which equals the length of S

# Iterate through all of S, create a hash table with n % k as the key
# if matching pair exists in table, increase count
# Max size = s.length
def non_divisible_subset(s, k)
  # Initially set max size = s.length
  max_size = s.length

  # Get modulos of k from S. Create a hash table for checking values in constant time
  # Keys = modulos, values = count of modulo
  modulos = s.map { |n| n % k }
  modulos_hash = Hash.new(0)  
  modulos.each { |modulo| modulos_hash[modulo] += 1 }

  # Iterate through the modulos
  # Create a visted hash to skip modulos that have already been checked
  visited = Hash.new
  modulos_hash.each do |modulo, count|
    pair = k - modulo
    # If modulo is zero or the matching pair is equal to the modulo
    # only one can exist in subset, subtract all but 1 from max_size
    # Else, subtract the lesser count between modulo and its pair
    if modulo == 0 || pair == modulo
      max_size -= (modulos_hash[modulo] - 1)
    elsif modulos_hash[pair]
      next if visited[pair]
      min_pair = [modulos_hash[modulo], modulos_hash[pair]].min
      max_size -= min_pair
      visited[modulo] = true
    end
  end

  max_size
end

n, k = gets.strip.split.map(&:to_i)
s = gets.strip.split.map(&:to_i)
puts non_divisible_subset(s, k)
