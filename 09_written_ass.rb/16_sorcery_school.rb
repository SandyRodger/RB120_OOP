# frozen_string_literal: true

require 'byebug'
#
# This exercise asks you to create a class design for a fake "Sorcery School Application."
#
# Each student attending this Sorcery School will be a Sorcery Student.
#
# Each sorcery student is studying a particular school of sorcery. Therefore, each sorcery student is either an Illusionist, Enchanter, Necromancer, or Conjurer.
#
# Each sorcery student will have a magical energy, a unique spell, an artifact, and a robe color.
#
# None of these values should be publicly accessible. Likewise, no values should be altered after a sorcery student is created.
#
# Each sorcery student's magical energy will be determined by a #calc_magical_energy method that returns a random number between 100-200. This method should not be accessible publicly.
#
# Each sorcery student will have a unique spell automatically assigned to them at the time of their creation. The spells available are; fireball, earthquake, wall of water, and lightning bolt. No sorcery student should have the same spell as another student. If these four spells are already assigned to sorcery students, all additional spells assigned as a student's unique spell will be labeled 'TBD'. Because these spells are taught by the sorcery school, this behavior should be contained within a SorcerySchool class, which has no relation to any sorcery students.
#
# A sorcery student's magical artifact and robe color are determined by the school of sorcery they are studying:
#
# An illusionist's magic artifact is a crystal ball, and their robes are purple.
# An enchanter's magic artifact is a crystal ball, and their robes are gold.
# A necromancer's magic artifact is a wooden staff, and their robes are black.
# A conjurer's magic artifact is a silver wand, and their robes are green.
# Enchanters are a special type of Illusionist and have a magical energy higher than the rest of the sorcerers. Their magical energy range is between 150-250.
#
# Necromancer's should have access to a #create_zombie method and their magical energy is slightly lower than the rest of the sorcery students. Their magical energy range is between 75-175.
#
# Conjurers and Necromancers both have the ability to manipulate the fabric of time and should have access to a #time_stop method.
#
# Illusionists, Enchanters, and Conjurer's are able to alter how people see the world, so they should have access to a #mirage method.
#
# If you pass a sorcery student to the #puts method, it should print information about the student in this format:
#
#
# ============================
# School of Sorcery: Enchanter
# Magical Energy: 145
# Unique Spell: fireball
# Artifact: crystal ball
# Robe Color: purple
# ============================
# Create a set of classes based on the description of the Sorcery School application. Your classes should show any inheritance relationships, module inclusions, and methods necessary to meet the requirements.
#
# This exercise is about designing class relationships and how you organize your classes, behaviors, and state. Your methods should provide the details needed to fulfill the requirements. In some cases, you may be able to omit the method body entirely. However, please don't include any functionality that we don't describe above.
#
# Your Answer

# module Necromacable
#     def create_zombie; end
# end

# module Miragable
#     def mirage; end
# end

# module TimeStoppable
# def time_stop; end
# end

# class SorcerySchool

#     SPELLS = ['fireball', 'earthquake', 'wall of water', 'lightening bolt']
#     SCHOOLS = {
#         "Illusionist" => ['crystal ball', 'purple'],
#         "Enchanter" => ['crystal ball', 'gold'],
#         "Necromancer" => ['wooden staff', 'black'],
#         "Conjurer" => ['silver wand', 'green']
#     }

#     def initialize
#         @@assigned_spells = []
#     end

#     def assign_spell
#         current_spells = SorcerySchool::SPELLS
#         loop do
#             spell = current_spells.sample
#             if @@assigned_spells.include?(spell)
#                 current_spells.delete(spell)
#             elsif current_spells.empty?
#                 return 'TBD'
#             else
#                 @@assigned_spells << spell
#                 return spell
#             end
#         end
#     end

#     def to_s
#         puts "============================"
#         puts "School of Sorcery: #{school}"
#         puts "Magical Energy: #{magical_energy}"
#         puts "Unique Spell:  #{unique_spell}"
#         puts "Artifact: #{artifact}"
#         puts "Robe Color: #{robe_color}"
#         puts "============================"
#     end

# end

# class SorceryStudent < SorcerySchool

#     def initialize(magical_energy, unique_spell, artifact, robe_color)
#         @magical_energy = magical_energy
#         @unique_spell = assign_spell
#         @artifact = SorcerySchool::SCHOOLS[school[0]]
#         @robe_color = SorcerySchool::SCHOOLS[school[1]]
#     end

