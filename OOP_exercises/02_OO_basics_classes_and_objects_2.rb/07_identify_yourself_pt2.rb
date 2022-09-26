=begin

https://launchschool.com/exercises/e7ca751c

Update the following code so that it prints I'm Sophie! when it invokes puts kitty.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
puts kitty

Expected output:

I'm Sophie!

=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

	def to_s
		"I'm #{name}"
	end
end

kitty = Cat.new('Sophie')
puts kitty