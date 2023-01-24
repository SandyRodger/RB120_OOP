=begin

Will the following code execute? What will be the output?

=end

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
     "Hello! they call me #{name}"
  end
end

class Puppet < Person
  def initialize(name)
    super
  end

  def greet(message)
    puts super() + message
  end
end

puppet = Puppet.new("Cookie Monster")
puppet.greet(" and I love cookies!")

=begin

I got this wrong. Beware of this trick because super with mismatched arguments is easy to overlook.

Marwan:

line 8: greet: wrong number of arguments (given 1, expected 0) (ArgumentError)

On line 19, replace super with super(). In this case, being explicit by adding () after super is important because the superclass' greet method takes no arguments while the one invoking it in its subclass Puppet does.

That is because super by itself invokes the parent method with all the arguments that were passed to its child's method.

=end