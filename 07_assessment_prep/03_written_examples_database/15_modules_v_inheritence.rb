module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk

=begin

What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?

This code will output:

Mike strolls forward
Kitty saunters forward

The reason why a mixin works well here is that it contains a method which is used in multiple classes. Mixins are for grouping behaviours which can be used in different classes, whereas parent classes model relationships where the child class is a more specific type of the parent class. 

=end