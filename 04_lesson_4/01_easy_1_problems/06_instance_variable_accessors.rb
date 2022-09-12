=begin

https://launchschool.com/lessons/f1c58be0/assignments/a5cfd2ae

=end

class Cube
	attr_reader :volume
  def initialize(volume)
    @volume = volume
  end
end

p Cube.new(5).volume