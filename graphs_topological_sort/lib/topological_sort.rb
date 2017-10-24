require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def kahn_topological_sort(vertices)
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

def tarjan_topological_sort(vertices)
  sorted = []
  visited = Hash.new

  vertices.each do |vertex|
    tracker = Hash.new
    return [] unless depth_first_search(vertex, visited, tracker, sorted)
  end

  sorted
end

def depth_first_search(vertex, visited_hash, stack, sorted_result)
  if stack[vertex]
    return false
  elsif visited_hash[vertex]
    return true
  elsif vertex.out_edges.empty?
    visited_hash[vertex] = 1
    sorted_result.unshift(vertex)
  else
    visited_hash[vertex] = 1
    stack[vertex] = 1

    vertex.out_edges.each do |edge|
      if depth_first_search(edge.to_vertex, visited_hash, stack, sorted_result)
        next
      else
        return false
      end
    end

    sorted_result.unshift(vertex)
    stack[vertex] = nil
    true
  end
end
