[Ginni's answer was useful here](https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/example_code/encapsulation1.rb)

R: What is encapsulation in Ruby, and why does it matter? Demonstrate with code.

S:
	
Encapsulation is the idea that we protect the code by seperating it into chunks and limiting access between them. These chunks are classes from which objects are created, and modules. This allows large and complex structures to be built without different parts unintentionally manipulating each other. It also frees the code writer to think more abstractly about the overall design. 

B:

  - Objects encapsulate data
  - Classes can encapsulate behavior
  - attr_ methods 
  - Method Access Control
  - Modules 
  - Inheritance
  - Abstraction: 
	  - base problem model on real world paradigms
	  - we can use public interface without worrying about implementation
	  - build modular programs

P: I'm now going to create a two classes and a module, which will model how a bank account might work. I'll use these to show how encapsulation can protect and control data.

C:

```
module ConvertToPounds
	def convert_to_pounds(dollars)
		puts "When converted $#{dollars} = £#{(dollars * 1.16).round(2)}"
	end
end

class Bank
	@@all_accounts = []

	def self.total_money
		puts "There is $#{@@all_accounts.map(&:dollars).sum} in the bank."
	end
	
	def deposit(amount)
		self.dollars += amount
		puts "$#{amount} has been deposited in #{name}'s account."
	end

	def display_balance
		puts "#{name} has $#{dollars}."
	end

end

class BankAccount < Bank
	include ConvertToPounds
	attr_reader :dollars, :name

	def initialize(name)
		@name = name
		@dollars = 0
		@@all_accounts << self
	end

	protected 

	attr_writer :dollars

	private

	attr_writer :name

end

sandy_account = BankAccount.new("Sandy")
jerry_account = BankAccount.new("Jerry")
sandy_account.display_balance # => "Sandy has $0."
sandy_account.deposit(400) # => "$400 has been deposited in Sandy's account."
sandy_account.display_balance # =>  "Sandy has $400."
sandy_account.convert_to_pounds(sandy_account.dollars) # => When converted $400 = £464.0
Bank.total_money # => There is $400 in the bank.
p jerry_account.dollars
```

W: 

D: Would you like me to talk more about any of these points?
