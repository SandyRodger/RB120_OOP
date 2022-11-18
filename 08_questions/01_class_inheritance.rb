class MyCar; end 

p MyCar.ancestors # => [MyCar, Object, Kernel, BasicObject]
p MyCar.class# => Class

# If classes are objects of the Class class, then why aren't they included in the ancestors method?