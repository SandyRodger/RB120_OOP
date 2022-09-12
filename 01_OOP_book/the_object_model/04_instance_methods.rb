#1

# class Soldier
# 	def initialize(weapon)
# 		@weapon = weapon
# 	end

# 	def action
# 		"charge with a #{@weapon}"
# 	end
# end

# danny_the_soldier = Soldier.new("rifle")
# philip_the_soldier = Soldier.new("sharpened spoon")
# p danny_the_soldier.action
# p philip_the_soldier.action

#2 

class Alien
	def initialize(limbs)
		@limbs = limbs
	end

	def action
		"wobble #{@limbs}"
	end
end

venusian = Alien.new("tentacles")
plutonian = Alien.new("proboscis")

p venusian.action
p plutonian.action