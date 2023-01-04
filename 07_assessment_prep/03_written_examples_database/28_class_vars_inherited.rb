class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels      # => 4                           

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels   # => 2                         
p Vehicle.wheels      # => 2                         

class Car < Vehicle; end

p Vehicle.wheels      # => 2 
p Motorcycle.wheels   # => 2                         
p Car.wheels          # => 2 

=begin

What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?

This code outputs 

4
2
2
2
2
2

because when Vehicle#wheels is called  Ruby searches the class for the @@wheels class variable and finds it assigned to 4. Then when Motorcycle#wheels is called Motorcycle inherits the self.wheels method from Vehicle class and reassigns @@wheels to 2. This is the last reassignment that happens, all subsequent #wheels invocations refer to the @@wheels variable which is bound to 2. This is why it can be a problem to use class variables within inheritence, because any object on the inheritance chain can manipulate the class variable for all the other objects connected to those classes, as it does here. 

=end