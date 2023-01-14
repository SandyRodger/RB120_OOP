class Urukhai
  @@army_size = 0

  def initialize
    @@army_size += 1
  end

  def self.army_size
    @@army_size
  end

  def self.attack(enemy, enemy_wall)
    if self.army_size > enemy.army_size
      enemy_wall.breach
      enemy_wall.still_standing if enemy_wall.wall.any?
      new_attack?(enemy, enemy_wall)
    else
      puts "The #{enemy_wall.wall.first} was defended!"
    end
  end

  def self.new_attack?(enemy, enemy_wall)
    if enemy_wall.wall.any?
      self.attack(enemy, enemy_wall)
    else
      puts "We have won the war for Saruman!"
      puts "Oops, here comes Gandalf!"
    end
  end
end

class Humans
  @@army_size = 0

  def initialize
    @@army_size += 1
  end

  def self.army_size
    @@army_size    
  end
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


soldier1 = Urukhai.new
soldier2 = Urukhai.new
soldier3 = Urukhai.new
soldier1 = Humans.new
soldier2 = Humans.new

helm = HelmsDeep.new

Urukhai.attack(Humans, helm)