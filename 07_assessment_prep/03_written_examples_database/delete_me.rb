LEGS = 'Not sure'
class Furniture
  def how_many_legs
    LEGS
  end
end

class Chair < Furniture
end

p Furniture.new.how_many_legs # -> "Not sure"
# p Furniture::LEGS # -> NameError, uninitialized constant

p Chair.new.how_many_legs # -> "Not sure"
 p Chair::LEGS # -> NameError