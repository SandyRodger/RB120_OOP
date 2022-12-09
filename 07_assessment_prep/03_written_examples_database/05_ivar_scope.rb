class Person
  def initialize(n)
    @name = n
  end
  
  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"

=begin

What does the above code demonstrate about how instance variables are scoped?

This code shows that ivars are scoped at the object level as `bob.get_name` does not have access to the @name ivar in `joe`. Both `joe` and `bob` would have access to class variables, which are scoped at the class level, but ivars are only accessible via the object that contains them.
=end