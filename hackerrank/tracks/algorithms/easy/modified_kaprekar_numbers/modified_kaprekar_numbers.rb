def modified_kaprekars(p,q)
  modified_kaprekars = []

  (p..q).each do |n|
    modified_kaprekars << n if is_modified_kaprekar?(n)
  end
  
  if modified_kaprekars.empty?
    "INVALID RANGE"
  else
    modified_kaprekars.join(" ")
  end
end

def is_modified_kaprekar?(n)
  square = (n**2).to_s
  mid = square.length / 2
  left = square[0...mid]
  right = square[mid..-1]

  if left.to_i + right.to_i == n
    true
  else
    false
  end
end

