class MenuItem 
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end

class Desserts < MenuItem 
	def initialize(size, name)
		super(name)
		@size = size
	end
end

p Desserts.new('large', 'profiterol')
