=begin

Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so...

puts "Well done!" if joe.better_grade_than?(bob)

=end

class Student

	def initialize(name, grade)
		@name = name
		@grade = grade
	end

	def better_grade_than?(student_2)
	  grade > student_2.grade
	end

	protected

	def grade
		@grade
	end
end

joe = Student.new('Joe', 76)
bob = Student.new('Bob', 45)
puts joe.better_grade_than?(bob)
