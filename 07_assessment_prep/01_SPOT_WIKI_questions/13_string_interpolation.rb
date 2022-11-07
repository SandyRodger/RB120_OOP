class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name)
		# super
	end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name   

=begin

What is output and why?

=> "bark! bark!  bark! bark!" because @name has no value here. If we wanted to pass the name argument to the Animal initialize method and thereby cause it to be assigned to @name, we would use the 'super' keyword to pass up the argument. As it is the Dog initialize method takes a name argument but does nothing with it. 

=end