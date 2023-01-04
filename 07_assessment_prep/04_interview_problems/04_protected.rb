# describe what the code below outputs and why from Joseph Ochoa

# module Attackable
#   def attack
#     "attacks!"
#   end
# end

# class Characters
#   attr_accessor :name, :characters 
  
#   def initialize(name) 
#     self.name 
#     @characters = [] 
#   end
  
#   def display
#     name
#   end
  
#   protected 
#   attr_reader :name
#   attr_writer :name
# end

# class Monster < Characters
#   include Attackable
  
#   def initialize(name)
#     super
#   end
# end

# class Barbarian < Characters
#   def ==(other)
#     if(super.self == super.self) # 
#       super.self == super.self
#     end
#   end
# end

# conan = Barbarian.new('barb') 
# rob = Monster.new('monst')
# conan.characters << rob
# p conan.display

# nil, because at no point is @name assigned to a value. This code doesn't make a whole lot of sense. Below is my idea of what should be happening:

module Attackable
  def attack
    puts "#{self.name} attacks!"
  end
end

class Characters
  attr_accessor :name, :characters_arr 
  
  def initialize 
    @characters_arr = [] 
  end
  
  def display
    puts "The characters in this quest are #{characters_arr.map(&:name).join(" and ")}."
  end

	def <<(other)
		characters_arr << other 
	end

	def ==(other)
		if self.name == other.name
			puts "#{self.name} is #{other.name}"
		else
			puts "#{self.name} is not #{other.name}"
		end
  end
end

class Monster < Characters
  include Attackable
  
  def initialize(name)
    @name = name
  end
end

class Barbarian < Characters

	def initialize(name)
    @name = name
  end

end

characters = Characters.new
conan = Barbarian.new('Conan') 
rob = Monster.new('Rob')
characters << rob
characters << conan
characters.display
conan == rob
rob.attack
