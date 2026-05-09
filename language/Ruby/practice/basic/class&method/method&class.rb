# Method 
# Q1
def double(n)
    n * 2
end

puts double(5)
# Q2
def big?(n)
    n > 100 ? true : false 
end

puts big?(100)
# Q3
def full_name(first_name:,last_name:  "")
    first_name + last_name
end 
puts full_name(first_name: "ho" , last_name: "taka")
# Q4
def sum_odd(numbers)
    sum = 0
    numbers.each do |number|
        number % 2 !=0 ? sum += number : nil
        # 処理 if 条件分
        sum += number if number.odd?

    end
    return{sum:sum ,list:numbers}
end 
numbers = [1,2,3,4,5,6,7]
p sum_odd(numbers)
# Q5
class Car
    def initialize()
        @distance = 0
    end
    def drive(n)
        @distance += n
    end

    def show()
        puts @distance
    end
end

car = Car.new

car.drive(10)
car.drive(5)
car.show()
# class
# Q1
class Dog
    def initialize(name)
        @name = name 
    end 
    def bark()
        puts "#{@name}: ワンワン！"
    end
end

dog = Dog.new("koko")
dog.bark()
# Q2
class Laptop
    attr_accessor :price
    attr_reader :brand

    def initialize()
        @brand = "apple"
    end
    def update_price(price:)
        @price = price
    end
    def update_brand(brand:)
        # attr_reader変数窓口チェックが走る －＞エラー
        # self.brand = brand
        # attr_reader変数窓口チェックが走らない －＞エラーにはならないが変数窓口が読みだけなのに変数更新できるので間違え
        @brand = brand
    
    end
    def to_s
        "Laptop_brand:#{@brand},Laptop_price:#{@price}"
    end
end

laptop = Laptop.new
laptop.price = 1000
puts laptop
laptop.update_brand(brand:"new_brand")
laptop.update_price(price: 2000)
puts laptop

# Q3
class Calculator
    def self.add(a,b)
        a + b
    end
end

puts Calculator.add(1,2)
# Q4
class Player
    def initialize
        @current_hp = 100
    end
    def damage(amount)
        @current_hp -= amount
    end
    def show_hp
        puts @current_hp
    end
end

palyer1 = Player.new
palyer1.damage(42)
palyer1.show_hp
# Q5

class Animal
  def eat
    puts "食事中..."
  end
end

class Cat < Animal
    def super
        puts "にゃー"
    end
end

cat = Cat.new

cat.eat
cat.super


# Q6
class Article
    @@articles = []

    def initialize(title:)
        @@articles << title
    end

    def self.all_title()
        @@articles.each do |article|
            puts article
        end
    end
end

a1= Article.new(title: "good day")
a2= Article.new(title: "bad day")
a3= Article.new(title: "nice day")
a4= Article.new(title: "banana day")

Article.all_title

### test