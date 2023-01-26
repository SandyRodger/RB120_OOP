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
Foo::Bar.new.value3