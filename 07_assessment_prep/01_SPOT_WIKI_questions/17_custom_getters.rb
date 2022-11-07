=begin

Give an example of when it would make sense to manually write a custom getter method vs. using `attr_reader`.

In the below example the getter method places the instance variable within a string so that it will automatically be presented in a full sentence. This is one reason to modify a custom getter method
=end

class Athletes
	attr_writer :name
	def initialize(name)
		@name = name
	end

	def name
		"This athlete is now known as #{@name}"
	end
end

bruce_jenner = Athletes.new("Bruce")
p bruce_jenner.name
bruce_jenner.name = "Kylie"
p bruce_jenner.name