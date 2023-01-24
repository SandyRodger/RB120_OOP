=begin

Write 3 methods inside the Person class that would return the outputs shown on lines 23 and 24.

=end

class Person
  attr_reader :friends

  def initialize
    @friends = []
  end

	def <<(other)
		@friends << other.name
	end

	def []=(idx, obj)
		@friends[idx] = obj.name
	end

	def [](idx)
		@friends[idx]
	end
end

class Friend
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

tom = Person.new
john = Friend.new('John')
amber = Friend.new('Amber')

tom << amber
tom[1] = john
p tom[0]      # => Amber
p tom.friends # => ["Amber", "John"]

=begin
I got it right!

=end