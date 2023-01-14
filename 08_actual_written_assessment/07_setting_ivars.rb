=begin

Explain why the code below is currently raising an error. Provide two updated code examples of the Spaceship class that alleviate the error being raised. The two updated code examples should alleviate the error in distinctly different ways. Explain why each solution works to remedy the error being raised.

=end

class Spaceship
  def initialize(craft_name, captain, speed)
    self.craft_name = craft_name
    self.captain = captain
    self.speed= speed
  end
end

uss_enterprise = Spaceship.new('USS Enterprise', 'Jean-Luc Picard', 'Warp 9.6')

=begin
Your Answer
This code raises an Undefined Method error because it is calling three setter methods in lines 3 - 5 which have not been defined. When we instantiate objects we initialize instance variables, binding them to the values passed in. This would be the most obvious way to fix this code, as below:

=end
  def initialize(craft_name, captain, speed)
    @craft_name = craft_name
    @captain = captain
    @speed= speed
  end

=begin
This code allows the arguments passed to the #new method and then on to the #initialize method to be saved as instance variables, becoming part of the Spaceship object's state. A less conventional way to fix this code would be to define the setter methods, which I do below by using the attr_writer method, which is ruby syntactical sugar for setter methods:

=end
attr_writer :craft_name, :captain, :speed

  def initialize(craft_name, captain, speed)
    self.craft_name = craft_name
    self.captain = captain
    self.speed= speed
  end
	
=begin
In this solution we call each setter method on self which here refers to the object. In the first line the Spaceship#craft_name= method is called with craft_name passed in as an argument. Inside this setter method the argument, here referencing 'USS Enterprise', is assigned to the instance variable @craft_name. This happens again for Spaceship#captain= and Spaceship#speed= .