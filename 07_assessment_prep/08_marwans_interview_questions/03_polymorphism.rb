=begin

What concept does the following code aim to demonstrate?

=end

module Greet
  def greet(message)
    puts message
  end
end

class Teacher
  include Greet
end

class Student
  include Greet
end

tom = Teacher.new
rob = Student.new

tom.greet "Bonjour!"
rob.greet "Hello!"

=begin

My answer: 

Polymorphism because objects of different types are responding to the same interface with unique implementation.

Marwan:

This example demonstrates polymorphism through interface inheritance. By extracting common behavior to a module, we then include or "mix in" that module in the classes we wish to express that behavior in. This allows us to achieve a higher level of abstraction, while maintaining code that adheres to the DRY principle. In this case, we are performing polymorphism since objects of different types are able to respond to the same greet message.

=end