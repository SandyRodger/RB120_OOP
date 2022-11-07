=begin

What is the difference between states and behaviors?

- states are encapsulated by variables, behaviours by methods. These are the two types of data held by classes and their objects.

For instance, below the name and num_of_legs instance variables are describing the state of the Animal, and the fly method is describing a behaviour.

=end

class Animal
	def initialize(name, num_of_legs)
		@name = name
		@num_of_legs = num_of_legs
	end

	def fly
		puts "I can fly"
	end
end