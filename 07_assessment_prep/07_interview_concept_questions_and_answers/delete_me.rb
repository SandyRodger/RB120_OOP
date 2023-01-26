class Animal

private
	def self.what
		"Animal"
	end
end

class Machine < Animal

	def self.compare(other)
		self.what == other.what
	end

private
	def self.what
		"Machine"
	end
end

p Machine.compare(Animal)