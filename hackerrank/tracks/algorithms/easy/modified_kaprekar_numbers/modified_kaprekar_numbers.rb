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


end

