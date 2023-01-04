class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name # => nil

=begin

What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?

nil is output because the @name ivar has not been instantiated. This is because although the setter method is defined it is not called. This is a key difference between ivars and local vars because a local var does not need to be instantiated in order to be assigned to a value. 

=end