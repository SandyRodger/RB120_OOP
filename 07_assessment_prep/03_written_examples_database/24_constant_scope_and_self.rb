module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides # => 4
p Square.new.sides # => 4
p Square.new.describe_shape # => error: uninitialized constant Describable::SIDES

=begin

What is output and why? What does this demonstrate about constant scope? What does self refer to in each of the 3 methods above?

The output is as follows:

4
4
error: uninitialized constant Describable::SIDES

The first command searches for a class #sides method in the Square class. There isn't one so it goes up the method lookup path to the superclass Quadrilateral. There it finds the self.sides method where 'self' refers to the class where it is called. Square is calling this method so it implements from Square. The method begins a search for a SIDES constant from self, which is the Square class, finding it in the Quadralateral class referencing 4.

The second command has an instance as the calling object and so begins the search for an instance method. This it finds in the Shape class. In the method `self.class::SIDES` is invoked. Here `self` is the Square object, and calling the #class method on it will return Square. Then using the constant resolution operator Ruby searches for a SIDES constant from the Square class finding it as above in the Shape class and returning 4.

In the third example the #describe_shape method is called on an object, so the method lookup path looks for an instance method, beginning in the Square class. It eventually finds the method in the Describable module. Within the method, string interpolation refers to self.class and as this is called from the Square class, it returns Square. It also refers to SIDES, which throws an error because no constant resolution operator is used to specify where to look for SIDES and by default Ruby searches the module where it is called and no further. This demonstrates that constants don't have global scope and don't inherit so although they can be visible from any scope, you have to specify where the constant is to be found.

=end