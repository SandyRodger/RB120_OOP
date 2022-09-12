=begin

https://launchschool.com/lessons/f1c58be0/assignments/652f8d69

If we have these two methods in the Computer class:
=end
class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end
#and
class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# The second case has instance variables which are called on the class object itself, whereas the first case is called on the instance variables. Case 1 is better practice and easier to read. The outcome of both will be the same. 