def left_rotation(array, d)
  # Start index = d module of array length
  rotations = d % array.length
  rotated = array.drop(rotations) + array.take(rotations)
  print rotated.join(" ")
end