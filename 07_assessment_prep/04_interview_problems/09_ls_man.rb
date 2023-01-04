module Flightable
  def fly
		"I am #{self.name}, I am a #{self.class}, and I can fly!"
  end
end

module Statementable
	def self.announce
		puts "I am #{self}!"
	end

  def self.announce_ability
    puts "I fight crime with my #{ABILITY} ability!"
  end
end

class Superhero    
	attr_reader :name, :ability
  include Flightable
	include Statementable

  def initialize(name)
    @name = name
  end

	def self.fight_crime
		self.announce
		self.announce_ability
  end
end

class LSMan < Superhero
	include Statementable
	ABILITY = "coding skills"

	# def self.announce
	# 	puts "I am #{self}!"
	# end

  # def self.announce_ability
  #   puts "I fight crime with my #{ABILITY} ability!"
  # end
 end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')

#p superman.fly  == "I am Superman, I am a Superhero, and I can fly!"

LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!
