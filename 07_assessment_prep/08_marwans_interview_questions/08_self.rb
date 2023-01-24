#8 — What does the self keyword refer to in the good method?

class Dog
  attr_accessor :name

  def good
    self.name + " is a good dog" # => self = <Dog:1029374940 @name = "Bandit">
  end
end

bandit = Dog.new
bandit.name = "Bandit"
p bandit.good # => "Bandit is a good boy"

=begin

The instance, or object, that the method is being called on.

=end

