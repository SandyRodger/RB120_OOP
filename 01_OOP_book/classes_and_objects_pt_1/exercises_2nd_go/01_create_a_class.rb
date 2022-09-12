class MyCar
	attr_accessor :year, :colour, :type, :current_speed
	
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
mini_cooper.speed_up
mini_cooper.current_speed
mini_cooper.brake
mini_cooper.current_speed
mini_cooper.shut_off
mini_cooper.current_speed

