# Given a grade, round to the next multiple of 5 if it is less than 3 away
# Do not round grades less than 38 as it will be a failing grade

def round(grade)
  if grade < 38 || grade % 5 < 3
    grade
  else
    (grade / 5) * 5 + 5
  end
end

def solve(grades)
  grades.map { |grade| round(grade) } 
end