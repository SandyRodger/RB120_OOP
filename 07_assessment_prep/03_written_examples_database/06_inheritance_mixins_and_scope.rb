=begin

How do class inheritance and mixing in modules affect instance variable scope? Give an example.

	Any ivar instantiated in a heirarchy of classes that inherit from each other and modules which are mixed in will be available to all classes and modules. This is demonstrated below: 

=end

module Swimmable
	def name_from_module
		@name
	end

	def set_age_in_module
		@age = 10
	end
end

class Animal
	
	def set_greeting_in_superclass
		@greeting = "hello"
	end

	def name_from_superclass
		@name
	end

end

class Dog < Animal
	include Swimmable

	def name_from_subclass
		@name
	end


	def initialize(name)
		@name = name
	end

	def greet
		@greeting
	end

	def age
		@age
	end
end

buddy = Dog.new("buddy")
buddy.set_greeting_in_superclass
buddy.set_age_in_module
p buddy.greet # => "hello"
# Here we see that an ivar instantiated in a superclass is visible in the subclass.
p buddy.age # => 10
# Here we see that an ivar instantiated in a module is visible in the class where it's mixed in.
p buddy.name_from_superclass # => "buddy" 
# Here we see that an ivar instantiated in a subclass is visible in its superclass.
p buddy.name_from_subclass # => "buddy"  
# Here we see that an ivar instantiated in a class is visible within that class.
p buddy.name_from_module # => "buddy" 
# Here we see that an ivar instantiated in a subclass is visible in any module mixed into that class.
