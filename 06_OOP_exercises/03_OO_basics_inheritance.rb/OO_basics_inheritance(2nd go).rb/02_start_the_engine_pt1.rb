=begin

https://launchschool.com/exercises/6a35145d

Change the following code so that creating a new Truck automatically invokes #start_engine.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year
Expected output:

Ready to go!
1994

=end

class Vehicle
  attr_reader :year

  def initialize(year)
		start_engine
    @year = year
  end
end

class Truck < Vehicle
  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year

# This is not the LS solutipn. But it still works. What's up with that? Aha - because in my solution, creating any vehicle automatically starts the engine, but the LS instructions were to only start the engine with the creation of a Truck.

# LS solution:

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year