# Q1
numbers = [10, 20, 30, 40, 50]
sum = 0
numbers.each do |number|
    sum += number
end    
puts "合計は#{sum}です"

# Q2
numbers = [1, 2, 3, 4, 5, 6]

numbers.each do |number|
    if number % 2 == 0
        puts number 
    end
end    
# Q3
user = {
name: "Hotaka",
age: 22,
country: "Japan"
}
puts "名前: #{user[:name]}"
puts "年齢: #{user[:age]}"
puts "国: #{user[:country]}"


