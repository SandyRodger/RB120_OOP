class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno

=begin

What is output and why? What does this demonstrate about `super`?

- Bruno is either 1) a nil colored dog called Brown, or 2) a Brown coloured dog called nil. 3) Or 2 nils 4) Or 2 Browns. I guess 4) ?

yes, a brown colored dog called brown

=end