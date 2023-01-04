=begin

What is the method lookup path that Ruby will use as a result of the call to the fly method? Explain how we can verify this.

Penguin, Migratory, Aquatic, Bird, Animal, Object, Kernel, BasicObject

We know this because the method lookup path first searches the class of the object calling the method. It then looks for any modules starting at the bottom of the class. Then it moves to the superclass, repeating the module search. This is repeated until the method is found or BasicObject class is reached and searched. 

We can verify this by calling the #ancestors method on the Penguin class.

=end

module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
# pingu.fly # => undefined method error
p pingu.class.ancestors