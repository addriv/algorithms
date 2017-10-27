# Head pointer may be nil if the list is empty
# Return 0 for no cycle
# Return 1 for cycle exists in linked list
# Use a hash to track nodes that have been visited
# Traverse linked list until next pointer is nil

class Node
  attr_accessor :data, :next

  def initialize(data = nil, next_node = nil)
    @data = data
    @next = next_node
  end
end

def has_cycle(head)
  return 0 unless head

  visited_nodes = Hash.new

  current_node = head
  while current_node.next
    return 1 if visited_nodes[current_node]
    visited_nodes[current_node] = true
    current_node = current_node.next
  end

  return 0
end