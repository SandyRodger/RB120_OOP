=begin

If we use == to compare the individual Cat objects in the code above, will the return value be true? Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the == method?

The BasicObject#== method compares the object id of two objects and returns a boolean, essentially asking are these two objects the same object? So comparing the three objects below with #== will return false. This demonstrates that classes inherit some of their methods from the BasicObject class and that the #== method needs to be overridden in a child-class if a more specific comparison of objects is required. 

=end


class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new

p whiskers == ginger 

