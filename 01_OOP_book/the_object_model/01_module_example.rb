module Speak
	def speak(sound)
		puts sound
	end
end

class GoodDog
	include Speak
end

class HumanBeing
	include Speak
end

sparky = GoodDog.new
# sparky.speak("Arf!")
bob = HumanBeing.new
# bob.speak("Hello!")

# EXAMPLE 2

module Party
	def dance(type_of_dance)
		puts "you look great, doing the #{type_of_dance}"
	end

	def start_a_fight(person)
		puts "has a fight with #{person}"
	end

	def make_out(person)
		puts "makes out with #{person}"
	end
end

class Student
	include Party # here we are mixing in the Party module.
end

class Politician
	include Party
end

geoff = Student.new
geoff.make_out('Liz')
jerome = Politician.new
jerome.start_a_fight('Alistair')