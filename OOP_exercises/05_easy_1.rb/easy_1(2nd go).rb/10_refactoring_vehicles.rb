=begin

https://launchschool.com/exercises/a4ade9b3

Consider the following classes:

class Car
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    4
  end

  def to_s
    "#{make} #{model}"
  end
end

class Motorcycle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    2
  end

  def to_s
    "#{make} #{model}"
  end
end

class Truck
  attr_reader :make, :model, :payload

  def initialize(make, model, payload)
    @make = make
    @model = model
    @payload = payload
  end

  def wheels
    6
  end

  def to_s
    "#{make} #{model}"
  end
end

Refactor these classes so they all use a common superclass, and inherit behavior as needed.

=end

class Vehicle
	attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

	def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
	WHEELS = 4
end

class Motorcycle < Vehicle
	WHEELS = 2
end

class Truck < Vehicle
  attr_reader :payload

	WHEELS = 6

  def initialize(make, model, payload)
		super(make, model)
    @payload = payload
  end


	def to_s
    "#{make} #{model} #{payload}"
  end
end

truck_1 = Truck.new('groogar', 'fasty-fast', 'swine')
puts truck_1
car_1 = Car.new('quim', 'glorp')
puts car_1
motorcycle_1 = Motorcycle.new('dukati', '5000')
puts motorcycle_1