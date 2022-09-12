class GoodDog
  def initialize(name)
    @name = name
  end
# This is a 'getter' method:
	def get_name
		@name
	end
# This is a 'setter' method: 
# 'getter', 'setter' and 'instance variable' should all have the same name.
	def set_name=(name)
		@name= name
		"quentin" # => ignored
	end
# setter methods always return the value passed in, regardless of what happens inside the method. Ay artempt to retrun something else is ignored.
  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
p sparky.speak # => "Sparky says Arf!"
p sparky.get_name # => "Sparky"
sparky.set_name = "Framboise"
p sparky.get_name # => "Framboise"
