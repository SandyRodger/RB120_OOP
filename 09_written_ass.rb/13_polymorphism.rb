=begin

What is the underlying concept being demonstrated on line 31? Explain the concept, the different ways in which it can be implemented, and why it's useful.

=end
class Vehicle
  def drive
    puts "put put put"
  end
end

class TwoWheeled < Vehicle
  def drive
    puts "whirrrrrr"
  end
end

class FourWheeled < Vehicle; end

class Motorcycle < TwoWheeled
  def drive
    puts "braaaaap"
  end
end

class ElectricScooter < TwoWheeled; end
class Car < FourWheeled; end

class Truck < FourWheeled
  def drive
    puts "vroooooom"
  end
end

vehicles = [Motorcycle.new, ElectricScooter.new, Car.new, Truck.new]
vehicles.each { |vehicle| vehicle.drive }

=begin
Your Answer
In line 31 we are demonstrating polymorphism by inheritance. This is the ability for objects of different types to respond to the same interface. Here four objects from four different classes are passed into a block where they each call a #drive method. Each object has access to a #drive method, but not the same one. Ruby only needs the method name to be the same in each case. So the Motorcycle object calls the #drive method defined in the Motorcycle class. The ElectricScooter object calls the #drive method defined in the TwoWheeled class. The Car object calls Vehicle#drive and the Truck object calls Truck#drive. Polymorphism can also be achieved with duck typing. This is where objects, unrelated by hierarchy, nevertheless has access to methods of the same name and so can all use the same piece of functionality as in line 30. Polymorphism is useful because it increases flexibility and reusability of code. It also allows the designer to think more realistically as different objects in the real world also perform the same actions in different ways. For instance a Cow class and a Chicken class might both have a #make_noise method, but when passed into a #total__farm_noise they need to implement differently.
=end