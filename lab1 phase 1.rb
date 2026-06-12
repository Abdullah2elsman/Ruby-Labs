def get_score(score)
  case score 
    when 90..100 then "A"
    when 80...90 then "B"
    when 70...80 then "C"
    when 60...70 then "D"
    else "F"
  end
end

puts "Grading Scale"

puts "==========================================="
puts "Avarage                        Letter Grade"
puts "==========================================="
puts "90 - 100                       A"
puts "==========================================="
puts "80 - 89                        B"
puts "==========================================="
puts "70 - 79                        C"
puts "==========================================="
puts "60 - 69                        D"
puts "==========================================="
puts "Below 60                       F"

puts "How many scores?" 
n = gets.chomp.to_i
sum = 0
low = 100
high = 0
for i in 1..n
  puts "Enter Score #{i}:"
  score = gets.chomp.to_i
  sum += score
  low = score if score < low 
  high = score if score > high
end
avg = sum.to_f / n
puts "Results:"
puts "  Avarage: #{avg}"
puts "  Grade  : #{get_score(avg)}"
puts "  Highest: #{high}"
puts "  Lowest : #{low}"
  

