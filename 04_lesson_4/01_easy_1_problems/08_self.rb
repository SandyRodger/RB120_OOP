=begin

https://launchschool.com/lessons/f1c58be0/assignments/a5cfd2ae

=end

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

=begin

You can see in the make_one_year_older method we have used self. What does self refer to here?

answer: Here self refers to the return value of the age getter method, which will be the age instance variable
=end