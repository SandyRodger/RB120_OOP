=begin

What is output and why? What does this demonstrate about instance variables?

nil is output because, although the Dog object has access to the #enable_swim method in which @can_swim would be assigned to true, the #enable_swim method is not called and therefore the @can_swim ivar is not instantiated. This means that the swim method evaulated the `if` statement as false returning nil. This demonstrates that, unlike local variables which need only be assigned to a value, instance variables must be instantiated before they can be referenced.

=end

module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim   # => nil
