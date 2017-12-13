# Given an array of integers, find the max number pairs that are <= 1 from each other
# Naive solution, O(n) = n^2 to check each pair iteratively
# Better solution, iterate through once. Use hash table to check if values exist

def picking_numbers(nums)
  integers = Hash.new(0)
  max = 0

  nums.each do |n|
    integers[n] += 1
  end

  nums.each do |n|
    total1 = integers[n] + integers[n + 1]
    total2 = integers[n] + integers[n - 1]
    max_total = [total1, total2].max
    max = max_total if max_total > max
  end

  max
end
