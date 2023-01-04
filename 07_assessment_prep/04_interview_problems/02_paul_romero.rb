# Problem received from Raul Romero
class Human 
	attr_reader :name

def initialize(name="Dylan")
	@name = name
end

def hair_colour(colour)
	"Hi, my name is #{name} and I have #{@@hair_colour = colour} hair."
end

def self.hair_colour(colour)
	"Hi, my name is #{Human.new.name} and I have #{@@hair_colour} hair."
end

end

puts Human.new("Jo").hair_colour("blonde")  
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_colour("")              
# Should "Hi, my name is Dylan and I have blonde hair."