class QuadBike 
  WHEELS = 4 

  def wheels 
    WHEELS = 0
  end
end

  WHEELS = 5 
  
class Bicycle < QuadBike
  WHEELS = 2 

  def wheels 
    super + self.class::WHEELS
  end 
end 
  
class Unicycle < Bicycle
  WHEELS = 1 

  def wheels 
    super
  end 
end 
  
quad = QuadBike.new 
bike = Bicycle.new 
unibike = Unicycle.new 
  
p quad.wheels 
p bike.wheels 
p unibike.wheels 
  
# Without running the code what is the output? 
