class Animal
  def move
  end
end

class Fish < Animal
  def move
    "swim"
  end
end

class Cat < Animal
  def move
    "walk"
  end
end

# Sponges and Corals don't have a separate move method - they don't move
class Sponge < Animal; end
class Coral < Animal; end

animals = [Fish.new, Cat.new, Sponge.new, Coral.new]
animals.each { |animal| p animal.move }