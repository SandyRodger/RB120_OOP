=begin

How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

Method Access Control is implemented with the three access modifiers: private, protected and public. These are in fact methods. Methods are by default public, with the exception of #initialize, which is always private. Any methods written under an access modifier will be accessible according to its rules. Public methods can be called from outside the class. Private methods can only be called internally, so via other methods in the class. Protected methods are similar to private methods in that they cannot be invoked outside the class. The main difference is that they allow other objects to be passed in. This is demonstrated below.

=end

require 'byebug'

class BicycleMan
	attr_reader :wheels

	def initialize(name, wheels = 4)
		@name = name
		@wheels = wheels
	end
end

class Vehicle
	attr_reader :wheels, :name

	def initialize(name, wheels = 4)
		@name = name
		@wheels = wheels
	end

	def public_method
		puts "I am a public method"
	end

	def access_private_method
		private_method
	end

	def same_total_wheels?(other_object)
		# byebug
		 self == other_object
	end

	def what_am_i
		puts "I am a #{self.name}"
	end

	protected

	def private_method
		puts "I am a private method"
	end

	def ==(other_object)
		self.wheels == other_object.wheels
	end
end

car = Vehicle.new("Volvo")
motorbike = Vehicle.new("Suzuki", 2)
bicycle = Vehicle.new("Raleigh", 2)
barry = BicycleMan.new('barry')

p car.same_total_wheels?(barry) # => false
p barry.wheels # => 4
p car.wheels # => 4

# car.public_method # => "I am a public method"
# # This demonstrates that methods are public by default.

# #car.initialize("Fiat") # =>  private method (NoMethodError)
# # This demonstrates that although methods are public by default, #initialize is always private.

# #car.private_method # =>  private method (NoMethodError)
# # This demonstrates that private methods cannot be called by objects

# car.access_private_method # => "I am a private method"
# # This demonstrates that private methods can be called by other methods of that class.

# # p car == motorbike # =>  protected method `==' (NoMethodError)
# # This demonstrates that protected methods, like private methods, cannot be called outside the class.

# p motorbike.same_total_wheels?(car) # => false
# p motorbike.same_total_wheels?(bicycle) # => true
# # This demonstrates a common use for protected methods, which is comparison overriding because we can specify how we want objects to be compared.

# car.what_am_i # => I am a Volvo
# # This method is public, which demonstrates that a method adheres to the rules of the access modifier above it, regardless of previous access modifiers.



=begin

On Monday 2.1.23 Olly and I talked about the nature of the 'protected' access modifier. Olly was able to prove (?) that protected methods do not allow objects from other classes to be passed in. But I thought they could, as I do below. Now I can't manage to recreate his example. Something to do with nipples. 

=end
=begin
class BankAccount
	attr_reader :amount 

	def initialize(account_holder, amount)
		@account_holder = account_holder
		@amount = amount
	end

end

class BitcoinAccount

	attr_reader :amount
	
	def initialize(account_holder, amount)
		@account_holder = account_holder
		@amount= amount
	end

	def has_more_than?(other_account)
		self > other_account
	end

	protected
	
	def >(other_account)
		self.amount > other_account.amount
	end

end

bank_account = BankAccount.new('John', 2000)
bitcoin_account = BitcoinAccount.new('John', 3000)
p bitcoin_account.has_more_than?(bank_account) # => true
=end