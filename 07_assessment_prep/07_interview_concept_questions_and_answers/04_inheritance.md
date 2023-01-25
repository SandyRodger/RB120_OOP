[Ginni's Answer](https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/example_code/inheritance.rb)

R: What is inheritance and why is it important

S: Inheritance is when classes are granted access to methods in other classes or modules. This can be done by having classes inherit from a parent class or by mixing in a module. This allows methods to be defined in one place, but included precisely where they're needed in exactly the ways they're needed.

B:

Class Inheritance 
Superclasses and Subclasses
Inherited general behaviors
Overriding with more specific behaviors
Interface Inheritance
Ruby's answer to multiple inheritance
Mixin Modules
has_a vs is_a

P: I will now write out some code to demonstrate this

C:

```
module Transport
	def take_the_bus
		"In the morning I, a #{self.class}, take the bus"
	end
end

class Worker
	include Transport
	WORK = "do some form of work"
	def work
		"I am a #{self.class} and I #{self.class::WORK}"
	end
end

class Builder < Worker
	WORK = "erect buildings"
	def work
		super + " on a construction site"
	end
end

class SchoolChild
	include Transport
end

p Worker.new.take_the_bus
p Builder.new.take_the_bus
p SchoolChild.new.take_the_bus
```

W:

D:

DON'T FORGET TO MENTION

- All classes in Ruby are part of an inheritance chain which inherits from BasicObject and Object
- Modules are for behaviours that need to be mixed into a class, but have no formal hierarchical relationship to those classes.
- Inheritance allows classes to access methods higher up the method lookup path, but not downstream.
- Is_a relationship for inheritance, has_a relatioinship for modules.
