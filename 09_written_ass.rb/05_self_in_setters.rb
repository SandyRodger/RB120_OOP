=begin

Currently, the code below raises an error instead of the expected output. Explain in detail why the error is being raised. Update the code so that lines 18-21 output the correct values.

=end

class Movie
  attr_accessor :title, :tagline

  def initialize(title, tagline)
    @title = title
    @tagline = tagline
  end

  def format_movie_info
    title = title.capitalize
    tagline = tagline.capitalize
    "#{title}: #{tagline}"
  end
end

ghostbusters = Movie.new('ghostbusters', 'who you gonna call?')

p ghostbusters.format_movie_info # Ghostbusters: Who you gonna call?
p ghostbusters.title # Ghostbusters
p ghostbusters.tagline # Who you gonna call?

=begin

Your Answer
This code tries to implement two setter methods in lines 10 and 11. What actually happens is Ruby reads title and tagline as new local variables. They are initialized with default values of nil. Then Ruby tries to call #capitalize on these values, but there is no #capitalize method available to nil so it raises an exception. Setter methods must have the calling object specified by prepending self.. (It's also possible to do this with the @ symbol, ie. @title = title.capitalize, but this is not best practice). The correct code would look like this:

=end

  def format_movie_info
    self.title = title.capitalize
    self.tagline = tagline.capitalize
    "#{title}: #{tagline}"
  end