=begin

Complete the Rectangle, Square, and Circle classes so that all of the test cases output the appropriate value. What concept is being demonstrated here? What are the different ways that this concept is being demonstrated in your updated code?

=end

module Round
  def is_round?
    puts "Yes, I'm round"
  end
end

class Shape
  def description
    puts "I'm a #{self.class}"
  end

  def next_ancestor
    puts self.class.ancestors[1]
  end
end

class Rectangle; end
class Square; end
class Circle; end

rectangle = Rectangle.new
square = Square.new
circle = Circle.new

rectangle.description # I'm a Rectangle
square.description # I'm a Square
circle.description # I'm a Circle

rectangle.next_ancestor # Shape
square.next_ancestor # Rectangle
circle.next_ancestor # Round

rectangle.is_round? # NoMethodError
square.is_round? # NoMethodError
circle.is_round? # Yes I'm round

=begin

Your Answer
Lines 17 to 19 should be changed to the following:

=end
class Rectangle < Shape ; end
class Square < Rectangle; end
class Circle < Square
    include Round
end
=begin
This demonstrates inheritance. Rectangle is inheriting from Shape, Square is inheriting from Rectangle and Circle is inheriting from the module Round. This means that all three classes are using class inheritance because they inherit from a parent class , but Circle is also using interface inheritance, which is the name for inheriting from from a module.

Responses

Clare MacAdie (TA)
about 5 hours ago
=end
class Circle < Square
include Round
end
=begin
This part of your answer is incorrect because a circle is not a type of square. Can you correct this please?


Sandy Rodger
about 2 hours ago
Ah yes, it should be:

=end
class Circle < Shape
  include Round
end