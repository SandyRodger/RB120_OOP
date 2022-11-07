=begin

https://launchschool.com/exercises/f296c1a3

Correct the following program so it will work properly. Assume that the Customer and Employee classes have complete implementations; just make the smallest possible change to ensure that objects of both types have access to the print_address method.

module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new 
bob = Employee.new
betty.print_address
bob.print_address


=end

module Mailable
	attr_reader :name, :address, :city, :state, :zipcode
	def initialize(name, address, city, state, zipcode)
		@name = name
		@address = address
		@city = city
		@state = state
		@zipcode = zipcode
	end

  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer 
	include Mailable
end

class Employee 
	include Mailable
end

betty = Customer.new('Betty', '32 Wallabee Way', 'Sidney', 'Victoria Bay', 'BN1 6JJ')
bob = Employee.new('Bob', '30 Wallabee Way', 'Sidney', 'Victoria Bay', 'BN1 6JJ')
betty.print_address
bob.print_address