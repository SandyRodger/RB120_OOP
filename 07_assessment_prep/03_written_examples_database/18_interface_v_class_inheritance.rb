=begin

When should we use class inheritance vs. interface inheritance?

Class inheritance is usually for classes which have an 'is a' relationship. ie. a dog is an animal. Interface inheritance is for behaviours which are applicable to multiple otherwise unrelated classes ie. a cat, a country and an emotion could all have a name method. 
Class inheritance is appropriate when sub-class and super-class both need the same method, so the subclass can inherit it from a parent-class and possibly override it for more specific implementation.

=end