n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a[a_i] = gets.strip.to_i
end

# Create heap class
# Heapify on every pushed integer
# Heap sort in place and calculate median
# Time complexity = O(n)
class Heap
  def initialize
    @store = []
  end

  def parent_idx(child_idx, length)
    return nil if child_idx == 0

    (child_idx - 1) / 2
  end

  def child_indices(parent_idx, length)
    child_indices = []
    (1..2).each do |num|
      child_idx = parent_idx * 2 + num
      child_indices.push(child_idx) if child_indices < length
    end

    child_indices
  end   
end