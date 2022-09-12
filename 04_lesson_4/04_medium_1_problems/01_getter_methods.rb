=begin

https://launchschool.com/lessons/f1c58be0/assignments/652f8d69

Ben asked Alyssa to code review the following code:

Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

Who is right, Ben or Alyssa, and why?

=end

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Ben is right because the attr_reader method provides a getter method. balance in line 23 is refering to the return value of this getter method which will be the object referenced by @balance.

my_account = BankAccount.new(100)
p my_account.positive_balance?
