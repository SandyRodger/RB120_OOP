=begin

https://launchschool.com/lessons/f1c58be0/assignments/98073b61

=end

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

	def self.hi
		puts "hi there!"
	end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

# LS solution:

# class Hello
#   def self.hi
#     greeting = Greeting.new
#     greeting.greet("Hello")
#   end
# end