class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end

end

sparky = GoodDog.new("Sparky", 4)
puts sparky # => #<GoodDog:0x00007fcbbf02d630>

=begin

What is output and why? How could we output a message of our choice instead?
How is the output above different than the output of the code below, and why?

Above is output the class object, #<GoodDog:0x00007fcbbf02d630>, without any ivars. This is because we are passing the object to the #puts method, which uses #to_s in its implementation. This only prints the class and the object_id. Below we pass the object to #p instead of #puts. #p causes #inspect to be called which outputs the object id and ivars of the object. If we wrote a #to_s method within the GoodDog class we could modify how #puts prints the object. For example:

	def to_s
		"This is #{name} and they are #{age} years old."
	end

# => This is Sparky and they are 28 years old.

The other difference between the two code examples is the use of `self.` instead of @ when initializing the two ivars. The functionality is the same in both examples, but the use of @ is better practice because using `self` where it's not strictly neccesary (such as in initialization) can be confusing.
=end

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky # => #<GoodDog:0x00007fabe884d410 @name="Sparky", @age=28>