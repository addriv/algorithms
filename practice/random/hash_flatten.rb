# Recursive hash flatten
def flatten_hash(hash)
  return hash if hash.values.all? { |val| val.class != Hash }

  flattened = Hash.new
  hash.each do |key, val|
    if val.class == Hash
      new_key = [key]
      flatten_hash(val).each do |cur_key, cur_val| 
        merged_key = (new_key + [cur_key]).join("_")
        flattened[merged_key] = cur_val
      end
    else
      flattened[key] = val
    end
  end

  flattened
end