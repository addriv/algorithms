def has_cycle(head):
  if head == None:
    return 1
  
  visited_nodes = {}

  current_node = head

  while (current_node.next != None):
    if visited_nodes.get(current_node) == None:
      return 1

    visited_nodes[current_node] = True

    current_node = current_node.next
  
  return 0
