=begin

https://launchschool.com/lessons/f1c58be0/assignments/25448951

How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

=end

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

# answer: #class#ancestors

p Orange.ancestors
p HotSauce.ancestors