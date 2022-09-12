=begin

Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

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

end

mini_cooper = MyCar.new(1999, 'red', 'mini-cooper')
p mini_cooper.colour = 'burnt umber'
p mini_cooper.year

