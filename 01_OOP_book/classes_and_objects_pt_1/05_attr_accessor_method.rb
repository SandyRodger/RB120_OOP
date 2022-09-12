class TastyFood
	attr_accessor :adjective, :food

	def initialize(adjective, food)
		@adjective = adjective
		@food = food
	end

	def describe
		"This #{food} tastes #{adjective}"
	end
end

porridge = TastyFood.new("amazing", "porridge")
puts porridge.describe