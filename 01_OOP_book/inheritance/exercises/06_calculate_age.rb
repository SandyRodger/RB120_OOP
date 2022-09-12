=begin

Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.

=end
require 'date'

module RoadTrip
	def can_go_on_a_roadtrip?
		puts "hell yeah!"
	end
end

class Vehicle 
	attr_accessor :color, :current_speed, :age
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

	def display_age
		puts "This vehicle is #{age} years old"
	end
	private

	def age
		time = Time.new
		current_year = time.strftime("%Y").to_i
		age = current_year - year.to_i
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
car_1.display_age