# 2 Complete the code so that a successful attack breaches a wall of HelmsDeep. When all walls are breached return a message showing that Gandalf arrives and kills wins the battle for the humans.

module HelmsDeep
	@@breached = false
	module SeventhWall
		@@breached = false
		module FifthWall
			@@breached = false
			module ThirdWall
				@@breached = false
				module FirstWall
					@@breached = false
				end
			end
		end
	end
end

class SarumansArmy
	@@size_of_army = 0

	def initialize
		@@size_of_army += 1
	end

	def attack()
		if @@size_of_army > (0..10).to_a.sample
			# enter code here
		else
			# enter code here
	end

end

class TheodensArmy
	@@size_of_army = 0
	
	def initialize
		@@size_of_army += 1
	end

	def self.attack(other)
		if @@size_of_army > other.size_of_army
			# enter code here
		else
			# enter code here
	end

end

uruk_warrior_1 = SarumansArmy.new
uruk_warrior_2 = SarumansArmy.new
uruk_warrior_3 = SarumansArmy.new
uruk_warrior_4 = SarumansArmy.new
uruk_warrior_5 = SarumansArmy.new
human_warrior_1 = TheodensArmy.new
human_warrior_2 = TheodensArmy.new
human_warrior_3 = TheodensArmy.new
human_warrior_4 = TheodensArmy.new