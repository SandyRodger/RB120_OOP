=begin

https://launchschool.com/exercises/39281260

Consider the following class definition:
=end

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

=begin
There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

My answer: change the initiualize method to:

  def initialize(flight_number, database_handle)
    @database_handle = database_handle
    @flight_number = flight_number
  end

	LS answer is not that at all :

	 

=end