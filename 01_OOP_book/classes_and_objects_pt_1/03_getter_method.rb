class BodyPart
	def initialize(name)
		@name = name
	end

	def name
		@name
	end

	def move
		"your #{@name} moved!"
	end
end

leg = BodyPart.new("left leg")
puts leg.move
puts leg.name