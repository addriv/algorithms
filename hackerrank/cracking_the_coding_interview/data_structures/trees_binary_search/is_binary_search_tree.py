class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

import sys

def BFS(node, min, max):
  # Return true if tree is empty
  if node is None:
    return True
  
  # Check against min and max constraints
  if node.data < min or node.data > max:
    return False
  
  #Else recursively check subtrees and update min and max
  return BFS(node.left, min, node.data - 1) and BFS(node.right, node.data + 1, max)

def checkBST(root):
  return BFS(root, sys.maxsize * -1, sys.maxsize)
   