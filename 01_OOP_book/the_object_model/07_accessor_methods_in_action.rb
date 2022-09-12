class GoodDog
	attr_accessor :name, :height, :weight

	def initialize(n, h, w)
		@name = n
		@height = h
		@weight = w
	end

	def speak
		"#{name} say arf!"
	end

	def change_info(n, h, w)
		@name = n
		@height = h
		@weight = w
	end

	def info
		"#{name} weighs #{weight} and is #{height} tall."
	end
end

sparky = GoodDog.new('Sparky', '12 inches', '4k')
puts sparky.info

sparky.change_info('Snuffles', '25 metres', 'as much as a double-decker bus')
puts sparky.info