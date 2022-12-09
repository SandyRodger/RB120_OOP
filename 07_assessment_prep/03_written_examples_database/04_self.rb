=begin

What are the use cases for self in Ruby, and how does self change based on the scope it is used in? Provide examples.

The `self` keyword is used in classes and modules to specify which object is calling the method. Any time a method is called without an explicit calling object Ruby will prepend `self.`. Depending on the scope in which it is called `self` can refer to a module, a class or a variable. This is demonstrated below.

=end

module Perimeterable
	def self.what_am_i?
		puts "I am from the #{self} module"
	end
end

class Shape
	attr_accessor :total_sides
	def initialize(sides)
		@total_sides = sides
	end

	def what_am_i?
		puts "This object is stored as #{self} "
	end

	def accidental_variable_initialization
		total_sides = 5
	end

	def successful_ivar_reassignment
		self.total_sides = 5
	end

	def self.what_am_i?
		puts "This is a #{self} class"
	end

end

square = Shape.new(4)
Shape.what_am_i? # => This is a Shape class
# This is a class method, wherein `self` will refer to the class
square.what_am_i? # => This object is stored as #<Shape:0x00007fc46b9017f8> 
# This is an instance method, wherein `self` will refer to the instance
p square.total_sides # => 4
p square.accidental_variable_initialization # => 5
p square.total_sides # => 4
p square.successful_ivar_reassignment # => 5
p square.total_sides # => 5
# This demonstrates what happens when `self.` is not prepended to assignment in a method. Because the scope of the method cannot see the setter method by that name Ruby assumes that you are initializing a new local variable. In the #successful_ivar_reassignment method we call the #total_sides setter method on self, which is an object of the Shapes class and therefore has access to the setter method, resulting in reassignment of the ivar. 
Perimeterable::what_am_i? # => I am from the Perimeterable module
# This last example demonstrates how self can be used within a module to reference the module, without any class being defined or object being initialized.