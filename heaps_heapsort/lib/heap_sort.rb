require_relative "heap"

class Array
  # def heap_sort!
  #   prc = Proc.new do |el1, el2|
  #     -1 * (el1 <=> el2)
  #   end

  #   heap = BinaryMinHeap.new

  #   self.each { |num| heap.push(num) }

  #   heap.count.times do |idx|
  #     self[idx] = heap.extract
  #   end

  #   self
  # end
    
  def heap_sort!
    prc = Proc.new do |el1, el2|
      -1 * (el1 <=> el2)
    end
    
    heap = BinaryMinHeap.new

    self.each { |num| heap.push(num) }

    heap.count.times do |idx|
      self[idx] = heap.extract
    end

    self
  end
end
