=begin

Running the following code will not produce the output shown on the last line. Why not? What would we need to change, and what does this demonstrate about instance variables?

=end

class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end 
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">

=begin

In this code the `ade` object does not contain a @grade ivar. This is because although the setter method for `ade` is present in the attr_accessor method, it is not called. We could instantiate the @grade ivar either by adding it to the initialize method implementation like this:

  def initialize(name, grade=nil)
    @name = name
    @grade = grade
  end

  or by calling the setter method on the ade object like this:

  ade.grade = nil
	
  This demonstrates that ivars must be instantiated before they become part of an object's state. Usually ivar instantiation happens at initialization. A setter method being defined in a class will not cause an ivar to exist, it has to be called.

=end
