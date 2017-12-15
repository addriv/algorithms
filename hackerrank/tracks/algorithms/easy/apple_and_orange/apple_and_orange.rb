# Determine how many apples and how many oranges will fall on Sam's house given
# the following variables

# s,t = the left and right bounds of Sam's house
# a = the location of the apple tree
# b = the location of the orange tree
# distance the apples and oranges fall, positive numbers mean fruit fell to the
# right of the tree

# Print numbers of apples as first line
# Print number of oranges as second line
def apples_and_oranges(s, t, a, b, apples, oranges)
  n_apples = 0
  n_oranges = 0

  apples.each do |apple| 
    if apple + a >= s && apple + a <= t
      n_apples += 1 
    end
  end 

  oranges.each do |orange| 
    if orange + b <= t && orange + b >= s
      n_oranges += 1 
    end
  end
  
  puts n_apples
  puts n_oranges
end