class SkyItems
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end

class Bird < SkyItems
	def initialize(color)
		super
		@color = color
	end
end

flappy = Bird.new("speckled")
p flappy