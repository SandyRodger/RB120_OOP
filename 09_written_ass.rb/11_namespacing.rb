=begin

What is the structure being defined on lines 1-5 and 7-11? Name the use case that is being demonstrated in the code example below, and describe why that use case is useful.

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
	These are modules, which are being used for name spacing. Name spacing is often used to group similar classes together for design purposes. Here for example the classes are all types of animal and it would not be immediately clear whether one was talking about an actual animal or a mascot. By using name spacing we clarify exactly what the nature of the class it. It also makes classes easier to find and is a way of making ones code more readable and organised.
=end