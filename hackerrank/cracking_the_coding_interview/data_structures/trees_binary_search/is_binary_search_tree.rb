class Node
  attr_accessor :left, :right
  attr_reader :data
  
  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end 
end

def BFS(node, min, max)
  # Return true if tree is empty
  return true if node.nil?

  # Check against min and max constraints
  return false if node.data < min || node.data > max

  #Else recursively check subtrees and update min and max
  return BFS(node.left, min, node.data - 1) && BFS(node.right, node.data + 1, max)
end

def checkBST(root)
  return BFS(root, -1, 1 * 10^4)
end

# Test case tree
a = Node.new(4)
b = Node.new(2)
c = Node.new(1)
d = Node.new(3)
e = Node.new(6)
f = Node.new(5)
g = Node.new(7)

a.left = b
a.right = e
b.left = c
b.right = d
e.left = f
e.right = g