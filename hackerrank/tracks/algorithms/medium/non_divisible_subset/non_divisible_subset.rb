# Given a set, S, of n distinct integers, print the size of the largest possible 
# subset of integers where no pair sums to k
# Ex. k = 3, S = [1,7,2,4] => Result = 3
# [1, 1, 2, 1]

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

# More efficient solution, hash tables
# Iterate through all of S, create a hash table with n % k as the key
# if matching pair exists in table, increase count
# Max size = s.length
# Ex. k = 3, S = [1,7,2,4] => Result = 3
def non_divisible_subset(s, k)
  # Initially set max size = s.length
  max_size = s.length
  modulos = s.map { |n| n % k }
  modulos_hash = Hash.new(0)  
  modulos.each { |modulo| modulos_hash[modulo] += 1 }

  # TEST
  subsets = []

  visited = Hash.new
  modulos_hash.each do |modulo, count|
    pair = k - modulo
    if modulo == 0 || pair == modulo
      max_size -= (modulos_hash[modulo] - 1)

      # TEST
      subsets << modulo
    elsif modulos_hash[pair]
      next if visited[pair]
      min_pair = [modulos_hash[modulo], modulos_hash[pair]].min
      max_size -= min_pair
      visited[modulo] = true
      
      # TEST
      max_pair = [modulos_hash[modulo], modulos_hash[pair]].max
      valid = modulos_hash[modulo] == max_pair ? modulo : pair
      max_pair.times do
        subsets << valid
      end
    end
  end

  max_size

  # TEST
  # subsets
end

n, k = gets.strip.split.map(&:to_i)
s = gets.strip.split.map(&:to_i)
puts non_divisible_subset(s, k)
