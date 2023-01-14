class Soldiers
  attr_accessor :army_size

  def initialize
    @army_size = 1
  end

  def add_soldier
    self.army_size += 1
  end
end


class Urukhai < Soldiers
  def attack(enemy, enemy_wall)
    if self.army_size > enemy.army_size
      enemy_wall.breach
      enemy_wall.still_standing if enemy_wall.wall.any?
      new_attack?(enemy, enemy_wall)
    else
      puts "The #{enemy_wall.wall.first} was defended!"
    end
  end

  def new_attack?(enemy, enemy_wall)
    if enemy_wall.wall.any?
      self.attack(enemy, enemy_wall)
    else
      puts "We have won the war for Saruman!"
      puts "Oops, here comes Gandalf!"
    end
  end
end

class Humans < Soldiers
end

class HelmsDeep
  attr_accessor :wall

  WALLS = ["first", "second", "third", "last"]
  def initialize
    @wall = WALLS
  end

  def breach
    breached_wall = self.wall.shift
    puts "The #{breached_wall} wall is breached!"
    puts
  end

  def still_standing
    self.wall.each do |w|
      puts "The #{w} wall is still standing."
    end
    puts
  end
end


urukhai = Urukhai.new
human = Humans.new

urukhai.add_soldier
urukhai.add_soldier
human.add_soldier

helm = HelmsDeep.new

urukhai.attack(human, helm)