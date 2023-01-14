Where we got to:

2 

Complete the code so that a successful attack breaches a wall of HelmsDeep. When all walls are breached return a message showing that Gandalf arrives and wins the battle for the humans.

module HelmsDeep

  module First

    class Wall
      @@breached = false
      def self.breached=(boolean)
        @@breached = boolean
      end

      def self.breached?
        p @@breached
      end
    end

    module Second

      class Wall
        @@breached = true
        def self.breached?
          p @@breached
        end
      end

      module Third

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

# HelmsDeep::First::Second::Wall.breached?
# HelmsDeep::First::Wall.breached?

class UrukHai
  @@size_of_army = 0
  LEADER = "Saruman"
  @@current_wall = HelmsDeep::First::Wall

  def initialize()
    @@size_of_army += 1
  end

  def self.leader
    LEADER
  end

  def self.attack(other)
    # puts "The size of the UrukHai army is #{@@size_of_army}"
    # puts "The size of the Human army is #{other.size_of_army}"
    # puts "The current wall is #{current_wall}"
    if @@size_of_army > other.size_of_army
      @@current_wall.breached = true
      puts "#{self.leader} wins"
      puts "The #{@@current_wall} is breached"
      self.advance_wall(@@current_wall)
    else
      puts "#{other.leader} wins"
      puts "The #{@@current_wall} still stands"
    end
   
  end

  def self.advance_wall(current_wall)

    case @@current_wall
    when HelmsDeep::First::Wall
      @@current_wall = HelmsDeep::First::Second::Wall
    when HelmsDeep::First::Second::Wall
      @@current_wall = HelmsDeep::First::Second::Third::Wall
    when HelmsDeep::First::Second::Third::Wall
      @@current_wall = HelmsDeep::First::Second::Third::Wall
    when HelmsDeep::First::Second::Third::Last::Wall
      puts "Gandalf comes to save the humans"
    end
      
  end
end

class Humans
  LEADER = "Theoden"
  @@size_of_army = 0

  def initialize()
    @@size_of_army += 1
  end

  def leader
    LEADER
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
UrukHai.attack(Humans)
