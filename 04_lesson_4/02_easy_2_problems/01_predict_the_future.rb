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

oracle = Oracle.new
p oracle.predict_the_future

# I predict this will output "You will take a nap soon" or some version of the choices objects