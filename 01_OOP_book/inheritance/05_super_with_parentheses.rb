class Warrior
	def initialize
	end
end

class Archer < Warrior
	def initialize(gear)
		super()
		@gear = gear
	end
end

giles = Archer.new("chain-mail")
p giles