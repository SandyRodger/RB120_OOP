#What will the following code output? Why?

class Student
  attr_reader :id

  def initialize(name)
    @name = name
    @id
  end

  def id=(value)
    @id = value
  end
end

p tom = Student.new("Tom") # => <Student<128474283> @name = "Tom",>
p tom.id = 45 # => 45
p tom # => <Student<128474283> @name = "Tom", @id = 45>

=begin

I made 2 mistakes here. Not catching the recursive loop and thinking that the intialize method would create a @id ivar, but it doesn't, it simply referes to one. Setter methods refer to the ivar directly.

Marwan says:

The reason the previous code did not work was that "self.id=" is in fact a method call, which 
happened to be named exactly the same as the method from where it was being invoked.
"self.id=(value)" is the same as "id=(value)", which causes a recursive loop and resultant SystemStackError. 

=end