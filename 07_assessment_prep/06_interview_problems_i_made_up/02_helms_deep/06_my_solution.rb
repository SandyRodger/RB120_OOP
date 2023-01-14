#Why are we receiving the error message? 
#
#Complete the code so that a successful attack breaches a wall of HelmsDeep. When all walls are breached return a message showing that Gandalf arrives and wins the battle for the humans.
require 'byebug'

module HelmsDeep
	module First
		class Wall
			def self.breached=(boolean)
				@@breached = boolean
			end
			@@breached = false
		end
		module Second
			class Wall
				def self.breached=(boolean)
					@@breached = boolean
				end
			 @@breached = false
			end
			module Third
				class Wall
					def self.breached=(boolean)
						@@breached = boolean
					end
					@@breached = false
				end
				module Final
					class Wall
						def self.breached=(boolean)
							@@breached = boolean
						end
						@@breached = false
					end
				end
			end
		end
	end
end

class UrukHai
	attr_reader :leader
	@@size_of_army = 0
	@@current_wall = HelmsDeep::First::Wall
	LEADER = "Saruman"

	def initialize()
		@@size_of_army += 1
	end

	def self.advance_wall
    if  @@current_wall == HelmsDeep::First::Wall
      @@current_wall = HelmsDeep::First::Second::Wall
		elsif @@current_wall == HelmsDeep::First::Second::Wall
      @@current_wall = HelmsDeep::First::Second::Third::Wall
    elsif @@current_wall == HelmsDeep::First::Second::Third::Wall
      @@current_wall = HelmsDeep::First::Second::Third::Final::Wall
    elsif @@current_wall == HelmsDeep::First::Second::Third::Final::Wall
			@@current_wall = "the keep"
    end
  end

	def self.wall_parser
		wall_arr = @@current_wall.to_s.split("::")
		"the #{wall_arr[-2]} wall at #{wall_arr[0][0..4]} #{wall_arr[0][5..8]}"
	end

	def self.ending_message
		puts "It looks like #{LEADER} has won."
		puts "... but Gandalf comes to save the day"
	end

	def self.attack(other)
		if @@size_of_army > other.size_of_army
			@@current_wall.breached = true
			puts "#{wall_parser} is breached"
			self.advance_wall
			puts "The Uruk Hai now begin the attack on the keep" if @@current_wall == "the keep"
			return ending_message if @@current_wall == 'the keep'
			puts "The Uruk Hai now begin the attack on #{wall_parser}"
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

	def self.size_of_army
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

UrukHai.attack(Humans)
UrukHai.attack(Humans)
UrukHai.attack(Humans)
UrukHai.attack(Humans)

