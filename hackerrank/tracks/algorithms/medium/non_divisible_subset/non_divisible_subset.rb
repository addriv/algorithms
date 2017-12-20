# Given a set, S, of n distinct integers, print the size of the largest possible 
# subset of integers where no pair sums to k

# Ex. k = 3, S = [1,7,2,4] => Result = 3
# [1, 1, 2, 1]

# Naive solution, two iterators i & j, test each pair. O(n) = n^2
n, k = gets.strip.split.map(&:to_i)
s = gets.strip.split.map(&:to_i)

def non_divisible_subset(s, k)
  count = 0

  i = 0
  j = 1
  while i < j
    j = i + 1
    while j < s.length
      count += 1 if (s[i] + s[j]) % k != 0
      j += 1    
    end
    i += 1
  end

  count
end

puts non_divisible_subset(s, k)

s = [2, 7, 12, 17, 22]
# [2, 2, 2, 2, 2]

# More efficient solution, hash tables
# Iterate through all of S, create a hash table with n % k as the key
# if matching pair exists in table, increase count

# Max size = s.length
# Ex. k = 3, S = [1,7,2,4] => Result = 3
# [1, 1, 2, 1]

# Ex. k = 4, S = [4, 4, 4, 4, 3, 1, 3, 1, 3]
# [0, 0, 3, 1, 3, 1, 3]
# {0 => 2, 3 => 3, 1 => 2}

# => [0, 3, 3, 3]
# => [1, 1, 0]

def non_divisible_subset(s, k)
  # Initially set max size = s.length
  max_size = s.length
  modulos = s.map { |n| n % k }
  modulos_hash = Hash.new(0)  
  modulos.each { |modulo| modulos_hash[modulo] += 1 }

  visited = Hash.new
  modulos_hash.each do |modulo, count|
    pair = k - modulo
    if modulo == 0
      max_size - modulos_hash[modulo] - 1
    elsif modulos_hash[pair]
      min_pair = [modulos_hash[modulo], modulos_hash[pair]].min
      next if visited[min_pair]
      max_size -= min_pair
      visited[min_pair] = true
    end
  end

  max_size
end

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
    if modulo == 0
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


# [2, 7, 10, 8, 4, 8, 2, 10, 6, 9, 6, 4, 4]
def naive_subsets(s, k)
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

  subsets
  counts = subsets.map { |subset| subset.length }
end
