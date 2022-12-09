=begin
What is the difference between instance methods and class methods?
Instance methods are called upon objects and are only possible once an object has been initialized, whereas class methods are called directly on a class and do not require initialization. Instance methods tend to perform functions that are specific to that particular object, whereas class methods pertain to the whole class. Instance methods are defined with the def and end keywords and within them self refers to the class object. Class methods are also defined with the def and end keywords, but are prepended with self.. Within class methods self refers to the class. For example:
=end
class Dog
  attr_reader :name
  @@num_of_dogs = 1
  def initialize(name)
    @@num_of_dogs += 1
    @name = name
  end
  def self.display_num_of_dogs
    puts "There are #{@@num_of_dogs} dogs"
    puts "This is from the #{self} class"
  end
  def jump
    puts "#{name} is jumping"
    puts "This is object is : #{self} "
  end
end
pongo = Dog.new("Pongo")
spot = Dog.new("Spot")
lassie = Dog.new("Lassie")
pongo.jump # => Pongo is jumping
spot.jump # => Spot is jumping
Dog.display_num_of_dogs # => There are 4 dogs
=begin
  In the example above the #jump method is called on individual instances of the Dog class and the function is performed by that dog. On the other hand the Class method #display_num_of_dogs is for information common to all objects of the Dog class.
=end