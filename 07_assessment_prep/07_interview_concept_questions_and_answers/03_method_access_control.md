[Ginni's notes](https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/example_code/method_access_control.rb)

R: How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

S:

Method Access Control is a way of limiting what can access the codes within a class. This is implemented with the three access modifiers: private, protected and public. 

B:

Private
Public
Protected

P: I will talk while I code showing how the different Method access modifiers work.

C:
``` Ruby
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


sandy = Person.new("Sandy")
sandy_2 = Person.new("Sandy")
barry = Person.new("Barry")
sandy_3 = Robot.new("Sandy")
# sandy.public_method
# sandy.initialize("Sandy")
# sandy.call_private_method
#p sandy.compare_names(sandy_2) # => true
#p sandy.compare_names(barry) # => false

```

W:

D: Shall I talk about what happens when you pass an object of a different class in to be compared in a protected method?

<<<<<<< Updated upstream
DON"T FORGET TO MENTION:

- ? 
=======
# DON'T FORGET TO MENTION:

- class methods can be called from the top level EVEN IF THEY ARE PRIVATE:


class Foo
  def self.method_a
    "Justice" + all
  end

  def self.method_b(other)
    "Justice" + other.exclamate
  end

  private

  def self.all
    " for all"
  end

  def self.exclamate
    all + "!!!"
  end
end

foo = Foo.new
# puts Foo.method_a # => "Justice for all"
# puts Foo.method_b(Foo) # => "Justice for all!!!"
puts Foo.exclamate # => " for all!!!"

Example 2: BOTH OBJECTS NEED TO BE IN THE CLASS OF THE PROTECTED METHOD OR INHERIT FROM THAT CLASS. NEITHER CALLER NOR SENDER CAN BE UPSTREAM OF THE PROTECTED METHOD DEFINITION

```ruby
class LevelOne
  def initialize(n)
    @name = n
  end

  def a_public_method(receiving_object)
    "Sender: #{self} / " + receiving_object.a_protected_method
  end

  def to_s
    @name
  end
end

class LevelTwo < LevelOne
  protected

  def a_protected_method
    "Receiver: #{self}"
  end
end

class LevelThree < LevelTwo
end

one = LevelOne.new("Object One")

two_a = LevelTwo.new("Object Two A")
two_b = LevelTwo.new("Object Two B")

three_a = LevelThree.new("Object Three A")
three_b = LevelThree.new("Object Three B")

# LevelOne objects cannot be the receiver for `a_protected_method`
# because the method is not defined in the class or in its inheritance chain.
puts two_a.a_public_method(one) # => NoMethodError: undefined method

# LevelOne objects also cannot be the sender (the object in which the protected
# method is invoked) because LevelOne objects aren't the same class or a subclass
# of LevelTwo where the protected method is defined.
# It doesn't matter that the two_a and three_a objects have access
# to the protected method.
puts one.a_public_method(two_a) # => NoMethodError: protected method
puts one.a_public_method(three_a) # => NoMethodError: protected method

# Finally, the sending and receiving objects can be the same class
# or different classes, as long as both are equal to or inherit from
# the class defining the called protected method.
puts two_a.a_public_method(two_b) # => Sender: Object Two A / Receiver: Object Two B
puts three_a.a_public_method(two_a) # => Sender: Object Three A / Receiver: Object Two A
puts two_a.a_public_method(three_a) # => Sender: Object Two A / Receiver: Object Three A
puts three_a.a_public_method(three_b) # => Sender: Object Three A / Receiver: Object Three B
```
>>>>>>> Stashed changes

Protected Issue: class methods cannot access instant methods within them, even if a instance is passed in... ?
```ruby
class ClassA
  def initialize
    @protected_variable = "Am I available?"
  end

  def self.public_method(object)
    object.protected_variable
  end

  protected

  attr_reader :protected_variable
end

puts ClassA.public_method(ClassA.new) # => protected method error, 
# BUT it does work without the protected.
# AND it does work as an instance method.
```

Example 2:

```ruby
class ClassA
  def public_method(object)
    puts "instance method:", self.class, object.is_a?(self.class)
  end

  def self.public_method(object)
    puts "class method:", self.class, object.is_a?(self.class)
  end
end

a = ClassA.new
a.public_method(a)
puts
ClassA.public_method(a)

# instance method:
# ClassA
# true

# class method:
# Class
# false

```
Pete Hanson says:

What's important here is that self.public_method shows that the type of self is Class, and that object is not an instance of Class. However, in the instance method, the type of self is ClassA, and object is an instance of ClassA

What I say is:

When it's a class method you can't access protected with an instance argument.
