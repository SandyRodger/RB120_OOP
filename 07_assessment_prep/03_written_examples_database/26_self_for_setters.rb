class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.

=begin

We expect the code above to output ”Spartacus weighs 45 lbs and is 24 inches tall.” Why does our change_info method not work as expected?

The #change_info method is a setter method and needs to prepend each variable with `self.` in order to be called on the GoodDog object. Without this Ruby reads these three lines as assigning values to three new local variables. Another way to make sure it is the ivars that are referenced would be to prepend @ to the variables, although this is not best practice because you are manipulating the ivars directly rather than via a setter method.

=end