class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => false
p al.name == alex.name # => true
p al.name.object_id == alex.name.object_id # => false

=begin

In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`? 

al.name == alex.name

Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? 

=> no

How could we prove our case?

=> al.name.object_id == alex.name.object_id

=end