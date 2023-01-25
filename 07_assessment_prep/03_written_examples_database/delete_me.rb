class Grandpa
  def cough
		puts "cough"
	end
end

class Pa < Grandpa
	def fart
		puts "fart"
	end
end

class Child < Pa
	def cry
		puts "cry"
	end
end

pa = Pa.new
pa.cough
pa.fart
Child.new.cry