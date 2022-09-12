class Person
	attr_reader :first_name
	attr_accessor :last_name

	def initialize(name)
		@first_name = name
		@last_name = ""
	end

	def name
		if last_name == ""
			first_name
		else
			"#{first_name} #{last_name}"
		end
	end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

=begin
LS solution:

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

=end