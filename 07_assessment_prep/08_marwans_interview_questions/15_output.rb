=begin

What will be output when the last 2 lines of code get executed?

=end

class Foo
  @@var = 1

  def self.var
    @@var
  end
end

class Bar < Foo
  @@var = 2
end

puts Foo.var # => 2
puts Bar.var # => 2

=begin

Wrong twice

Marwan:

Both Foo.var and Bar.var return 2.

Class variables are shared among the superclass and all the subclasses, so you can't change a class variable's value in a subclass without affecting the parent class.

=end