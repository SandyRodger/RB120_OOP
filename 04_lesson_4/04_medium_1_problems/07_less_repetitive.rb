=begin

https://launchschool.com/lessons/f1c58be0/assignments/652f8d69

=end

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status # remove light
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end