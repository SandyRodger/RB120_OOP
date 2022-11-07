=begin

What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.

=end

class Person
	attr_accessor :height
	def initlialize(height)
		@height = height
	end
end

class Army < Person
	def initialize(height)
		super(height)
	end
end

class Navy < Person
	def initialize(height)
		super(height)
	end
	
	def compare_height(other_person)
		if self.height > other_person.height
			puts "I'm taller"
		else
			puts "this other person is taller"
		end
	end
end

bill = Army.new(180)
amy = Navy.new(179)
amy.compare_height(bill)

#STUCK