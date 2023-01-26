[Ginni's notes](https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/setter_getter.md)

R: What are setter/getter methods and why are they important in OOP?

S: Setter/getter methods are methods we use to refer to and set the instance variables in an object. Without them the instance variables are not directly accessible from the public interface. Even within the class it is safer and allows greater control to refer to Instance variables via setter and getter methods.

B: In talking about setter/getter methods I will cover these points:

- Setter methods
- getter methods
- attr_ methods
- custom setter/getter methods
- 

P:

C:
```ruby
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
```
W:
D:

DON'T FORGET TO MENTION:

- it is better to refer to and manipulate ivars within the class via getter and setter methods because it makes the code more flexible and easier to maintain. 
BECAUSE
	- changes need only be made to the getter/setter method
	- it allows uninitiated variables to be caught, because an uninitiates ivar will return nil, but an uninitiated local var will raise an exception.
- We can call getter methods without an explicit caller, but setter methods should be prepended with `self.` because local variable initialization uses the syntax var_name = assigned value, so in irder to disambiguate for Ruby that we are actually calling the setter method we specify the calling object as `self` and ruby knows that it is a method we are calling, not a new variable. 
- Setter methods always return the value passed in.
