# From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 


	# with modules

	# module Attackable
	# 	def attack
	# 		"attacks!"
	# 	end
	# end

	# class Monster
	# 	include Attackable
	# end
	
	# class Barbarian
	# 	include Attackable
	# end

	# with inheritance
	
		# class Character
		# 	def attack
		# 		"attacks!"
		# 	end
		# end
	
		# class Monster < Character

		# end
		
		# class Barbarian < Character

		# end

# with duck-typing
	

	class Monster
		def attack
			"Tears with claws!"
		end
	end
	
	class Barbarian
		def attack
			"Slashes with axe!"
		end
	end

	[Monster.new, Barbarian.new].each do |character|
		puts character.attack
	end