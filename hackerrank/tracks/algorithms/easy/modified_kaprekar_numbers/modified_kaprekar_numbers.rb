def modified_kaprekars(p,q)
  modified_kaprekars = []

  (p..q).each do |n|
    modified_kaprekars << n if is_modified_kaprekar?(n)
  end
  
  modified_kaprekars.join(" ")
end

def is_modified_kaprekar?(n)
  square = (n ** 2).to_s
  # square.to_s

  i = 0
  while square[0..i].to_i <= n
    break if square[i + 1..-1].to_i == 0
    return true if square[0..i].to_i + square[i + 1..-1].to_i == n
    i += 1
  end

  false
end

