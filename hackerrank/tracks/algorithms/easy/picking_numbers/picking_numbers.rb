# Given an array of integers, find the max number pairs that are <= 1 from each other
# Naive solution, O(n) = n^2 to check each pair iteratively
# Better solution, iterate through once. Use hash table to check if values exist

def picking_numbers(nums)
  integers = Hash.new
  count = 0

  nums.each do |n|
    count += 1 if integers[n - 1]
    count += 1 if integers[n + 1]
    count += 1 if integers[n]

    integers[n] += 1
  end

  count
end
