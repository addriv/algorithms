# Create person class that takes in initialAge
# Check if initialAge is positive, if negative print statement and set age to 0
# amIOld instance method that checks age and prints corresponding statement
# yearPasses instance method increments @age by 1
class Person
    attr_accessor :age
    def initialize(initialAge)
      if initialAge > 0
        @age = initialAge
      else
        @age = 0
        puts "Age is not valid, setting age to 0."
      end
    end
  
    def amIOld
      case 
      when @age < 13
        puts "You are young."
      when @age >= 13 && @age < 18
        puts "You are a teenager."
      else
        puts "You are old."
      end
    end
  
    def yearPasses
      @age += 1
    end
end

# Code for receiving input and parsing to get correct output
T=gets.to_i
for i in (1..T)do
    age=gets.to_i
    p=Person.new(age)
    p.amIOld()
    for j in (1..3)do
        p.yearPasses()
    end
    p.amIOld
  	puts ""
end 