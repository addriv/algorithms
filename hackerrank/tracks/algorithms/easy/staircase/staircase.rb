# Given the size of staircase (n), print out corresponding staircase
# Ex. n = 4
#    #
#   ##
#  ###
# ####

def staircase(n)
  i = 1
  while i <= n
    puts " " * (n - i) + "#" * i
    i += 1 
  end
end
