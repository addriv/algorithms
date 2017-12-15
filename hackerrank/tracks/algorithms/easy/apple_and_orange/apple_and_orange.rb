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