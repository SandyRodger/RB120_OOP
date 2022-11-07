=begin

https://launchschool.com/exercises/a04eaf49

Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation details for the #initialize methods in Graduate and Undergraduate are missing. Fill in those missing details so that the following requirements are fulfilled:

Graduate students have the option to use on-campus parking, while Undergraduate students do not.

Graduate and Undergraduate students both have a name and year associated with them.

=end
class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year)
		super name, year
		@parking = true
  end
end

class Undergraduate < Student
end

jerry = Graduate.new("Jerry", 1999)
p jerry
mary = Undergraduate.new("Mary", 2000)
p mary