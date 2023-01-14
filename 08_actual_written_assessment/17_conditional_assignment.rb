# frozen_string_literal: true

#
# Hi Sandy,
#
# After reviewing your performance on this assessment with Clare, we believe that you're almost ready to move forward, but you need some additional work. Therefore, your grade is a Conditional Pass. Please see our Assessment Rules for what a Conditional Pass means for you.
#
# Overall, you communicated a good understanding of the material. Many answers were well-written and demonstrated knowledge of the course materials. A few points were lost because of imprecision or mising details, which also impacted your non-technical grade (along with not formatting code correctly). You addressed these isues well in the revisions.
#
# Many points were lost on Q16, where some of the requirements were not met initially, and then needed a second revision to get everything squared off. Therefore, to complete the conditional pass, we would like you to write an exam question that is a similar style to Q16.
#
# Your assignment should comprise:
#
# a question statement - this should ask the student to create a class design for a concept of your choosing.
# a list of requirements - aim for approximately 10 requirements and make sure these are clear so that a student would know what the grader is looking for.
# an answer that would receive full points - this should be correctly formatted code that is easy to understand.
#
# We hope you have fun with completing this assignment and come up with something imaginative. This will provide an opportunity to spend a bit more time thinking about the concepts explored in this course, as well as practice implementing them in code.
#
# Please post your CP assignment here in the conversation tab, and don't hesitate to reach out if you have any questions.
#
# Conditional Requirement/s were added on Jan 6, 2023 at 11:11 AM EST by Christopher Brum
#
# My Answer:

# Create a class design that models a sci-fi battle drawing on the Star Wars movies.

# 1. The battle happens inside the 'Death Star' space-station and each person is a Character.

# 2. Characters are either a Jedi, Droid, Storm_Trooper or Mercenary.

# 3. Each Character will have the following attributes, which are not to be changed after they are assigned:
#                   - a name.
#                   - a main activity they do during the battle.
#                   - a shooting accuracy.
# 										- a weapon

# 4. The default weapon is 'a blaster'. Droids have an Ewok sling-shot. Jedis have a 'light saber and a blaster'.

# 5. Shooting accuracy is a percentage and will be determined by a shooting_accuracy_calc method, which should not be publicly accessible. Storm_troopers' shooting accuracy is always 0. Mercenaries score from 80% upwards.

# 7. The activities of the characters are assigned at creation and can be one of the following:

# - lightsaber duel
# - disable the tractor beam
# - hide in a trash compacter
# - disguise as a storm trooper
# - shoot from behind crates

#  Activities are unique with the exception of 'shoot from behind crates', which is available to all and 'lightsaber duel', which is exclusively assigned to Jedis.
#  Storm troopers won't 'disguise as a storm trooper' or 'disable the tractor beam'
#  Otherwise activities are assigned randomly.

# 8.All Jedis can 'force push'.
#   All Droids can 'hack the mainframe'
#   All mercenaries can do 'evasive maneuvers'

# 9. Characters will be able to fight each other, the winner of these fights will be determined by comparing shooting accuracy. The comparison in these fights will not be publicly accessible. If opponents are equally matched the fight doesn't occur. When a character loses a fight they die. After they are dead they cannot fight.

# 10. Storm Troopers are a type of mercenary

# 11. The Death Star should be able to present each character and their actions in a readable format using #puts. An account should be given of the fights and their outcomes. The following should be used as a template:

#                 ********************************************************************
#                 This is Darth Vader the Jedi, armed with a blaster and a light saber
#                 During the battle they lightsaber duel.
#                 The odds of them surviving are about average.
#                 In a duel, Darth Vader slays R2D2.
#                 Darth Vader is struck down in battle by Han Solo
#                 At the end of the battle Darth Vader is dead
#                 ********************************************************************

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

  def initialize(name)
    @name = name
    @weapons = 'a blaster' if [Mercenary, StormTrooper].include?(self.class)
    @activity = assign_activity unless self.class == Jedi
    @shooting_accuracy = shooting_accuracy_calc unless self.class == StormTrooper
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

  def shooting_accuracy_calc
    self.class == Mercenary ? (80..100).to_a.sample : (0..100).to_a.sample
  end
end

class Jedi < Character
  include Pushable
  def initialize(name)
    @weapons = 'a blaster and a light saber'
    @activity = 'lightsaber duel'
    super
  end
end

class Droid < Character
  include Hackable
  def initialize(name)
    @weapons = 'nothing'
    super
  end
end

class Mercenary < Character
  include Evadable
end

class StormTrooper < Mercenary
  def initialize(name)
    @shooting_accuracy = 0
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

=begin

POST-SUBMISSION WORRIES:

1. If droids don't have weapons, should they really be able to duel? Or have a shooting accuracy?
2. If a Jedi is duelling, is that a #fight? Should it be stored in the fights record?
3. Should droids/ darth vader be able to disguise as storm troopers?
4. Should rebels be able to fight imperials? Han solo v. R2D2 / Darth Vader v. Storm trooper
5. It's just too long and convoluted. It was meant to be clear instructions for a student. What's with all these helper methods? Those aren't in the instructions?

=end