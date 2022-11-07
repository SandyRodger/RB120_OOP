=begin

https://launchschool.com/exercises/42f030c9

Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

Write a class called Square that inherits from Rectangle, and is used like this:

square = Square.new(5)
puts "area of square = #{square.area}"

=end

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(length_of_side)
    super(length_of_side, length_of_side)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"
rectangle = Rectangle.new(7, 6)
puts "area of rectangle = #{rectangle.area}"