#     def calc_magical_energy
#         loop do
#             if school == :enchanter
#                 n = Random.new.rand(200)
#                 return  n if n >= 150
#             elsif school == :necromancer
#                 n = Random.new.rand(175)
#                     return  n if n >= 75
#             else
#                 n = Random.new.rand(200)
#                 return  n if n >= 100
#             end
#         end
#     end

#     private

#     attr_reader :magical_energy, :unique_spell, :artifact, :robe_color, :school
# end

# class Necromancer < SorceryStudent
#     include Necromacable
#     include TimeStoppable

#     def initialize(magical_energy, unique_spell, artifact, robe_color)
#         @school = self.class
#         super(magical_energy, unique_spell, artifact, robe_color)
#     end
# end

# class Illusionist < SorceryStudent
#     include Miragable
#     def initialize(magical_energy, unique_spell, artifact, robe_color)
#         @school = self.class
#         super(magical_energy, unique_spell, artifact, robe_color)
#     end
# end

# class Enchanter < SorceryStudent;
#     include Miragable
#     def initialize(magical_energy, unique_spell, artifact, robe_color)
#         @school = self.class
#         super(magical_energy, unique_spell, artifact, robe_color)
#     end
# end

# class Conjurer < SorceryStudent
#     include TimeStoppable
#     include Miragable

#     def initialize(magical_energy, unique_spell, artifact, robe_color)
#         @school = self.class
#         super(magical_energy, unique_spell, artifact, robe_color)
#     end

# end

# Responses
#
# Clare MacAdie (TA)
# about 3 hours ago
# This is a decent effort, but there are some issues.
#
# Currently, all of the subclasses of the SorceryStudent class require four arguments to be passed in when objects are instantiated from them. However, @artifact and @robe_color are overwritten in the SorceryStudent#initialize method. Additionally, SorceryStudent#calc_magical_energy is not invoked anywhere (and is incorrect for enchanters and illusionists) and the SorcerySchool#assign_spell method is a bit convoluted. Can you fix these issues please?
#
# A hint for #cal_magical_energy is to be aware of the following requirement:
#
# Each sorcery student's magical energy will be determined by a #calc_magical_energy method that returns a random number between 100-200. This method should not be accessible publicly.
#
# Try to implement this method only once in the SorceryStudent class and utilise its return. Make adjustments to the return as required for each particular type of student. Additionally, ensure that it is not available publicly.
#
# You haven't implemented this requirement:
#
# Enchanters are a special type of Illusionist and have a magical energy higher than the rest of the sorcerers. Their magical energy range is between 150-250.
#
# Also, be mindful of the indenting of your code.
#
# Finally, your SorceryStudent#to_s method works fine, but consider using HEREDOC for multi-line strings 😉.
#
#
# Sandy Rodger
# about an hour ago
# Thank you for your comments Clare. Here is the corrected code:
#

# module Necromancable
#   def create_zombie; end
# end

# module Miragable
#   def mirage; end
# end

# module TimeStoppable
#   def time_stop; end
# end

# class SorcerySchool
#   SPELLS = ['fireball', 'earthquake', 'wall of water', 'lightening bolt'].freeze
#   SCHOOLS = {
#     'Illusionist' => ['crystal ball', 'purple'],
#     'Enchanter' => ['crystal ball', 'gold'],
#     'Necromancer' => ['wooden staff', 'black'],
#     'Conjurer' => ['silver wand', 'green']
#   }.freeze

#   def initialize
#     @@assigned_spells = []
#   end

#   def assign_spell
#     SPELLS.each do |spell|
#       unless @@assigned_spells.include?(spell)
#         @@assigned_spells << spell
#         return spell
#       end
#     end
#     'TBD'
#   end

#   def to_s
#     <<-HEREDOC
#             ============================
#             School of Sorcery: #{school}
#             Magical Energy: #{magical_energy}
#             Unique Spell:  #{unique_spell}
#             Artifact: #{artifact}
#             Robe Color: #{robe_color}
#             ============================
#     HEREDOC
#   end
# end

# class SorceryStudent < SorcerySchool
#   ENERGY_RANGE = (100..200).freeze

#   def initialize
#     @school = self.class
#     @magical_energy = calc_magical_energy
#     @unique_spell = assign_spell
#     @artifact = SCHOOLS[self.class.to_s][0]
#     @robe_color = SCHOOLS[self.class.to_s][1]
#   end

#   private

