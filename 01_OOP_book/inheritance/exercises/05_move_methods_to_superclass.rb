=begin

Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.

=end

module RoadTrip
	def can_go_on_a_roadtrip?
		puts "hell yeah!"
	end
end

class Vehicle 
	attr_accessor :color, :current_speed
	attr_reader :year

	@@num_of_vehicles = 0

	def self.display_num_of_vehicles
		puts "there are #{@@num_of_vehicles} vehicles"
	end

	def view_year
		puts "this vehicle was made in #{year}"
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

	include RoadTrip

	def initialize(year, color, model)
		@year = year
		@color = color
		@model = model
		@current_speed = 0
		puts "your new car is a #{color} #{model} and was made in #{year}."
		@@num_of_vehicles += 1
	end

end

car_1 = MyCar.new('2010', 'orange', 'subaru')
truck_1 = MyTruck.new('2018', 'green', 'U-Haul')
# car_1.view_year
# truck_1.view_year
# car_1.change_color('maroon')
# truck_1.change_color('maroon')
# car_1.spray_paint('gold')
# truck_1.spray_paint('gold')
# car_1.current_speed_display
# truck_1.current_speed_display
# car_1.can_go_on_a_roadtrip?
