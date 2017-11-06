n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a[a_i] = gets.strip.to_i
end

# Create heap class
class Heap
  def initialize
    @heap = []
  end

  def parent_idx(child_idx, length)
    return nil if child_idx == 0

    (child_idx - 1) / 2
  end

  def child_idx(parent_idx, length)
    children = [parent_idx * 2 +1, parent_idx * 2 + 2]
    return nil if children.max > length - 1
  end   
end