require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  zero_in = []

  vertices.each do |vertex|
    zero_in.push(vertex) if vertex.in_edges.empty?  
  end

  until zero_in.empty?
    u = zero_in.shift
    sorted.push(u)
    until u.out_edges.empty? 
      edge = u.out_edges[0]
      to_vertex = edge.to_vertex
      edge.destroy!
      zero_in.push(to_vertex) if to_vertex.in_edges.empty?
    end
  end

  if sorted.length == vertices.length
    sorted 
  else
    []
  end
end

# load 'lib/topological_sort.rb'

# vertices = []
# v1 = Vertex.new(1)
# v2 = Vertex.new(2)
# v3 = Vertex.new(3)
# v4 = Vertex.new(4)
# v5 = Vertex.new(5)
# v6 = Vertex.new(6)
# v7 = Vertex.new(7)
# v8 = Vertex.new(8)

# vertices.push(v1, v2, v3, v4, v5, v6, v7, v8)

# # First test
# 1.times do
#   Edge.new(v1, v2)
#   Edge.new(v1, v3)
#   Edge.new(v2, v4)
#   Edge.new(v3, v4)
#   Edge.new(v2, v5)
#   Edge.new(v4, v6)
#   Edge.new(v5, v6)
#   Edge.new(v6, v7)
#   Edge.new(v7, v8)
# end

# # Second test
# Edge.new(v1, v2)
# Edge.new(v1, v3)
# Edge.new(v2, v4)
# Edge.new(v3, v4)
# Edge.new(v2, v5)
# Edge.new(v4, v6)
# Edge.new(v5, v6)
# Edge.new(v6, v7)
# Edge.new(v7, v8)
# Edge.new(v8, v2)