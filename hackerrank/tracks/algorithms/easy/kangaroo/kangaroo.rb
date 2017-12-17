# Given a line of 4 integers for position(x) and velocity(v) for two kangaroos
# determine if the two kangaroos ever land at the same location at the same time
# Print "YES" or "NO"
# Ex: 0(x1) 3(v1) 4(x2) 2(v2)

def kangaroo(x1, x2, v1, v2)
  # Find number of steps until they intersect
  steps = (x1 - x2).to_f / (v2 - v1)

  # If negative, velocities and starting locations diverge
  # If not whole number, steps won't intersect
  if steps < 0 || steps % 1 > 0
    "NO"
  else
    "YES"
  end
end
