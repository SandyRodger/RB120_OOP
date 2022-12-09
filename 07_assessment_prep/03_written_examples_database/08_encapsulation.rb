=begin

How does encapsulation relate to the public interface of a class?

	Encapsulation is the idea of limiting the accessibiliy of sections of code to prevent one part of the code unintentionaly effecting another. The public interface is the method name that we call to access the functionality inside it. By intentionaly setting which methods are accessible by which objects we encapsulate pieces of functionality, protecting them from unintended manipulation. 
	This is often achieved by using the `private`, `protected` and `public` keywords. For example:

=end

class BankAccount

	def initialize(account_holder, dollars = 0)
		@account_holder = account_holder
		@dollars = dollars
	end
	
	def withdraw(amount)
		if amount > self.dollars
			puts "insufficient funds"
		else
			self.dollars -= amount
			puts "You have withdrawn #{amount}. Your new balance is #{self.dollars}"
		end
	end

	protected

	attr_accessor :dollars
end

account_1 = BankAccount.new("Bob", 500)
account_1.withdraw(300) # => You have withdrawn 300. Your new balance is 200
p account_1.dollars #protected method, NoMethodError