# Q1
name = "hotaka"
puts "こんにちは、#{name}です"
# Q2
h = 8
w = 5
puts "面積は#{h * w}です"
p 
# Q3
food = "寿司"
drink = "お茶"
puts "今日のご飯は#{food}と#{drink}です"
# Q4
score = 75

result = score >= 60 ? "合格" : "不合格"

if score >= 60  
    puts "合格"
else
    puts "不合格"
end

puts result

# Q5
score = 75

case score
when 90..100
  puts "A"
when 70..89
  puts "B"
when 50..69
  puts "C"
else
  puts "D"
end
# Q6
signal = "red"

case signal
when "red"
    puts "止まる"
when "yellow"
    puts "注意"
when "green"
    puts "進"
end
# Q7
numbers = (1..5)

numbers.each do |number|
    puts number
end

num = 1
while num <= 5
    puts num 
    num +=1
end 

# Q8
5.times {puts "Ruby 楽しい"}
# Q9
fruits = ["apple", "banana", "orange"]

fruits.each { |fruit| puts fruit }
# Q10

scores = [82, 45, 96, 70, 58]

scores.each do|score|
    puts score>=60 ? "合格" : "不合格"
end