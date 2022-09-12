=begin

https://launchschool.com/lessons/f1c58be0/assignments/25448951

=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future
# this will draw on the choices from the Oracle class. The result will be the same as problem 1. The options in line 19 will not be accessed.
# NO, the opposite is the case. Interesting.