class Node
  attr_accessor :left, :right
  attr_reader :data
  
  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end 
end

# Put data from each node in a tracking hash
# BFS and check if each node is already in tracking hash
# Return "No" if data is already in hash
# Return "Yes" after BFS complete
def checkBST(root)
  data = Hash.new  

  if BFS(root, data)
    "YES"
  else
    "NO"
  end
end

def BFS(node, data_hash)
  return false if data_hash[node.data]
  data_hash[node.data] = true
  
  children = []
  children.push(node.left) if node.left != nil
  children.push(node.right) if node.right != nil

  children.each do |node|
    return false unless BFS(node, data_hash)
  end

  p data_hash.keys

  true
end

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