`Being.allocate`

constructor overloading: The ability to have multiple types of constructor in a class. Ruby does this by default parameters in the initialize method, where other languages have built in constructor overloading methods. 

In Ruby data is only accessible via methods

`puts per.send :get_name` can act as a getter method!

Access modifiers:  Public, private and protected

"breaking backward compatability is generally frowned upon" -?!



There is only one small difference between private and protected methods in Ruby. Protected methods can be called with the `self` keyword:

```ruby
class Some

  def initialize
​      method1
​      self.method2
  end
  
  protected

  def method2
​    puts "protected method2 called"
  end

  private

   def method1
​      puts "private method1 called"
   end
end

s = Some.new
s.method1 # => error
```

`super` (which is a method btw) is sucking down, not passing up.

​	"The super method calls a method of the same name in the parent's class. If the method has no arguments it automatically passes all its arguments"

Super doesn't pass any arguments to its parent's method.









