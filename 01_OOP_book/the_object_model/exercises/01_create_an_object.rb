# 1 How do we create an object in Ruby? Give an example of the creation of an object.

# We create an object by defining a class and then from that class instantiating an object(AKA 'instance') by using the #new method.

class MyClass

end

my_obj = MyClass.new

# p my_obj

# 2 What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

# A module is a collection of behaviours that is usable in other classes via mixins (by using the #include method).

module Example
	def test(num)
		puts num
	end
end

class MyClass
	include Example
end

output = MyClass.new
# output.test(45)

# namespacing example:

module Careers
	class Engineer
	end

	class Teacher
		p "I'm a teacher"
	end
end

first_job = Careers::Teacher.new

# EXAMPLE 2: 

module Attack
	def swipe
		p "swipes at you"
	end
end

class Furry_Animal
	include Attack
end

bear = Furry_Animal.new
bear.swipe