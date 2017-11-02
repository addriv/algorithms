class Node
  attr_accessor :left, :right
  attr_reader :data
  
  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end 
end

def BFS(node, data_hash)
  return false if node.nil?
  
end

def checkBST(root):
  return BFS(root, -1, 1 * 10^4)
   

# Test case tree
a = Node.new(4)
b = Node.new(2)
c = Node.new(1)
d = Node.new(3)
e = Node.new(6)
f = Node.new(5)
g = Node.new(5)

a.left = b
a.right = e
b.left = c
b.right = d
e.left = f
e.right = g