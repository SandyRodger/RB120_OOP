class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels # => 4 because in the absence of an object upon which to call this method, the m,ethod call looks at the class and finds the @@class variable pointing to 4 (correct)                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels  # => 2, as above (correct)                        
p Vehicle.wheels  # => still 4            (incorrect, 2 now)                  

class Car < Vehicle; end

p Vehicle.wheels # => 4   (incorrect, 2)
p Motorcycle.wheels  # => 2   (correct)                       
p Car.wheels # => 4    (incorrect, 2)

=begin

What does the code above output?

- 4, 2, 2, 2, 2, 2

and why?

- i do not know...

What does this demonstrate about class variables?

-

and why we should avoid using class variables when working with inheritance?

-

=end