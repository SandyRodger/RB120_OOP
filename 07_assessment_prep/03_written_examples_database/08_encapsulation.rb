=begin

How does encapsulation relate to the public interface of a class?

	Encapsulation limits the code available to the public interface of a class.  It does this to prevent one part of the code unintentionaly affecting another. Encapsulation is achieved through creating objects and exposing certain methods to interact with them. The public interface is the method names that we can call to access the implementation inside them. By intentionaly setting which methods are accessible by which objects we encapsulate pieces of functionality, protecting them from unintended manipulation. One way of doing this is method access control, which is used to expose only the methods we want to be accessible by the public interface of a class.
	Method access control uses the keywords `private`, `protected` and `public`. Any functionality that is run entirely within the class can be hidden as a private or protected method. For example:

=end

class BankAccount

	def initialize(account_holder, dollars = 0)
		@account_holder = account_holder
		@dollars = dollars
	end
	
	def withdraw(amount)
		if amount > dollars
			puts "insufficient funds"
		else
			self.dollars -= amount 
			puts "You have withdrawn #{amount}. Your new balance is #{dollars}"
		end
	end

	protected

	attr_accessor :dollars
end

account_1 = BankAccount.new("Bob", 500)
account_1.withdraw(300) # => You have withdrawn 300. Your new balance is 200
#p account_1.dollars #protected method, NoMethodError

=begin

In this example we do not want the public interface to have access to the #dollars getter/setter methods, but we do want objects to be able to withdraw money from the account. So we allow the #withdraw method to have access to the #dollars getter method by using the `protected` keyword. The reason why we use `protected`, rather than `private` is in line 21 `self` cannot see past `private`, but it can see past protected. So it's treated like another object calling `#dollars` from outside the class.

=end