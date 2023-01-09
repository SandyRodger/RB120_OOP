=begin

Currently, the code below raises an error. By only modifying two lines of code in the IceCreamScoop class, update the code snippet below so that the last line outputs the expected value. Explain the modifications that you made and why they fixed the code. What is the difference between the two lines of code that you modified?

=end
class IceCreamScoop
  @@total_scoops = 0

  def initialize(flavor, double=false)
    @flavor = flavor
    @double = double
    @@total_scoops += 1
    update_total_scoops
  end

  def make_it_a_double_scoop
    double = true
    update_total_scoops
  end

  def total_scoops
    @@total_scoops
  end

  private

  attr_accessor :double

  def update_total_scoops
    @@total_scoops += 1 if double == true
  end
end

my_scoops = IceCreamScoop.new('strawberry')
my_scoops.make_it_a_double_scoop
p IceCreamScoop.total_scoops # 2

=begin
Your Answer
Lines 16 needs self. to prepend total_scoops and line 12 needs self. to prepend double. This is because the total_scoops method called in line 31 is a class method, and class methods are defined with self in order to specify that the calling object is the class itself. In line 12 the self keyword is necessary to call the double= setter method rather than initializing a new local variable within the method, which is what happens otherwise, meaning that @double is still false in line 25.

Responses

Clare MacAdie (TA)
about 5 hours ago
update the code snippet below so that the last line outputs the expected value

Make sure to pay attention to the requirements of the question 😉.
=end