=begin

What will the last three lines of code print to the console? After song.artist is called, what would be returned if we inspect the song object?

=end

class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
    @artist
  end

  def artist=(name)
    @artist = name.upcase
  end
end

p song = Song.new("Superstition") # => #<Song:1028364 @title="Superstition">
p song.artist = "Stevie Wonder" # => "Stevie Wonder"
p song.artist # => "STEVIE WONDER"

=begin

I got it right!

Marwan:

Line 14: An instance of Song with the song object defined like so:

Class name followed by a hexadecimal representation of its object id
Initialized instance variables followed by their values
#<Song:0x00000001092bdbf8 @title="Superstition">

Only @title would be included in this case since @artist was never initialized.

Line 15: "Stevie Wonder"

Setter methods return arguments passed upon invocation
However, changing line 10 to a mutating method name.upcase! would return "STEVIE WONDER"
Line 16: "STEVIE WONDER"

After song.artist is called, p song would return an instance of Song with @title and @artist defined

=end