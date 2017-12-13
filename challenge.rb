# Debrief
# Didn't finish with optimized solution in 60mins
# Work on planning out solution first with decent time complexity

# Naive solution: Iterate through cuts and find max profit
def maxProfit(cost_per_cut, sale_price, lengths)
  max_profit = 0

  (lengths.min..lengths.max).each do |cut_length|
    total_rods = 0
    total_cuts = 0

    lengths.each do |rod_length|
      n_rods = rod_length / cut_length
      n_cuts = rod_length % cut_length == 0 ? n_rods - 1 : n_rods       
      total_rods += n_rods
      total_cuts += n_cuts
    end

    profit = total_profit(total_rods, sale_length, sale_price, total_cuts, cost_per_cut)
    max_profit = profit if profit > max_profit
  end

  max_profit
end

def total_profit(total_rods, sale_length, sale_price, total_cuts, cost_per_cut)
  total_rods * sale_length * sale_price - total_cuts * cost_per_cut
end

def total_waste(rod_lengths, cut_length)
  waste = 0
  rod_lengths.each do |length|
    waste += length % cut_length
  end
  waste
end


# ==================================================================
# Enter your code here. Read input from STDIN. Print output to STDOUT
n = gets.to_i
entities = []
(0...n).each do |i|
    entities << gets.strip.split(" ").map(&:to_i)
end

entities = [
  [3,2],
  [8,7],
  [6,9],
  [3,4],
  [7,8]
]

def non_dominatable_entities(entities)
  count = 1
  dominatable = -1
  
  sorted = sort_entities(entities)

  (1...sorted.length).each do |idx|
    if sorted[idx][1] < sorted[idx - 1][1]
      dominatable = idx
      break 
    end
  end

  dominatable
end

  
def sort_entities(entities)
  entities.sort_by { |arr| -arr[1] }.sort_by { |arr| -arr[0] }
end
