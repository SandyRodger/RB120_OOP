=begin

 What will the last 2 lines of code output?

=end

class Foo
  def self.method_a
    "Justice" + all
  end

  def self.method_b(other)
    "Justice" + other.exclamate
  end

  private

  def self.all
    " for all"
  end

  def self.exclamate
    all + "!!!"
  end
end

foo = Foo.new
puts Foo.method_a # "Justice for all"
puts Foo.method_b(Foo) # Justice for all!!!

=begin

An object would not be able to be passed in to a method and have access to a private method, but a class can.

Marwan says:

Line 22 (Foo.method_a): #=> Justice for all
Line 23 (Foo.method_b): #=> Justice for all!!!

=end

