=begin

https://launchschool.com/lessons/f1c58be0/assignments/25448951

What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

=end

class BeesWax
	attr_accessor :type
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

p BeesWax.new('lavender')