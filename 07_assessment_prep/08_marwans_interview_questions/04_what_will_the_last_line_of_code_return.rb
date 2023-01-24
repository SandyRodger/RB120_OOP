=begin

What will the last line of code return?

=end

class Student
  def initialize(id, name)
    @id = id
    @name = name
  end
  
  def ==(other)
    self.id == other.id
  end

  protected
  
  attr_reader :id, :name
end

rob = Student.new(123, "Rob")
tom = Student.new(456, "Tom")

p rob == tom # => false

=begin

Marwan says:
 
A private method id is raised when the == method is called on line 19. That is because using an explicit caller other than self is not allowed for private methods. Therefore, an error would only be raised for other.id and not self.id.

=end