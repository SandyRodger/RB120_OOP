=begin

https://launchschool.com/exercises/40a2aede

Using the following code, create a class named Cat that tracks the number of times a new Cat object is instantiated. The @@total_num_of_cats number of Cat instances should be printed when ::@@total_num_of_cats is invoked.

kitty1 = Cat.new
kitty2 = Cat.new

Cat.@@total_num_of_cats

Expected output:

2

=end

class Cat
	@@total_num_of_cats = 0

	def initialize
		@@total_num_of_cats += 1
	end

	def self.total
		puts @@total_num_of_cats
	end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total