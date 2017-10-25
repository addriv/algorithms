# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @queue = RingBuffer.new
    @max = nil
    @trail_max = nil
  end

  def enqueue(val)
    @queue.push(val)
    if !@max || @max < val
      @max = val
      @trail_max = nil
    elsif !@trail_max || @trail_max < val
      @trail_max = val
    end
  end

  def dequeue
    shifted = @queue.shift
    if @max == shifted
      @max = @trail_max
      @trail_max = nil
    end
  end

  def max
    @max
  end

  def length
    @queue.length
  end

end
