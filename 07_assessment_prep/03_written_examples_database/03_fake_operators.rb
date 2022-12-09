=begin

How and why would we implement a fake operator in a custom class? Give an example.

Fake operators are really methods which Ruby presents as operators in order to make the code more readable. We can override these methods in custom classes. One reasons to do this is to specify which part of an object should be compared. This is demonstrated below where we compare the bags by how many marbles they have.

=end

class BagOfMarbles
	attr_reader :total_marbles ,:colour
	
	def initialize(n, colour)
		@total_marbles = n
		@colour = colour
	end

	def same_total_marbles?(other_bag)
		self == other_bag
	end

	protected

	def ==(other_bag)
		total_marbles == other_bag.total_marbles
	end
end

bag1 = BagOfMarbles.new(20, "blue")
bag2 = BagOfMarbles.new(10, "blue")
bag3 = BagOfMarbles.new(10, "red")
p bag1.same_total_marbles? bag2 # => false
p bag2.same_total_marbles? bag3 # => true

=begin

In this code we want to know which bag has more marbles. If we did not override #==, Ruby would call the #== method on the BagOfMarbles object beginning the method lookup path in BagOfMarbles, traversing Object, Kernel and BasicObject and find the built-in BasicObject#== method which compares the object ids of both objects, essentially asking whether the two objects are the same object in memory. By overriding the #== method we specify that the values to be compared are the integers stored in the @total_marbles ivars. Because the #== method is called on an integer Ruby looks first in the Integer class for a #== method and finds it, concluding its search. The Integer#== method compares which number is greater returning a boolean. This fits with the code's design. We could do the same thing with the @colour ivar, which would call the String#== method to compare the strings' length and content.