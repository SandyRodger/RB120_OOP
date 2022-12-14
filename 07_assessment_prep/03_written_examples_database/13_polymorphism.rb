=begin

What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.

Polymorphism is the ability for objects of different types to respond in different ways to the same method calls. This is built in to Ruby, for instance with the #puts method, which will implement differently if its argument is a string or an array object. ie.

puts "Hello world" => Hello world
puts [1, 2, 3, 4] => 1 2 3 4

Here the Array class and the String class have their own #puts methods defined and so output the arguments differently. 

=end
