=begin

Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

=end

class MyCar

	def initialize(year, color, model)
		@year = year
		@color = color
		@model = model
		@current_speed = 0
	end

	def current_speed
		p "you are now going #{@current_speed} mph"
	end

	def brake(num)
		@current_speed -= num
		p "you brake by #{num} mph"
	end

	def shut_off
		@current_speed = 0
		p "shut down"
	end

	def speed_up(num)
		@current_speed += num
		p "you accelerated by #{num}"
	end
end

my_car = MyCar.new('1999', 'beige', 'ford_fiesta')
my_car.speed_up(20)
my_car.current_speed
my_car.speed_up(20)
my_car.current_speed
my_car.brake(24)
my_car.current_speed
my_car.shut_off
my_car.current_speed




