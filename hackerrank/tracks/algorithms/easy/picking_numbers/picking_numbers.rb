# Given an array of integers, find the max number pairs that are <= 1 from each other
# Use hash tables to track which numbers are in the array at constant time
# Iterate through each integer, add up integers that are within <= 1

# 18:18 
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
