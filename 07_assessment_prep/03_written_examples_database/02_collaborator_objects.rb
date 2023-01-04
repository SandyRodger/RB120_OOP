=begin

What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.

A collaborator object is any object that is stored as a state within another object. They are stored in an object like a beef-patty is stored within a beef-burger, where the secondary object becomes an essential part of the primary object. Collaborators are usually custom objects (defined by a programmer, rather than part of the built in Ruby language) although technically any value that's saved to an ivar is a collaborator. And because almost everything in Ruby is an object, most relationships are technically collaboration i.e. objects in an array. 
Collaboration is a way of thinking about the relationship between actors in OOP. Like all OOP concepts collaboration allows the programmer to think abstractly and create clear code by designing a program which reflects real-world verbs and nouns. A library is only a library because it lends books, a shopping cart must be able to take items in and out to be what it is.

=end

class ShoppingCart
  attr_accessor :items
  attr_reader :shopper_name

  def initialize(shopper_name)
    @shopper_name = shopper_name
    @items = []
  end

  def to_s
    items.empty? ? "#{shopper_name}'s cart is empty" : "#{shopper_name}'s cart contains #{items.join(", ")}"
  end

  def pick_up(item)
    self.items << item
  end
end

cart_jerry = ShoppingCart.new("Jerry")
cart_liz = ShoppingCart.new("Liz")
cart_jerry.pick_up "Hamburgers"
cart_jerry.pick_up "Juice"
cart_jerry.pick_up "Avocados"
puts cart_jerry # => Jerry's cart contains Hamburgers, Juice, Avocados
puts cart_liz # => Liz's cart is empty

=begin

In this example the ShoppingCart objects take strings as collaborator objects and store them in an array. The strings are collaborating with the ShoppingCart objects. This relationship mirrors real life nouns and verbs enabling more abstract and intuitive design.

=end