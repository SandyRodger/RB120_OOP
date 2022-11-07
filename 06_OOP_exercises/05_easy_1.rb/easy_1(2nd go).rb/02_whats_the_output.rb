=begin

https://launchschool.com/exercises/c1b97807

Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
p fluffy 

=begin
class Pet
  attr_reader :name

  def initialize(name)
    @name = to_s(name)
  end

	def to_s(name)
    name.upcase!
    "My name is #{name}."
  end
end

name = 'Fluffy'  
fluffy = Pet.new(name)    
p fluffy.name # => "My name is FLUFFY."
# puts fluffy.name    #  => Fluffy
# puts fluffy					#  => My name is FLUFFY.
# puts fluffy.name		#  => FLUFFY
# puts name						#  => FLUFFY

=end