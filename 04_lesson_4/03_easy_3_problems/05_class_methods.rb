=begin

https://launchschool.com/lessons/f1c58be0/assignments/98073b61

=end

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # => No such method
tv.model # => this works

Television.manufacturer # => this works
Television.model # => No such method