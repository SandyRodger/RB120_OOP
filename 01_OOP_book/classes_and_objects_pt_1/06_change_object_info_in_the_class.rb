class MagicalCreature
	attr_accessor :name, :power, :location

	def initialize(n, po, l)
		@name = n
		@power = po
		@location = l
	end

	def change_info(n, po, l)
		self.name = n
		self.power = po
		self.location = l
	end

	def display_info
		"You can find #{name}s at #{location}, but beward their #{power}!"
	end
end

pixie = MagicalCreature.new('pixie', 'flying attack', 'the end of your garden') 
p pixie.display_info
pixie.change_info('Irish pixie', 'poking with magic sticks', 'laundromats')
p pixie.display_info
