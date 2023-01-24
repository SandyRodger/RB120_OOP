=begin

Update the Human class to have lines 11 and 14 return the desired output.

=end

class Human
	attr_reader :name

def initialize(name="Dylan")
	@name = name
end

def hair_color(color)
	"Hi, my name is #{name} and I have #{color} hair."
end

def self.hair_color(color)
	color = "blonde" if color.empty?
	"Hi, my name is #{self.new.name} and I have #{color} hair."
end
end

puts Human.new("Jo").hair_color("blonde")
#=> "Hi, my name is Jo and I have blonde hair."

puts Human.hair_color("")
#=> "Hi, my name is Dylan and I have blonde hair."