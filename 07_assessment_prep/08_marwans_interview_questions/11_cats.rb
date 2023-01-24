=begin

 What would cat.name return after the last line of code is executed?

=end


class Cat
  attr_accessor :name

  def set_name
    name = "Cheetos"
  end
end

cat = Cat.new
cat.set_name
p cat.name # => nil

=begin

Marwan:

cat.name would return nil since line 5 is simply local variable initialization.

In setter methods, it is important to be explicit by prepending @ or self. to the instance variable name to disambiguate it from local variable initialization.

=end