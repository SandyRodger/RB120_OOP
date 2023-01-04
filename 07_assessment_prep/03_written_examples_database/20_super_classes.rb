=begin

Describe the inheritance structure in the code above, and identify all the superclasses.

 The SomethingElse class inherits from AnotherThing (making it the sub-class or child-class of AnotherThing). AnotherThing does the same to Thing (making Thing another Superclass). Thing will then inherit from Object, Kernel, BasicObject (Object and BasicObject are superclasses, Kernel is a module).

=end

class Thing
end

class AnotherThing < Thing
end

class SomethingElse < AnotherThing
end

p SomethingElse.ancestors # => [SomethingElse, AnotherThing, Thing, Object, Kernel, BasicObject]