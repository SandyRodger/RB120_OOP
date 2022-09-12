=begin

https://launchschool.com/lessons/f1c58be0/assignments/98073b61

=end

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# 1
hello = Hello.new
hello.hi # => "Hello" (correct)

# 2

hello = Hello.new
p hello.bye # => NoMethod Error (correct)

# 3 

hello = Hello.new
p hello.greet # => Error, expected 1 argument, given 0 (correct)

# 4

hello = Hello.new
hello.greet("Goodbye") # => "Goodbye"

# 5

Hello.hi # => No Method error