=begin

https://launchschool.com/exercises/7b713134

Write a class that will display:

ABC
xyz

when the following code is run:

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

=end

class Transform
	attr_reader :str
	def initialize(str)
		@str = str
	end

	def uppercase
		str.upcase
	end

	def self.lowercase(str)
		str.downcase
	end
end

my_data = Transform.new('abc')
puts my_data.uppercase # => ABC
puts Transform.lowercase('XYZ') # => xyz
