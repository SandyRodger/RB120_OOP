=begin

https://launchschool.com/lessons/f1c58be0/assignments/25448951

Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# The @@cats_count variable tracks the number of Cat objects created. Every time a new Cat object is instantiated the statement in line 15 increments the @@cats_count by one. Then in order to read the current @@cats_count one can call the Class Method self.cats count as below:

p Cat.cats_count
jenny = Cat.new('Tabby')
bluey = Cat.new('Irish')
p Cat.cats_count