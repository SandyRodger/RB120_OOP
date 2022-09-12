class SpaceShip
	@@number_of_spaceships = 0

	def initialize
		@@number_of_spaceships += 1
	end

	def self.total_number_of_spaceships
		@@number_of_spaceships
	end
end

puts SpaceShip.total_number_of_spaceships # => 0

x_wing = SpaceShip.new
y_wing = SpaceShip.new

puts SpaceShip.total_number_of_spaceships # => 2