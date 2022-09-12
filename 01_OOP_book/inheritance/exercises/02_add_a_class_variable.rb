=begin

Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.

=end

class Vehicle 
	attr_accessor :color, :current_speed
	attr_reader :year

	@@num_of_vehicles = 0

	def self.display_num_of_vehicles
		puts "there are #{@@num_of_vehicles} vehicles"
	end

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
		@@num_of_vehicles += 1
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
		@@num_of_vehicles += 1
	end

	def view_year
		puts "this car was made in #{year}"
	end

end

Vehicle.display_num_of_vehicles
car_1 = MyCar.new('1999', 'beige', 'ford_fiesta')
truck_1 = MyTruck.new('1990', 'cherry red', 'quip-feaster')
Vehicle.display_num_of_vehicles
