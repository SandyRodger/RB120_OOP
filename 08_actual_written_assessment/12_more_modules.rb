=begin
The previous question demonstrated one use case for a particular structure used in OO design. (We've repeated the code from that question below.) What are two other use cases for these structures and what are they used for? Provide a working example of each.

=end
	module Mascot
		class Bear; end
		class Eagle; end
		class BananaSlug; end
	end
	
	module Animal
		class Bear; end
		class Eagle; end
		class BananaSlug; end
	end
	
	Mascot::Bear.new
	Mascot::Eagle.new
	Mascot::BananaSlug.new
	Animal::Bear.new
	Animal::Eagle.new
	Animal::BananaSlug.new

=begin
	Your Answer
	Namespacing can also allow us to repeat more common class names without them clashing with each other. SO for example we can two distinct Employee classes such as Microsoft::Employee which does not clash with a Twitter::Employee. Each class could then have its own #work method which was completely separate and unique. Another use for namespacing is to have related classes all in one area, making them easier to find.
	
	Responses
	
	Clare MacAdie (TA)
	about 5 hours ago
	Unfortunately, you have misinterpreted this question. It is looking for alternative use cases for modules (namespacing is a use case rather than a structure).
	
	Can you try and answer this question again please?
	
	
	Sandy Rodger
	about an hour ago
	Modules can be used to group method definitions which pertain to classes which aren't hierarchically related. For instance a #fly method would be needed by a Plane class and a Superman class, but these classes would not be related. Including a module as a mix in would mean the method only needs to be defined once, making the code DRY. This would look like this:
	
=end
	module Flyable
			def fly
					puts "I fly"
			end
	end
	
	class Superman
			include Flyable
	end
	
	class Plane
			include Flyable
	end
	
	Plane.new.fly # => I fly
	Superman.new.fly # => I fly
=begin
	Modules can also be used to contain constants, which then have to be accessed using a constant resolution operator. This can be another way of avoiding repetition, as below:
	
=end
	module Quadraped
			LEGS = 4
	end
	
	class Cow
			def legs_function
					puts "I walk on my #{Quadraped::LEGS} legs"
			end
	end
	
	class Table 
			def legs_function
					puts "I stand securely on #{Quadraped::LEGS} legs"
			end
	end
	
	
	Cow.new.legs_function # => I walk on my 4 legs
	Table.new.legs_function # => I stand securely on 4 legs