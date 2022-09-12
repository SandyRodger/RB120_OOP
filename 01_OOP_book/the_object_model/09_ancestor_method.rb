
module Party
	def dance(type_of_dance)
		puts "you look great, doing the #{type_of_dance}"
	end

	def start_a_fight(person)
		puts "has a fight with #{person}"
	end

	def make_out(person)
		puts "makes out with #{person}"
	end
end

class Student
	include Party # here we are mixing in the Party module.
end

class Politician
	include Party
end

geoff = Student.new
# geoff.make_out('Liz')
jerome = Politician.new
# jerome.start_a_fight('Alistair')

puts "---Student ancestors---"
puts Student.ancestors
puts ''
puts "---Politician ancestors---"
puts Politician.ancestors