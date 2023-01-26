[Ginni's notes](https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/example_code/method_access_control.rb)

R: How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

S:

Method Access Control is a way of limiting what can access the codes within a class. This is implemented with the three access modifiers: private, protected and public. 

B:

Private
Public
Protected

P: I will talk while I code showing hiow the different Method access modifiers work.

C:
``` Ruby
class Person
	def initialize(name)
		@name = name
	end

	def public_method
		puts "I can be called from the public interface"
	end

	def call_private_method
		private_method
	end

	def compare_names(other_person)
		name == other_person.name
	end
	private 

	def private_method
		puts "I am being called from within the class"
	end

	private

	attr_reader :name
end


sandy = Person.new("Sandy")
sandy_2 = Person.new("Sandy")
barry = Person.new("Barry")
sandy_3 = Robot.new("Sandy")
# sandy.public_method
# sandy.initialize("Sandy")
# sandy.call_private_method
#p sandy.compare_names(sandy_2) # => true
#p sandy.compare_names(barry) # => false

```

W:

D: Shall I talk about what happens when you pass an object of a different class in to be compared in a protected method?

DON"T FORGET TO MENTION:

- ? 
