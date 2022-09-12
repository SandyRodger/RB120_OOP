=begin

Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.
=end

class MyCar
	attr_accessor :color
	attr_reader :year

	def initialize(year, color, model)
		@year = year
		@color = color
		@model = model
		@current_speed = 0
	end

	def change_color(new_color)
		color = new_color
		puts "you changed the color to #{color}"
	end

	def view_year
		puts "this car was made in #{year}"
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
# my_car.change_color('green')
# my_car.view_year






