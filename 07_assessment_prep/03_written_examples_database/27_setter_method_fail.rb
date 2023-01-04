class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name

=begin
	
In the code above, we hope to output 'BOB' on line 16. Instead, we raise an error. Why? How could we adjust this code to output 'BOB'?

We need to prepend the code inside #change_name with `.self`. #change_name is a setter method and setter methods require `.self` to be prepended to the variables to specify the calling object is the class object, otherwise Ruby will read it as initializing a new local variable. This is what happens in the code above, except the new local variable is not given a value and so is equal to nil, which raises and exception when we try to call #upcase on it.

=end