=begin

Question 1
Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142

my answer: They all are + #class method
=end

p true.class
p "hello".class
p [1, 2, 3, "happy days"].class
p 142.class

=begin

LS answer:

All of them are objects! Everything in Ruby is an object, so you never need to ask yourself "is this an object?" because the answer every time will be yes.

You can find out what class an object belongs to in Ruby by asking the object what its class is by calling the method class on the object, as you can see below:

Copy Code
irb :001 > true.class
=> TrueClass
irb :002 > "hello".class
=> String
irb :003 > [1, 2, 3, "happy days"].class
=> Array
irb :004 > 142.class
=> Integer

=end

