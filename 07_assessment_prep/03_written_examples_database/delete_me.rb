class Furniture
	def how_many_legs(description)
		puts "I can be described as a #{description}"
	end
end

class Sofa < Furniture
	def how_many_legs(name)
		super
		puts "I am a #{name}"
	end
end

sofa = Sofa.new
sofa.how_many_legs("red one")