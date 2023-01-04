module Speakable
	def speak
		puts "I am speaking"
	end
end

module Moveable
	def move
		puts "I am moving"
	end
end

module Identifyable
	def self.identify
		puts "I am a #{self}"
	end
end

class Person
	include Speakable, Moveable, Identifyable
end

Person.new.speak # I am speaking
Person.new.move # I am moving
Identifyable.identify # I am a Identifyable
Person.new.identify # NoMethod error
