class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end

=begin

What is output and why? 

=> "I eat." "I eat plankton" "I eat kibble."

How does this code demonstrate polymorphism? 

=> This demonstrates that different objects can be passed into the same method by treated differently.

=end