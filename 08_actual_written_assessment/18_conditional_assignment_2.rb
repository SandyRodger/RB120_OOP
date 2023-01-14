# frozen_string_literal: true

# Hi Sandy,

# You have done a great job with the question and requirements for your CP assignment. Thank you for including test code in your answer portion, this is really useful for grading your assignment.

# There is just one aspect that we would like you to work on for the answer part of your assignment. Currently, you have code related to individual subclasses in the Character class on lines 44, 45 and 46. Can you refactor your code to ensure all code that is specific to a class is within that class's definition please? While this won't change the functionality of your code, it will make it easier to read when trying to understand how the code works for a particular subclass.

module Pushable
  def force_push; end
end

module Hackable
  def hack_the_mainframe; end
end

module Evadable
  def evasive_maneuvers; end
end

class DeathStar
  def initialize
    @characters = []
  end

  def display_characters
    characters.each do |character|
      puts character
    end
  end

  def <<(other)
    characters << other
  end

  private

  attr_reader :characters
end

class Character
  @@activities = ['disable the tractor beam', 'hide in a trash compacter', 'disguise as a storm trooper']
  SHOOTING_SKILL = (0..100).freeze

  def initialize(name)
    @name = name
    @alive = true
    @fights = {}
  end

  def fight(other)
    if alive == false || other.alive == false
      :no_fight
    elsif name == other.name
      :no_fight
    elsif shooting_accuracy == other.shooting_accuracy
      :no_fight
    elsif self > other
      other.alive = false
      record_outcome(other, :won)
    elsif other > self
      self.alive = false
      record_outcome(other, :lost)
    end
  end

  protected

  def >(other)
    shooting_accuracy > other.shooting_accuracy
  end

  attr_accessor :alive, :fights
  attr_reader :shooting_accuracy, :name

  private

  attr_reader :weapons, :activity

  def to_s
    <<-HEREDOC
		********************************************************************
		This is #{name} the #{self.class}, armed with #{weapons}
		During the battle they #{activity}.
		#{fight_report}
		At the end of the battle #{name} is #{alive_or_dead}
		********************************************************************
    HEREDOC
  end

  def record_outcome(opponent, outcome_for_self)
    fights[opponent.name] = (outcome_for_self == :won ? :lost : :won)
    opponent.fights[name] = (outcome_for_self == :lost ? :lost : :won)
  end

  def fight_report
    output = ''
    fights.each do |opponent, result|
      case result
      when :lost
        if output.empty? == false
          output += format_new_line(winning_line(name, opponent))
          next
        end
        output += winning_line(name, opponent)
      when :won
        if output.empty? == false
          output += format_new_line(losing_line(name, opponent))
          next
        end
        output += losing_line(name, opponent)
      end
    end
    return "They didn't fight anyone during the battle." if output == ''

    output
  end

  def winning_line(name, opponent)
    "In a duel, #{name} slays #{opponent}."
  end

  def losing_line(name, opponent)
    "#{name} is struck down in battle by #{opponent}"
  end

  def alive_or_dead
    alive == true ? 'still alive' : 'dead'
  end

  def format_new_line(line)
    "\n#{' ' * 16}" + line
  end

  def assign_activity
    return 'shoot from behind crates' if @@activities.empty?
    return assign_storm_trooper_activity if self.class == StormTrooper

    activity = @@activities.sample
    @@activities.delete(activity)
  end

  def assign_storm_trooper_activity
    @@activities.each do |activity|
      unless ['disable the tractor beam', 'disguise as a storm trooper'].include?(activity)
        return @@activities.delete(activity)
      end
    end
    'shoot from behind crates'
  end

  def shooting_accuracy_calc(range = (0..100))
    range.to_a.sample
  end
end

class Jedi < Character
  include Pushable

  def initialize(name)
    @weapons = 'a blaster and a light saber'
    @activity = 'lightsaber duel'
    @shooting_accuracy = shooting_accuracy_calc
    super
  end
end

class Droid < Character
  include Hackable
  def initialize(name)
    @weapons = 'nothing'
    @activity = assign_activity
    @shooting_accuracy = shooting_accuracy_calc
    super
  end
end

class Mercenary < Character
  include Evadable
  SHOOTING_SKILL = (80..100).freeze
  def initialize(name)
    @weapons = 'a blaster'
    @activity = assign_activity
    @shooting_accuracy = shooting_accuracy_calc(SHOOTING_SKILL) unless self.class == StormTrooper
    super
  end
end

class StormTrooper < Mercenary
  def initialize(name)
    @shooting_accuracy = 0
    @activity = assign_activity
    super
  end
end

deathstar = DeathStar.new

deathstar << r2d2 = Droid.new('R2D2')
deathstar << han_solo = Mercenary.new('Han Solo')
deathstar << storm_trooper1 = StormTrooper.new('Jerry')
deathstar << storm_trooper2 = StormTrooper.new('Frank')
deathstar << darth_vader = Jedi.new('Darth Vader')

darth_vader.fight(r2d2)
storm_trooper1.fight(han_solo)
storm_trooper1.fight(r2d2)
storm_trooper1.fight(darth_vader)
storm_trooper2.fight(han_solo)
han_solo.fight(darth_vader)
han_solo.fight(r2d2)
han_solo.fight(han_solo)

deathstar.display_characters
