[Ginni's answer was useful here](https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/example_code/encapsulation1.rb)

1. What is encapsulation in Ruby, and why does it matter? Demonstrate with code.

	S:
	
	Encapsulation is an attempt to protect code, by seperating it into chunks and limiting access to them. These chunks are classes from which objects are created, and modules. This allows large complex structures to be built without different parts unintentionally manipulating each other. It also frees the code writer to think more abstractly about the overall design. 

	P:

	- Objects encapsulate data
	- Classes can encapsulate behavior
	- attr_ methods 
  - Method Access Control. 
	- Modules 
	- Inheritance
  - Abstraction: 
		- base problem model on real world paradigms
	  - we can use public interface without worrying about implementation
		- build modular programs

```
	class Person
		attr_accessor :name
		attr_reader :birthday
		
		def initialize(name, age, birthday)
			@name = name
			@age = age
			@birthday = birthday
		end
		
		# custom setter method manipulates data appropriately
		def has_a_birthday
			self.age += 1
		end
		
		# custom getter method exposes only the desired data
		def how_old
			puts "I am #{age - 5} years old"
		end
		
		def to_s
			"#{name} : #{birthday}"
		end
		
		private
		
		attr_accessor :age
	end
	
	class BirthdayTracker
		attr_reader :people
		
		def initialize
			@people = []
		end
		
		def <<(person)
			people << person
		end
		
		def show_birthdays
			people.each { |person| puts person }
		end
	end
	
	bob = Person.new('Bob', 35, 'Jan 1')
	
	# The attributes name and number are encapsulated within Bob
	p bob
		# => #<Person:0x0000559e3a68a5c8 @name="Bob", @number="867-5309">
	
	# We can access these values using getter & setter methods
	p bob.name              # => "Bob"
	bob.name = "Sue"
	p bob.name              # => "Sue"
	bob.name = "Bob"
	
	# We can restrict access to sensitive data using method access control
	# (via access modifier `private`)
	# Rely on public interface to ensure data is manipulated and exposed appropriately
	bob.how_old
	bob.has_a_birthday
	bob.how_old
	
	my_pals = BirthdayTracker.new
	
	my_pals << bob
	
	# The my_pals object now encapsulates person object bob
	p my_pals
		# => #<BirthdayTracker:0x00005607d39f8ce8 @people=[#<Person:0x00005607d39f9120 @name="Sue", @age=36, @birthday="Jan 1">]>
	
	# BirthdayTracker can interact with collaborator Person objects using public interface, we are not concerted with implementation
	my_pals.show_birthdays
		# => Bob : Jan 1
		# Any changes to Person#to_s method do not affect BirthdayTracker#show_birthdays method
```