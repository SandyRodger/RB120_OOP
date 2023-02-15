<u>Introduction:</u>

RB101 was "procedural" programming. Procedural progamming is used for "smaller scripts". All main-stream libraries and frameworks are written in OO style.

<u>The Object Model:</u>

OOP = "A programming paradigm"

**Encapsulation:** By creating objects and exposing interfaces to interact with the objects we can hide pieces of functionality from the rest of the code, so that it cannot be changed without obvious intention.

This allows programmers to think more abstractly when designing programs because objects reflect real-world nouns.

**Polymorphism**: This is the ability for different types of data to respond to a common interface. 

**Inheritance:** classes can inherit the behaviours of super-classes. Programmers can use this to have parent classes with large reusability and subclasses for more fine-grained, detailed behaviours.

**Modules:** Containers of shared behaviour, similar to inherited super classes, but unable to create objects. Modules are made available to other classes via **mixins**.

**Instantiation**: The creation of a new object from a class

**Method look-up:** 

​																<u>Classes and Objects - Part I</u>

**States and Behaviours:** States track attributes for individual objects. Behaviours are what objects are capable of doing.

- Instance variables exist as long as the object instance exists. It's a way of tying data to objects.
- They are responsible for information about the state of an object.
- Instance methods expose the state of the object. 

Why use getter methods? To be able to modify the presentation of the data and the user's access to it.

Calling methods with **self:**

**Class methods**: Where we put functionality that does not pertain to individual objects.

**Class variables:** keep track of class level details that pertain to the class and not individual objects.

Constants: 

- `puts` calls `to_s` and `p` calls `inspect`

  ​															<u>Inheritance:</u>

  **Super**: when called with specific arguments, it passes these arguments up the method lookup chain. It behaves differently with `initialize` than with different methods. 

  **Mixins:**

  <u>Mixins v modules:</u> If the subclass' relationship to the method it's inheriting is an "is a" relationship (ie. a Dog is an animal) then class inheritance is appropriate. If the relationship is a "has an ability" relationship then module mixins are more appropriate (ie. a Dog has the ability to swim).

  The method look-up path looks at the module last added to a class first. So the method included lowest in the class will be seen first. 

  **namespacing**: grouping similar classes in a module For 2 reasons:

  1. It's easier to recognise related classes.
  2. It reduces the likelihood of classes colliding  (What?) with other similarly named classes.

  Then we can call these classes with double colons, thus

  ```ruby
  buddy = Mammal::Dog.new
  kitty = Mammal::Cat.new
  buddy.speak('Arf!')           # => "Arf!"
  kitty.say_name('kitty')       # => "kitty"
  ```

  

  Modules are also used to house methods that don't really belong anywhere. then you can call them straight from the module, thus:

  ```ruby
  module Mammal
    ...
  
    def self.some_out_of_place_method(num)
      num ** 2
    end
  end
  
  value = Mammal.some_out_of_place_method(4)
  ```

  **Method Access Control**

  - **Access Modifiers** is the proper name for the attr methods

  ---

  - protected methods allow access between class instances while private methods do not.



TTTGame:



- The play method is an "Orchestration method" , which is a method consisting only of other method calls which is a list of how the program will run.

Random notes:

- If a module is included in both sub and superclass the method look-up path will delay looking into the included module and first look through the super class for methods. As show in the following:

```ruby
module Testable
  def test
    "Testing from Testable"
  end
​
  def another_method
    "Another method from Testable"
  end
end
​
class SuperClass
  include Testable 
​
  def test
    "Testing from SuperClass"
  end
end
​
class SubClass < SuperClass
  include Testable
end
​
p SubClass.new.test  # "Testing from SuperClass"
p SubClass.ancestors  # [SubClass, SuperClass, Testable, Object, Kernel, BasicObject]
```









