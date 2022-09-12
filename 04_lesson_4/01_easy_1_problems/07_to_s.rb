=begin

What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

Answer: #to_s returns a string version of the object it is called on. To be sure one could look up the Object#to-s method


LS says:

By default, the to_s method will return the name of the object's class and an encoding of the object id.

If you weren't sure of this answer you could of course refer to Launch School's Object Oriented Programming book, but you could also refer directly to the Ruby documentation, in this case, here: http://ruby-doc.org/core/Object.html#method-i-to_s.
	
=end