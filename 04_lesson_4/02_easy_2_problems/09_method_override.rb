=begin

https://launchschool.com/lessons/f1c58be0/assignments/25448951

=end

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

	def play
		"This is how we play Bingo"
	end
end

# if we wrote  #play method in the bingo class and called it on a Bingo object then the call chai would encounter this method first, call it, and not see the #;lay method in the Game class. Demonstration below.

puts Bingo.new.play