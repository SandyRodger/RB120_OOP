=begin

What will be returned by the value1 and value2 method calls?

=end

VAL = 'Global'

module Foo
  VAL = 'Local'

  class Bar
    def value1
      VAL
    end
  end
end

class Foo::Bar
  def value2
    VAL
  end
end

p Foo::Bar.new.value1 # => 'Local'
p Foo::Bar.new.value2 # => 'Global'

=begin

Marwan:


Foo::Bar.new.value1 #=> Local
Foo::Bar.new.value2 #=> Global

Demonstrates lexical scope of constants.

=end