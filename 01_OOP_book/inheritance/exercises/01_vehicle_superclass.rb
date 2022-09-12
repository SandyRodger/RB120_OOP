=begin

Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

=end

class Vehicle 
	attr_accessor :color, :current_speed
	attr_reader :year

	def change_color(new_color)
		color = new_color
		puts "you changed the color to #{color}"
	end

	def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

	def current_speed_display
		puts "you are now going #{current_speed} mph"
	end

	def brake(num)
		current_speed -= num
		puts "you brake by #{num} mph"
	end

	def shut_off
		current_speed = 0
		puts "shut down"
	end

	def speed_up(num)
		@current_speed += num
		puts "you accelerated by #{num} mph to #{current_speed}"
	end

end

class MyTruck < Vehicle
	CAN_TRANSPORT_FREIGHT = true

	def initialize(year, color, model)
		@year = year
		@color = color
		@model = model
		@current_speed = 0
		puts "your new truck is a #{color} #{model} and was made in #{year}."
	end


end

class MyCar < Vehicle

	CAN_PARK_IN_CITY_CENTRE = true

	def initialize(year, color, model)
		@year = year
		@color = color
		@model = model
		@current_speed = 0
		puts "your new car is a #{color} #{model} and was made in #{year}."
	end

	def view_year
		puts "this car was made in #{year}"
	end

end

car_1 = MyCar.new('1999', 'beige', 'ford_fiesta')
# car_1.speed_up(34)
truck_1 = MyTruck.new('1990', 'cherry red', 'quip-feaster')
car_1.speed_up(99)
