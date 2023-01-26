class Animal
  def initialize(name)
    @name = name
  end

  def greeting(other_animal)
   "#{other_animal.speak} #{@name}!"
  end

  protected 

  def speak
    "Hello"
  end
end

class Cat < Animal
  protected 

  def speak
    "Meow"
  end
end


bird = Animal.new('Tweety')
cat = Cat.new('Sylvester')

# puts bird.greeting(cat) # throws a NoMethodError, since the `speak` method is not available to the `Cat` instance.

# instances of the `Animal` class
bird = Animal.new('Tweety')
rabbit = Animal.new('Bugs Bunny')

puts bird.greeting(rabbit) # outputs "Hello Tweety!"

# instances of the `Animal` subclass, `Cat`
cat = Cat.new('Sylvester')
cat2 = Cat.new('Garfield')

puts cat.greeting(cat2) # outputs "Meow Sylvester!"
# This also works if the `speak` method is only defined within the `Animal` class, 
# but would instead output "Hello Sylvester!".