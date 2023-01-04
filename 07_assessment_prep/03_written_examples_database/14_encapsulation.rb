=begin

What is encapsulation, and why is it important in Ruby? Give an example.

	Encapsulation is an attempt to protect data from accidental manipulation, by limiting the code that has access to it. This is important because it allows large complex code structures to be built without different parts manipulating each other unintentionally. It also allows the code designer to think more abstractly by hiding the implementation of methods. 

	Encapsulation is achieved by creating objects from classes, which can be manipulated through methods. These methods have limited accessibility partly because they are only available via objects of their class and party through Method Access Control. This is the use of access modifiers to set which methods are acessible by the public interface. There are other ways to achieve encapsulation, for example with modules and inheritance. In the example below I will demonstrate encapsulation with attr_ methods and the protected access modifier.

=end

class BankAccount
	attr_reader :account_holder

	def initialize(account_holder, dollars)
		@account_holder = account_holder
		@dollars = dollars
	end

	def deposit(amount)
		puts "you have deposited $#{amount}. You now have $#{self.dollars += amount} in your account."
	end

	def withdraw(amount)
		if amount > dollars
			puts "insuffiecient funds"
		else
			puts "You have withdrawn $#{amount}. You now have $#{self.dollars -= amount} remaining."
		end
	end

	protected

	attr_accessor :dollars

end

account = BankAccount.new("John", 100)
account.deposit(300)
account.withdraw(100)

=begin

The reason why 'private' won't work here is that in Ruby versioins pre 2.7 'self' calls within the class are interpreted as objects outside of the class calling the method. This is not allowed with 'private' methods, but is with 'protected'.


=end
