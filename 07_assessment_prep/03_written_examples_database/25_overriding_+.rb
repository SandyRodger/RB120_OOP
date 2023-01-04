=begin

What is output? Is this what we would expect when using AnimalClass#+? If not, how could we adjust the implementation of AnimalClass#+ to be more in line with what we'd expect the method to return?

This code outputs an array containing 6 Animal objects. It would be more readable to have the output array contain only the names of the objects. We can achieve this by changing the functionality in AnimalClass#+ method to the following:

animals.map(&:name) + other_class.animals.map(&:name)

This transforms the @animals arrays into arrays of only their names before concatenating them together.


=end

class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes 
