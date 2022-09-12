class Alien
	def speak	
		"I come in peace"
	end
end

class Xenomorph < Alien
end

class Marsian < Alien
end

barry = Xenomorph.new
glenn = Marsian.new
puts barry.speak
puts glenn.speak