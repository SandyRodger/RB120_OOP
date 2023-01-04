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

What is output and why? What does this demonstrate about super?

This outputs:

#<GoodDog:0x00007f83bb8e13b8 @name="brown", @color="brown">

 which demonstrates that the super keyword, when given no arguments, passes up all arguments to the next  method of the same name in the method lookup chain. In this case it took the string "brown" and passed it to Animal#initialize where it was assigned to the parameter `name` and assigned to the instance variable @name. It also demonstrates that super causes both methods of the same name to be invoked simultaneously.

=end