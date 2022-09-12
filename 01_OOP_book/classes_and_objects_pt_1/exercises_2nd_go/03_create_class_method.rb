=begin

You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

=end

class MyCar
	attr_accessor :colour
	attr_reader :year
	
	def initialize(year, colour, type)
		@year = year
		@colour = colour
		@type = type
		@current_speed = 0
	end

	def speed_up
		p "by how much would you like to speed up?(int)"
		answer = gets.chomp.to_i
		p "you've accelerated from #{@current_speed} to #{@current_speed += answer}"
	end

	def brake
		p "by how much would you like to slow down?(int)"
		answer = gets.chomp.to_i
		p "you've slowed down from #{@current_speed} to #{@current_speed -= answer}"
	end

	def shut_off
		@current_speed = 0
		p "shutting down"
	end

	def current_speed
		p "your current speed is #{@current_speed}"
	end

	def spray_paint(new_colour)
		p "your car was #{colour}, but we sprayed it up, and now it's #{new_colour}"
		self.colour = new_colour
	end

end

mini_cooper = MyCar.new(1999, 'red', 'mini-cooper')
mini_cooper.spray_paint('beige')

