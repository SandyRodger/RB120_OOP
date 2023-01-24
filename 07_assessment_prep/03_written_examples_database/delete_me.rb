class Person
	def initialize(name)
		@name = name
	end

	def public_method
		puts "I can be called from the public interface"
	end

	def call_private_method
		private_method
	end

	def compare_names(other_person)
		name == other_person.name
	end
	private 

	def private_method
		puts "I am being called from within the class"
	end

	private

	attr_reader :name
end

class Robot
	attr_reader :name
	def initialize(name)
		@name = name
	end
end

sandy = Person.new("Sandy")
sandy_2 = Person.new("Sandy")
barry = Person.new("Barry")
sandy_3 = Robot.new("Sandy")
# sandy.public_method
# sandy.initialize("Sandy")
# sandy.call_private_method
#p sandy.compare_names(sandy_2) # => true
#p sandy.compare_names(barry) # => false
p sandy.compare_names(sandy_3)
