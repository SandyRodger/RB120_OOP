class TastyFruit
	BASE_MOLDINESS = 0.8

	attr_accessor :name, :days_since_bought, :moldiness

	def initialize(n, d)
		self.name = n
		self.days_since_bought = d
		self.moldiness = BASE_MOLDINESS * d
	end
end

mango = TastyFruit.new('Mango', 4)
puts mango.moldiness

