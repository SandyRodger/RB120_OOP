module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end

	class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
good_dog.walk
# good_dog.climb

def method_lookup_chain(obj, result = [obj.singleton_class])
  if obj.instance_of? Class
    return add_modules(result) if result.last == BasicObject.singleton_class
    r = result.last.superclass
    method_lookup_chain(obj, result << r)
  else
    return result + obj.class.ancestors
  end
end

def add_modules(classes)
  output = []
  classes.each_with_index do |class_, idx|
    output << class_
    next if class_ == classes.last
    output << (class_.included_modules - classes[idx+1].included_modules)
  end
  output.flatten
end

p method_lookup_chain(good_dog) # => [#<Class:#<GoodAnimals::GoodDog:0x00007ff394911a10>>, GoodAnimals::GoodDog, Danceable, Swimmable, Animal, Walkable, Object, Kernel, BasicObject]

=begin

What is the method lookup path used when invoking `#walk` on `good_dog`?

GoodDog < Danceable < Swimmable < GoodAnimals < Climbable < Animal < Walkable - incorrect, it does not look into GoodAnimals, because this is just for namespacing. It also never encounters Climbable, so good_dog.climb will raise an exception. 

GoodDog < Danceable < Swimmable       ...                 < Animal < Walkable < Object < Kernel < BasicObject

How do I check this?

=end