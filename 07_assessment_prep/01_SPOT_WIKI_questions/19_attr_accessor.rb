=begin

What is the `attr_accessor` method, and why wouldn’t we want to just add `attr_accessor` methods for every instance variable in our class? Give an example.

=> Because we want to expose the minimum amount of data to the rest of the code in order to make it as secure as possible.

For instance, below does not allow the user to change or reader the price, but they can ask if it was expensive. This controls the information accessable by the user.

=end

class Book
	attr_accessor :title

	def initialize(title, price)
		@title = title
		@price = price
	end

	def was_it_expensive?
		if price > 15
			puts "yes, it was"
		else
			puts "no, not really"
		end
	end
	protected

	attr_reader :price
end

stephanie_meyer = Book.new('New Moon', 20)
# p stephanie_meyer.price # => NoMethodError
stephanie_meyer.was_it_expensive? #=> no, not really
