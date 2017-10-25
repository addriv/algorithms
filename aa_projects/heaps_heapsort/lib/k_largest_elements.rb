require_relative 'heap'

def k_largest_elements(array, k)
  prc = Proc.new { |el1, el2| -1 * (el1 <=> el2) }

  heap = BinaryMinHeap.new(&prc)

  array.each { |n| heap.push(n) }

  results = heap.store
  len = results.length

  k.times do
    len -= 1
    results[0], results[len] = results[len], results[0]
    p results
    results = BinaryMinHeap.heapify_down(results, 0, len, &prc)
  end

  results[len..-1]
end
