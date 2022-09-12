=begin

https://launchschool.com/lessons/f1c58be0/assignments/98073b61

When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class with separate names and ages?

=end

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

p berty = AngryCat.new(9, 'Berty')
p angela = AngryCat.new(3, 'Angela')