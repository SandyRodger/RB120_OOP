=begin



=end

class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
  end

  def artist=(name)
    @artist = name
    name.upcase!
  end
end

song = Song.new("Superstition")
p song.artist = "Stevie Wonder" # => STEVIE WONDER
p song.artist # => STEVIE WONDER

=begin

Marwan:

Although setter methods return the arguments passed in upon invocation, by calling a destructive method on name, the value of @artist gets affected as well since both variables are still pointing to, or referencing, the same object in Ruby's space.

=end