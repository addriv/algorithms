# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  check = Hash.new
  min_id = nil
  max_id = nil
  vertices = []
  
  arr.each do |tuple|
    tuple.each do |package_id|
      if check[package_id].nil?
        max_id = package_id if max_id.nil? || max_id < package_id
        min_id = package_id if min_id.nil? || min_id > package_id
        vertex = Vertex.new(package_id)
        check[package_id] = vertex
        vertices.push(vertex)
      end
    end

    Edge.new(check[tuple[1]], check[tuple[0]])
  end

  result = kahn_topological_sort(vertices).map { |vertex| vertex.value }
  (min_id..max_id).each { |id| result.push(id) unless check[id] }
  result
end
