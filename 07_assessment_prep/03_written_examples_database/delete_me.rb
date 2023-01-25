class Person
	attr_accessor :name
	attr_writer :age
	attr_reader :age

	def initialize(name, age)
		@name = name
		@age = age
	end

	def name
		"This person's name is #{@name.capitalize}"
	end

	def age=(new_age)
		puts "#{new_age - age} years have passed"
		@age = new_age
		"BANG"
	end
end

barry = Person.new("barry", 33)
# p barry.name
# barry.name = "frank"
# p barry.name

p barry.age = 56
# p barry.age