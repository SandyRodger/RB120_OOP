# Problem received from Raul Romero

class Human 
  attr_reader :name 
  
  def initialize(name)
		@name = name
  end
 
	def equal?(other_human)
		self.name == other_human.name
	end

	def +(other_human)
		self.name + other_human.name
	end
end

gilles = Human.new("gilles") 
anna = Human.new("anna") 

puts anna.equal?(gilles) #should output true
puts anna + gilles # should output annagilles 