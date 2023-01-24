# What does each self refer to in the code snippet below?

class MeMyselfAndI
  p self # => the class 'MeMyselfAndI'

  def self.me # => the class 'MeMyselfAndI'
    self # => the class 'MeMyselfAndI'
  end

  def myself
    self # => the instance of the class
  end
end

i = MeMyselfAndI.new
p MeMyselfAndI.me # => MeMyselfAndI
p i.myself # => <MeMyselfAndI:0293749302 >

=begin

Marwan:

self on lines 2, 4 and 5: the class itself MeMyselfAndI
self on line 9: the instance, or object, of the class on which the method myself is being called on

=end