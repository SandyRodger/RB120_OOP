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
  # VAL = 'Bar'
  def value2
    VAL
  end
end

p Foo::Bar.new.value1 # Bar - Why?
p Foo::Bar.new.value2 # Bar - Outputs 'Main' without Line 16

=begin

https://launchschool.com/posts/3fe8797d

=end