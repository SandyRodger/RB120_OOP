[Ginni's notes](https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/self.md)

R: What is self? How can it be used within OOP?

S: Self is a ruby keyword which ruby reads as a local variable referring to whatever the the calling object is in that scope. Self is a way of being explicit about what our code is referring to, for example to disambiguate a setter method from local variable initialization. Any time we have a method that does not have an explicit calling object, Ruby will implicitly read `self` as the calling object.

B:
- implied self and explicit self
- setter methods
- class methods
- module methods v mixed-in instance methods
- self on top level

P:

C:

```ruby
module TestModule
	def self.what_am_i
		puts self # => TestModule
	end

	def what_am_i_instance
		puts self # => <TestClass 293764483hwhsu8> (or whatever class it is mixed in to)
	end
end

class TestClass
	include TestModule

	def self.what_am_i
		puts self # => TestClass
	end

	def what_am_i
		puts self # => <TestClass 293764483hwhsu8>
	end

end

TestClass.what_am_i
TestClass.new.what_am_i
TestModule.what_am_i
TestClass.new.what_am_i_instance 
```

W:

D:

Remember:
- module class methods cannot be included in classes. Their `self` can only refer to the module itself. 
- don't talk about extend, unless they bring it up.