[Ginni had some interesting things to say...](https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/example_code/polymorphism.rb)

R: What is polymorphism? What are the different ways to apply polymorphism in Ruby?

S:

	Polymorphism is the ability for objects of different types to respond to the same method call with their own implementation. This is usually done in one of three ways: class inheritance, interface inheritance, and duck-typing.

B: (So I'm going to write down some points I'd like to cover)

class inheritance 
method overriding
interface inheritance
duck typing

P: I'm now going to write three examples. One is for workers and the other from animals, to demonstate the 3 types of polymorphism.

C:
```
# interface inheritance

class Worker
	def work
		puts "I am a #{self.class}, and I do some form of work"
	end
end

class Builder < Worker

end

class Banker < Worker
	def work
		puts "I am a #{self.class}, and I help run the bank"
	end
end

workers = [Worker.new, Banker.new, Builder.new]
workers.each {|worker| worker.work}
# => I am a Worker, and I do some form of work
# => I am a Banker, and I help run the bank
# => I am a Builder, and I do some form of work

# duck typing

class Bird
	def move
		puts "I fly and hop"
	end
end

class WashingMachine
	def move
		puts "I whirr and shudder"
	end
end

class Planet
	def move
		puts "I orbit and spin"
	end
end

def print_movements(array)
	array.each {|object| object.move}
end

print_movements([Bird.new, WashingMachine.new, Planet.new]) 

# => I fly and hop
# => I whirr and shudder
# => I orbit and spin

# Interface inheritance

module Flyable
	def fly
		puts "I can fly"
	end
end

class Plane
	include Flyable
end

class Crow
	include Flyable
end

class Superman
	include Flyable
end

[Plane.new, Crow.new, Superman.new].each {|obj|obj.fly}
# => I can fly
# => I can fly
# => I can fly
```

W: 

We use a module to mix in behaviors that apply to more than one class and are not easily modeled around a formal heirarchy.
We use class inheritance to model behaviours that are more general in a superclass and more specific in subclasses.
We use Duck typing to give the same behaviour to completely unrelated classes. 
Polymorphism DRYs up our code by avoiding repeating the same definition multiple times.


D: Would you like me to talk about any of these points further?
