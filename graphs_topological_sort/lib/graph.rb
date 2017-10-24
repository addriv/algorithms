class Vertex
  attr_reader :value, :in_edges, :out_edges
  
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def in_push(el)
    @in_edges.push(el)
  end

  def out_push(el)
    @out_edges.push(el)
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost
  
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost

    to_vertex.in_push(self)
    from_vertex.out_push(self)
  end

  def destroy!
    @to_vertex.in_edges.delete(self)
    @from_vertex.out_edges.delete(self)

    @from_vertex = nil
    @to_vertex = nil
  end
end


# from_vertex = Vertex.new(nil)
# to_vertex = Vertex.new(nil)
# edge = Edge.new(from_vertex, to_vertex)