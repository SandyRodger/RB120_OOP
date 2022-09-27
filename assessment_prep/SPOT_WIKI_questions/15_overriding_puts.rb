class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name # => "Bob"
puts bob # => "My name is BOB."
puts bob.name # => "BOB"

=begin

What is output on `lines 14, 15, and 16` and why?

1. Because the #puts method call is being called outside of the Person class, so isn't overidden. The name is simply returned and printed. (i think?)
2. 
3.

=> 

=end