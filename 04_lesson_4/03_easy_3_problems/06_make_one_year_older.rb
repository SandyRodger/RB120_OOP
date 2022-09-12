class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

p catty = Cat.new('tabby')
catty.make_one_year_older
p catty.age
catty.age += 1
p catty.age