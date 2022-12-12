=begin

When does accidental method overriding occur, and why? Give an example.

Accidental method overriding happens when we define a method with the same name as a built-in Ruby method. For instance the #instance_of? method:

=end

class Triangle
	def instance_of?
		puts "I have overridden the Object method"
	end
end

class Square; end

shape_1 = Triangle.new
shape_1.instance_of? # => I have overridden the Object method
shape_2 = Square.new 
p shape_2.instance_of? Square # => true

=begin

In this example the Triangle class overrides the #instance_of? method, which is a method built into Ruby's Object class. The Square object calls the original #instance_of? method successfully. Most Object methods should not be overridden because doing so can have wide-ranging unintended consequences. #to_s and #== are examples of methods which we do often want to override. 

=end