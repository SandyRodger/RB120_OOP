=begin

Update the Car class so that Car.total_starts returns the number of times we start a car. For instance, in the code below, we start a car 3 times, so Car.total_starts should return 3. Do not modify any code outside of the Car class.

=end
class Car
  def start
    puts "Vroom"
  end
end

car = Car.new

car.start
p Car.total_starts # 1
car.start
p Car.total_starts # 2
car.start
p Car.total_starts # 3

=begin
Your Answer
=end
class Car
    @@total_starts = 0

  def start
    puts "Vroom"
        @@total_starts += 1
  end

    def self.total_starts
        @@total_starts
    end
end
=begin
Responses

Clare MacAdie (TA)
about 5 hours ago
Be careful to ensure your code is indented properly 😉.
=end