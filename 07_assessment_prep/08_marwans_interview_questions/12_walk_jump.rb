=begin

What will the last two lines of code output?

=end

module Walk
  STR = "Walking"
end

module Run
  STR = "Running"
end

module Jump
  STR = "Jumping"
end

class Bunny
  include Jump
  include Walk
  include Run
end

class Bugs < Bunny; end

p Bugs.ancestors # => [Bugs, Bunny, Run, Walk, Jump, Object, Kernel, BasicObject] *tick*
p Bugs::STR # => Error *cross* "Running"

=begin

Marwan:

Line 21: [Bugs, Bunny, Run, Walk, Jump, Object, Kernel, BasicObject]
Order: Subclass, Superclass, Modules in last included order,.....

Line 22: "Running"
The last included module is the constant that will be referred to.

=end