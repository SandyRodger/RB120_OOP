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

What is output and why? What does this demonstrate about super?

This outputs an argument error because the Animal#initialize method was called with an argument, but defined without any arguments. This is because the `super` keyword without arguments passes all arguments to the next method of the same name in the method lookup path.

=end