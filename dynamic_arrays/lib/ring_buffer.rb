require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @start_idx = 0
    @length = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    raise "index out of bounds" unless index < @length
    @store[check_index(index)]
  end

  # O(1)
  def []=(index, val)
    @store[check_index(index)] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    popped = @store[check_index(@length - 1)]
    @store[check_index(@length - 1)] = nil
    @length -= 1
    return popped
  end

  # O(1) ammortized
  def push(val)
    if @length < @capacity
      @store[check_index(@length)] = val
      @length += 1
    else
      self.resize!
      self.push(val)
    end
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    @start_idx += 1
    @length -= 1
    @store[check_index(0) - 1]
  end

  # O(1) ammortized
  def unshift(val)
    if @length < @capacity
      @start_idx = check_index(-1)
      @length += 1
      @store[@start_idx] = val
    else
      self.resize!
      self.unshift(val)
    end
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    (@start_idx + index) % (@capacity)
  end

  def resize!
    new_store = StaticArray.new(@capacity * 2)
    i = 0
    while i < @length
      new_store[i] = @store[check_index(i)]
      i += 1
    end
    @start_idx = 0
    @capacity *= 2
    @store = new_store
  end
end
