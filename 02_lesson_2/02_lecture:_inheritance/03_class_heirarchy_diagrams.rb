class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
	def swim
		"can't swim!"
	end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

pete.run                # => "running!"
# Pet > run
pete.speak              # => NoMethodError
# Pet > Object > Kernel > BasicObject
kitty.run               # => "running!"
# Cat > Pet > run
kitty.speak             # => "meow!"
# Cat > speak
kitty.fetch             # => NoMethodError
# Cat > Pet > Object > Kernel > BasicObject
dave.speak              # => "bark!"
# Dog > speak
bud.run                 # => "running!"
# Bulldog > Dog > Pet > run
bud.swim                # => "can't swim!"
# Bulldog > swim