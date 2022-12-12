module Flightable  
  def fly
    puts "I am a #{@name}, I am a #{self.class} and I can fly!"
  end
end

class Superhero
  include Flightable 
  
  attr_accessor :ability
  
  def self.fight_crime
    puts "I am #{self}"
    self.new("coding skills").announce_ability
  end
  
  def initialize(name)
    @name = name
  end
  
  def announce_ability
    puts "I fight crime with my #{ability} ability!"
  end
  
  def self.to_s
    "superman"
  end
end

class LSMan < Superhero 
  def self.to_s
    "LSMan"
  end
  
  def initialize(ability)
    @ability = ability
  end
end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')
superman.fly # => I am Superman, I am a superhero, and I can fly!
LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!