1. What is the difference between instance methods and class methods?

Instance methods are called upon objects and are only possible once an object has been initialized, whereas class methods are called directly on a class and do not require initialization. Instance methods tend to perform functions that are specific to that particular object, whereas class methods pertain to the whole class. For example:

```ruby
class Dog
  attr_reader :name

  @@num_of_dogs = 1

  def initialize(name)
    @@num_of_dogs += 1
    @name = name
	end

	def self.display_num_of_dogs
		puts @@num_of_dogs
	end

	def jump
		puts "#{name} is jumping"
	end
end

pongo = Dog.new("Pongo")
spot = Dog.new("Spot")
lassie = Dog.new("Lassie")
pongo.jump
spot.jump
Dog.display_num_of_dogs
```

In the example above the #jump method is called on individual instances of the Dog class and the function is performed by that dog. On the other hand the Class method #display_num_of_dogs is for information common to all objects of the Dog class.

2. *What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.*

Collaborator objects are objects passed into the state of another object. 