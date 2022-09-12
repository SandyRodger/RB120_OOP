module Actions
	def speak
			'bark!'
	end

	def run
		'running!'
	end

	def jump
		'jumping!'
	end
end

class Dog
	include Actions

	def swim
		'swimming!'
	end

  def fetch
    'fetching!'
  end
end

class Cat
	include Actions
end

betsy = Cat.new
larry = Dog.new
p betsy.speak
p larry.speak
p betsy.run
p larry.run
p betsy.jump
p larry.jump
p larry.fetch
p larry.swim
