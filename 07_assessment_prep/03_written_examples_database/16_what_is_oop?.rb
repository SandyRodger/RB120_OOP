=begin

What is Object Oriented Programming, and why was it created? What are the benefits of OOP, and examples of problems it solves?

OOP is a programming model in which classes and objects are created with limited accessibility to make large programs more manageable. This is done by limiting the access that parts of the code have with others, which is called encapsulation. It is also achieved with polymorphism, which is the abiloty of different objects to respond to the same interface. OOP was created to counter the problem of large programs becoming mired in unmanageable interdependencies. With OOP a designer is free to think more abstractly about the code's design because finer details of implementation are hidden and protected from accidental manipulation. OOP also prevents accidental sharing of the code as I demonstrate below.

=end

class Person
	attr_reader :name, :age

	def initialize(name, age, ssn)
		@name = name
		@age = age
		@ssn = ssn
	end

	private

	attr_reader :ssn
end

john = Person.new('John', 36, 1234567)
p john.name # => John
p john.age  # => 36
p john.ssn # => private method error

=begin

In this example we want the name and age of the john to be readable so we use an attr_reader method. However we do not want name/age to be re-written, so we do not provide an attr_writer method. Furthermore, the 'private' access modifier prevents the rest of the code from reading john's ssn. 'private' ensures that it is only accessible within its own class. Without OOP these details would be available to the whole top-level. So for example if another 'name' variable was initialized it would accidentaly override john's. 