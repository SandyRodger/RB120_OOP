# Complete the code so that it outputs as indicated.

module StarWarsCharacters
	class Goodies

	end

	class Baddies

	end
end

module StarTrekCharacters
	class Goodies

	end

	class Baddies

	end
end

class CrossoverUniverse

end

jean_luc_piccard = StarTrekCharacters::Goodies.new("Jean-luc Piccard", "to lead the USS Enterprise to new frontiers")
luke_skywalker = StarWarsCharacters::Goodies.new("Luke Skywalker", "brings of balance to the force")
khan = StarTrekCharacters::Baddies.new("Khan", 'attempts to take over the USS Enterprise')
palpatine = StarWarsCharacters::Baddies.new("Emperor Palpatine", "reconcile fathers and sons with role play")

CrossoverUniverse.swap(jean_luc_piccard, palpatine)
CrossoverUniverse.swap(khan, palpatine)

# output:

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Jean-Luc Piccard and Emperor Palpatine meet in a parallel universe
# They decide to swap roles.
# Jean-Luc Piccard returns to reconcile fathers and sons with role play
# Emperor Palpatine to lead the USS Enterprise to new frontiers
# and everyone is much happier.
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Khan and Emperor Palpatine meet in a parallel universe
# They decide to swap roles.
# Khan returns to lead the USS Enterprise to new frontiers
# Emperor Palpatine returns to attempt to take over the USS Enterprise
# and everyone is much happier.
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++