# Convert inputs to correct data types
int = gets.strip.to_i
double = gets.strip.to_f
str = gets.strip

# Set globals to given variables
I = i
D = d
S = s

def data_types(int, double, str)
  puts I + int
  puts D + double
  puts "#{S}#{str}"
end

data_types(int, double, str)