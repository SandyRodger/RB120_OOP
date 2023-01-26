=begin

How Ruby looks for Constants:

1st: Lexically: in the surrounding structure, then out like an onion. (Module-wards only)
2nd: Hierarchically: up the inheritance chain.
3rd: Top level

NB: if the class is defined in more than one place, ruby will not search lexically from the other class definitions. It will ignore them.

=end

CONSTANT = 4

class Two
	# CONSTANT = 5
end

module Beta
	CONSTANT = 3
	class Three
		CONSTANT = 6 # => will not be checked
	end
	module Alpha
		# CONSTANT = 2
		class One < Two
			# CONSTANT = 1
			def method_1
				puts CONSTANT
			end
		end
	end
end


Beta::Alpha::One.new.method_1

Anomalie 1: if the class is defined in more than one place, ruby will not search lexically from the other class definitions. It will ignore them.

```
VAL = 'Main'

module Foo
  VAL = 'Foo'

  class Bar
    def value1
      VAL
    end
  end
end

p Foo::Bar.new.value1 # Foo

class Foo::Bar
  VAL = 'Bar'
  def value2
    VAL
  end
end

class Foo::Bar
	def value3
		puts "yes"
	end
end

p Foo::Bar.new.value2 # Bar - Outputs 'Main' without Line 16
p Foo::Bar.new.value1 # Bar - Why?
Foo::Bar.new.value3 # => yes

=begin
 This example seems to show that classes defined more than once will form a single class. Previous classes aren't overwritten, they are just added to the class definition. Constant resolution will still work outwards like a nesting doll, but all methods will be available
=end
```