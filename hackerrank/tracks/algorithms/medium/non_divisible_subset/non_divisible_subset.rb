# Given a set, S, of n distinct integers, print the size of the largest possible 
# subset of integers where no pair sums to k

# Ex. k = 3, S = [1,7,2,4] => Result = 3


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

# More efficient solution, hash tables
# Iterate through all of S, create a hash table with n % k as the key
# if matching pair exists in table, increase count

def non_divisible_subset()

end
