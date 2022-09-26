class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal.name
  end
  
  def +(other_class)
		other_class.animals.each {|a| animals << a}
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
mammals << Animal.new('Cat')   # mammals = animal_class_object< @name=Mammals, @animals = ['Human', 'Dog', 'Cat']
# p mammals.animals

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')  # birds = animal_class_object< @name=Birds, @animals = ['Eagle', Blue Jay', 'Penguin]
# p birds.animals

some_animal_classes = mammals.animals + birds.animals

p some_animal_classes
p mammals.animals
p birds.animals

# [Human, Dog, Cat, Eagle, Blue Jay, Penguin] is what I expected. I actually got:

# [#<Animal:0x00007fd30490b170 @name="Human">, #<Animal:0x00007fd304909aa0 @name="Dog">, #<Animal:0x00007fd304908b78 @name="Cat">, #<Animal:0x00007fd304908830 @name="Eagle">, #<Animal:0x00007fd304908768 @name="Blue Jay">, #<Animal:0x00007fd3049086c8 @name="Penguin">]

# What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?