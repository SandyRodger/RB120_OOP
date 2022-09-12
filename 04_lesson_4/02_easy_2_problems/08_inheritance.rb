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
end

game_1 = Bingo.new
puts game_1.play