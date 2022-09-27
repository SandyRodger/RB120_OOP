class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud                     

# bob.pets.jump 

=begin

We raise an error in the code above. Why? 

=> Because the #jump method is part of the Pet class, while bob is an object of the Person class, which does not have access to the methods of Pet class.

What do `kitty` and `bud` represent in relation to our `Person` object?  

kitty and bud are class objects stored within an array referenced by the @pets instance variable in Person class. 

A way to correct the code above would be with the following code:
=end

bob.pets.each{|pet| pet.jump}