n = gets.strip.to_i

def main(n)
  # Iterate through 10 times and print corresponding result
  (1..10).each { |i| puts "#{n} x #{i} = #{n*i}"}
end

main(n)