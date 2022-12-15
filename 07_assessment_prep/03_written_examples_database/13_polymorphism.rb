=begin

What is polymorphism and how can we implement polymorphism in Ruby? Provide examples. 

DON'T TALK ABOUT #PUTS

Polymorphism is the ability for objects of different types to respond to the same interface with their own implementation. When multiple objects have access to a method with the same name they can be passed to the same method call even though they reference different functionality. We commonly achieve this through inheritance or duck-typing. Polymorphism by inheritance is when a super class defines a general method and subclasses define more detailed versions of that method. For instance: 

=end

class Worker
	def work
		puts "I am a #{self.class}, and I do some form of work"
	end
end

class Builder < Worker
	def work
		puts "I am a #{self.class}, and I help create buildings"
	end
end

class Banker < Worker
	def work
		puts "I am a #{self.class}, and I help run the bank"
	end
end

workers = [Worker.new, Banker.new, Builder.new]
workers.each {|worker| worker.work}
# => I do some form of work
# => I help run the bank
# => I help create buildings

=begin

	In the example above the Worker class has a #work method that describes work generally. This is overridden by its subclasses where more detailed descriptions of work are printed. Polymorphism through inheritance can also be achieved with modules, which is called 'interface inheritance'. 

 Secondly, Duck typing achieves polymorphism by passing unrelated objects to the same method call. As long as each object has access to a method with the same name that takes the same number of arguments, Ruby will implement the code. For instance:

=end

class Bird
	def move
		puts "I fly and hop"
	end
end

class Rhino
	def move
		puts "I charge and rampage"
	end
end

class Dog
	def move
		puts "I run and scratch"
	end
end

class Animals
	def self.print_movements(array)
		array.each {|animal| animal.move}
	end
end

Animals.print_movements([Bird.new, Dog.new, Rhino.new]) 

# => I fly and hop
# => I run and scratch
# => I charge and rampage

=begin

In this code we pass three objects of unrelated classes to a fourth class. Each object's class has a #move method and the #Animal::print_movements method calls a #move method on each object passed in. The result is that Ruby implements each object's unique #move method.

=end