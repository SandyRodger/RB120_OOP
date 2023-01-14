#Why are we receiving the error message? 
#
#Complete the code so that a successful attack breaches a wall of HelmsDeep. When all walls are breached return a message showing that Gandalf arrives and wins the battle for the humans.

module HelmsDeep
	module Fourth
		class Wall
			@@breached = false
			def breached=(boolean)
				@@breached = boolean
			end
		end
		module Third
			class Wall
			 @@breached = false
			end
			module Second
				class Wall
					@@breached = false
				end
				module Last
					class Wall
						@@breached = false
					end
				end
			end
		end
	end
end

class UrukHai
	@@size_of_army = 0

	def initialize()
		@@size_of_army += 1
	end

	def self.attack(other, current_wall)
		if @@size_of_army > other.size_of_army
			current_wall.breached = true
			puts "#{self.leader} wins"
		else
			puts "#{other.leader} wins"
		end
	end

end

class Humans
	@@size_of_army = 0

	def initialize()
		@@size_of_army += 1
	end

	def size_of_army
		@@size_of_army
	end
end

uruk_warrior_1 = UrukHai.new
uruk_warrior_2 = UrukHai.new
uruk_warrior_3 = UrukHai.new
uruk_warrior_4 = UrukHai.new
uruk_warrior_5 = UrukHai.new
human_warrior_1 = Humans.new
human_warrior_2 = Humans.new
human_warrior_3 = Humans.new

p UrukHai.attack(Humans, HelmsDeep::Fourth::Wall)

