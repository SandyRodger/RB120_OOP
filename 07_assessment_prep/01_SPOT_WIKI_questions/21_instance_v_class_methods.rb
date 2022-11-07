=begin

What is the difference between instance methods and class methods?

Instance methods are called on objects of the class and affect or use the object itself. Class methods are called on the class.
=end

class Furniture
	def initialize(type)
		@type = type
	end

	def describe
		"it's a very comfortable inside bench"
	end

	def self.describe
		"it's a big wooden cushiony things for sitting or working on"
	end
end

sofa = Furniture.new('sofa')
p sofa.describe
p Furniture.describe