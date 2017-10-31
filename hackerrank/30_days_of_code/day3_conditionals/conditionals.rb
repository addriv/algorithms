N = gets.strip.to_i

def conditional(n)
  if n.odd?
    "Weird"
  elsif n >= 2 && n <= 5
    "Not Weird"
  elsif n >= 6 && n <= 20
    "Weird"
  elsif n > 20
    "Not Weird"
  end
end

puts conditional(N)