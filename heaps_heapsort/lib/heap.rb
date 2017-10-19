class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc
    @store = []
  end

  def count
    @store.length
  end

  def extract
    extracted = peek
    new_store = [@store.last].concat(@store[1...count-1])
    @store = BinaryMinHeap.heapify_down(new_store, 0)
    
    extracted
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    if count > 1
      BinaryMinHeap.heapify_up(@store, count - 1, count, &@prc)
    end
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
    prc ||= Proc.new { |el1, el2| (el1 <=> el2) }

    parent_value = array[parent_idx] 
    children_idx = BinaryMinHeap.child_indices(len, parent_idx)

    return array if children_idx.empty?

    child_values = children_idx.map { |idx| array[idx] }
    val_idx = child_values == child_values.sort ? 0 : 1
    
    min_idx = children_idx[val_idx]
    max_idx = (children_idx - [min_idx])[0] || min_idx
    min_child = array[min_idx]
    max_child = array[max_idx]
    
    if prc.call(child_values[0], child_values[1]) == 1
      chosen_child = child_values[1]
      chosen_idx = children_idx[1]
    else
      chosen_child = child_values[0]
      chosen_idx = children_idx[0]
    end

    if prc.call(parent_value, chosen_child) == 1
      idx = parent_value < min_child ? max_idx : min_idx

      array[parent_idx], array[idx] = array[idx], array[parent_idx]

      BinaryMinHeap.heapify_down(array, idx, len, &prc)
    else
      return array
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| (el1 <=> el2) }

    parent_idx = BinaryMinHeap.parent_index(child_idx)

    if prc.call(array[parent_idx], array[child_idx]) == 1
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      return array if parent_idx == 0
      BinaryMinHeap.heapify_up(array, parent_idx, len, &prc)
    else
      array
    end
  end
end
