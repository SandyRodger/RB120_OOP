=begin

The structure defined on lines 1-24, the code on line 26, and the code on line 21 all work together in a way that removes dependency and privatizes sensitive data. What is the underlying concept at work here, and how does it work in Ruby? What role do these three chunks of code play within Ruby's implementation of that concept?

=end

	class BankAccount
		def initialize(account_number, balance, logged_in)
			@account_number = account_number
			@balance = balance
			@logged_in = logged_in
		end
	
		def safe_balance
			if logged_in
				balance
			else
				"You must be logged in to access that."
			end
		end
	
		def safe_account_number
			last_four = account_number.to_s.slice(5, 3)
			"xxxxx" + last_four
		end
	
		private
	
		attr_reader :account_number, :balance, :logged_in
	end
	
	account = BankAccount.new(32145678, 10_000, true)
	
	p account.safe_balance # 10000
	p account.account_number # NoMethodError
	p account.safe_account_number # xxxxx678

=begin

	Your Answer

	This code demonstrates a form of encapsulation that is achieve with Method Access Control, specifically the access modifier private. Encapsulation aims to limit the access that parts of the code have with others in order to prevent accidental manipulation and control how information can be accessed. In lines 1 - 24 a BankAccount class is defined where the behaviours and attribute of its objects are defined. Because methods in classes are by default public (with the exception of #initialize) something must done to prevent the rest of the code having access to more private information such as here the balance and account number of the bank account. This is achieved in line 21 with the private access modifier, which renders everything beneath it in the class only accessible by methods in the same class. This is why calling the getter method #account_number in line 23 raises an error, but the account number can be accessed via #safe_account_number, which returns a formatted version of the return value of account_number.
	
	Responses
	
	Clare MacAdie (TA)
	about 5 hours ago

	This is a good answer. You have identified encapsulation and explained it well. However, can you clarify a few points for me please?
	
	What is happening on line 26?
	How does line 26 relate to the class defined on lines 1-24?
	
	Sandy Rodger

	about an hour ago
	
	On line 26 a new BankAccount object is instantiated and saved to the local variable account. 3 arguments are passed in, which are saved to the object's instance variables. So line 26 creates an object and gives it 3 unique attributes, but it also has access to the methods of BankAccount, as do all other objects of that class. The 3 instance variables are accessible via the getter methods in line 23. However line 23 is private and so they can only be accessed by methods of the same class.
	=end