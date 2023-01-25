module Transport
	def take_the_bus
		"In the morning I, a #{self.class}, take the bus"
	end
end

class Worker
	include Transport
	WORK = "do some form of work"
	def work
		"I am a #{self.class} and I #{self.class::WORK}"
	end
end

class Builder < Worker
	WORK = "erect buildings"
	def work
		super + " on a construction site"
	end
end

class SchoolChild
	include Transport
end

p Worker.new.take_the_bus
p Builder.new.take_the_bus
p SchoolChild.new.take_the_bus