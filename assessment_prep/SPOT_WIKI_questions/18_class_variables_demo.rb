class Shape
  @@sides = nil
	@can_i_be_inherited = 1

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end

	def test
		p @can_i_be_inherited
	end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end

Triangle.new.test
=begin

What can executing `Triangle.sides` return? 

p Triangle.sides # => nil
Triangle.new
p Triangle.sides # => 3
Quadrilateral.new
p Triangle.sides # => 4
Shape.new
p Triangle.sides # => 4

What can executing `Triangle.new.sides` return? 

p Triangle.new.sides # => 3
Triangle.new
p Triangle.new.sides # => 3
Quadrilateral.new
p Triangle.new.sides # => 3
Shape.new
p Triangle.new.sides # => 3

What does this demonstrate about class variables?

=> class variables are shared by and accessable by all objects of that class and subclass

=end