#   attr_reader :magical_energy, :unique_spell, :artifact, :robe_color, :school

#   def calc_magical_energy
#     Random.new.rand(self.class::ENERGY_RANGE)
#   end
# end

# class Necromancer < SorceryStudent
#   include Necromancable
#   include TimeStoppable
#   ENERGY_RANGE = (75..175).freeze
# end

# class Illusionist < SorceryStudent
#   include Miragable
# end

# class Enchanter < SorceryStudent
#   include Miragable
#   ENERGY_RANGE = (150..250).freeze
# end

# class Conjurer < SorceryStudent
#   include TimeStoppable
#   include Miragable
# end

# hogwarts = SorcerySchool.new
# puts harry = Conjurer.new
# puts draco = Necromancer.new
# puts hermione = Illusionist.new
# puts ron = Enchanter.new
# puts cho = Illusionist.new

#
# Good work on this, there are just a couple of wrinkles to iron out!
#
# You have corrected the issue with the #initialize parameters for the students, and this now works fine. An alternative to using an array for the artifacts and robes would be to use a hash instead, to make your code more readable. Even better would be to hard code these values into each subclass itself in individual #initialize methods, so that the information pertaining to each type of student is contained within its class definition. However, your solution is fine and does the job!
#
# Well done for simplifying the unique spells functionality. An alternative (and arguably simpler) design is to use only a class variable in SorcerySchool to store the spells (rather than a constant) and then use Array#sample in SorcerySchool#assign_spell and remove them from the class variable each time you assign one. You then wouldn't need a SorcerySchool#initialize method and you also wouldn't need to instantiate an object of the SorcerySchool class to create a student. Can you try refactoring your code to do this please?
#
# You've done a good job refactoring SorceryStudent#calc_magical_energy according to my instructions. However, it doesn't always return a value between 100-200. If it was defined like this:
#
# def calc_magical_energy
#   (100..200).to_a.sample
# end
# Can you think of a way to invoke this method in each of the student subclasses (perhaps in an #initialize method 😉) and then add/subtract a value accordingly for those students that have a different range?
#
# Enchanters are still not special types of Illusionist. Can you implement this requirement please?
#

module Necromancable
  def create_zombie; end
end

module Miragable
  def mirage; end
end

module TimeStoppable
  def time_stop; end
end

class SorcerySchool
  SCHOOLS = {
    'Illusionist' => { artifact: 'crystal ball', robe_color: 'purple' },
    'Enchanter' => { artifact: 'crystal ball', robe_color: 'gold' },
    'Necromancer' => { artifact: 'wooden staff', robe_color: 'black' },
    'Conjurer' => { artifact: 'silver wand', robe_color: 'green' }
  }.freeze

  @@available_spells = ['fireball', 'earthquake', 'wall of water', 'lightening bolt']

  def assign_spell
    return 'TBD' if @@available_spells.empty?

    spell = @@available_spells.sample
    @@available_spells.delete(spell)
  end

  def to_s
    <<-HEREDOC
            ============================
            School of Sorcery: #{school}
            Magical Energy: #{magical_energy}
            Unique Spell:  #{unique_spell}
            Artifact: #{artifact}
            Robe Color: #{robe_color}
            ============================
    HEREDOC
  end
end

class SorceryStudent < SorcerySchool
  def initialize
    @school = self.class
    @unique_spell = assign_spell
    @artifact = SCHOOLS[self.class.to_s][:artifact]
    @robe_color = SCHOOLS[self.class.to_s][:robe_color]
  end

  private

  attr_reader :magical_energy, :unique_spell, :artifact, :robe_color, :school

  def calc_magical_energy
    (100..200).to_a.sample
  end
end

class Necromancer < SorceryStudent
  include TimeStoppable
  include Necromancable
  def initialize
    @magical_energy = calc_magical_energy - 25
    super
  end
end

class Illusionist < SorceryStudent
  include Miragable
  def initialize
    @magical_energy = calc_magical_energy if self.class == Illusionist
    super
  end
end

class Enchanter < Illusionist
  def initialize
    @magical_energy = calc_magical_energy + 50
    super
  end
end

class Conjurer < SorceryStudent
  include Miragable
  include TimeStoppable
  def initialize
    @magical_energy = calc_magical_energy
    super
  end
end

puts harry = Conjurer.new
puts draco = Necromancer.new
puts hermione = Illusionist.new
puts ron = Enchanter.new
puts cho = Illusionist.new
