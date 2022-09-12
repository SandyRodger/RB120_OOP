class Person
	attr_accessor :last_name, :first_name
	
	def initialize(name)
		@first_name = name
		@last_name = ""
	end

  def name=(name)
		parts = name.split
		@first_name = parts.first
		if parts.size > 1 
			@last_name = parts.last
		else
			@last_name = ""
		end
  end

	def name
		if last_name == ""
			first_name
		else
			"#{first_name} #{last_name}"
		end
	end

	def compare_names(other_person)
		self.name == other_person.name
	end

	def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
# now, with the addition of the #to_s method the code will print "The person's name is Robert Smith"

