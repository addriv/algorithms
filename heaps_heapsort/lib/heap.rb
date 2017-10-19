class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    indices = []
    (1..2).each do |idx|
      child_idx = parent_index * 2 + idx
      indices.push(child_idx) if child_idx < len 
    end

    indices
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    parent_value = array[parent_idx] 
    
    children = BinaryMinHeap.child_indices(len, parent_idx)

    return array if children.empty?

    if parent_value > array[children[0]]
      array[parent_idx], array[children[0]] = array[children[0]], array[parent_idx]
      BinaryMinHeap.heapify_down(array, children[0], len, &prc)
    elsif parent_value > array[children[1]]
      array[parent_idx], array[children[1]] = array[children[1]], array[parent_idx]
      BinaryMinHeap.heapify_down(array, children[1], len, &prc)
    else
      array
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    parent_value = array[parent_idx]
    child_value = array[child_idx]

    if parent_value > child_valuee
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      BinaryMinHeap.heapify_up(array, parent_idx, len, &prc)
    else
      array
    end
  end
end
