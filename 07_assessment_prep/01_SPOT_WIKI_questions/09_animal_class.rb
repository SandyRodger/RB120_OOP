class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")        

=begin

What is output and why? What does this demonstrate about `super`?

bear has no color - wrong number of arguments given.

=end