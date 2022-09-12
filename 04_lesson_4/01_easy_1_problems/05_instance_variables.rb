=begin

https://launchschool.com/lessons/f1c58be0/assignments/a5cfd2ae

=end

class Fruit
  def initialize(name)
    name = name # => this is not an instance variable because it lacks an @ before the variable name
  end
end

class Pizza
  def initialize(name)
    @name = name #=> this is the correct instance variable
  end
end

hot_pizza = Pizza.new("spicy")
p hot_pizza.instance_variables
orange = Fruit.new("satsuma")
p orange.instance_variables