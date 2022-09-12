=begin

https://launchschool.com/lessons/f1c58be0/assignments/98073b61

What is used in this class but doesn't add any value?

=end

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# return, line 18
# the color and brightness instance variables as the string in line 18 does not include them.
# I don't know how this code will be used, but sio fat the attr_accessor methods are also useless. Therfore the initialize method is also useless( uin the sense of not having been used yet)