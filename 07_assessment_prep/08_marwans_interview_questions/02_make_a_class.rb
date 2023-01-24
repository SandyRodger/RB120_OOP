=begin

Define a class of your choice with the following:

Constructor method that initializes 2 instance variables.
Instance method that outputs an interpolated string of those variables.
Getter methods for both (you can use the shorthand notation if you want).
Prevent instances from accessing these methods outside of the class.
Finally, explain what concept(s) you’ve just demonstrated with your code.

=end

class Person
	def initialize(name, age)
		@name = name
		@age = age
	end

	def display_ivars
		puts "Hello, I am #{name} and I am #{age} years old."
	end

	private

	attr_reader :name, :age
end

sandy = Person.new("Sandy", 33)
sandy.display_ivars # => "Hello, I am Sandy and I am 33 years old."

=begin

Marwan said:

The Car class encapsulates a model of attributes and behaviors, from which objects can be created.
Each object creates its own copies of all instance variables, allowing its state to be unique from other instances.
The state of each instance is encapsulated in the object (the instance).

Encapsulation is also achieved in this example through method access control. By setting all the getter methods as private, it prevents that data from being accessed in unwanted ways.

=end