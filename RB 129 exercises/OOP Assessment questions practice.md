https://docs.google.com/document/d/1rq1_uzAfGAOkgrGl0df3d4mX6xojKzif9oUdeQHR0IY/edit

<u>LS RB 120 Questions:</u>

1. What is OOP and why is it so important?

   OOP is a coding paradigm (pattern, or model) that deals with the complexity of large software systems by encapsulating certain procedures so that they can interact with other parts of the code without becoming intangled. This is done by creating classes and objects and controling the way they are permitted to interact with each other.

2. What is encapsulation?

​		Encapsulation is the principle of hiding parts of code from the rest of the code. The way these parts then interacts with other parts is controlled so that data cannot be manipulated unintentionally. These boundries allow your code to achieve a higher level of complexity. Encapsulation also enables the developer to think on a higher level of abstraction because they can think in terms of real-world nouns and verbs.

3. How does encapsulation relate to the public interface of the code?

   The developer uses Method Access Control to determine which parts of the code are accessible to the rest of the code. This means writing which methods are public, which are private and which are protected. Public methods are accessible by the rest of the code, private methods are only accessible to that class and its objects and protected methods allow other class objects to be passed into that method.

4. What is an object?

​	Everything in Ruby that can be said to have value is an object. A few things are not. Notably methods, blocks and variables. Objects are created from classes and inherit the properties and methods of that class.  For example all String objects have access to String methods. This is comparable to a mould giving form to objects.

5. What is a class?

   A class is a list of methods and attributes which can create objects that have access to those behaviours and data. they can be thought of as a basic outline of what an object should be made of and should be able to do. They are created by writing `def ` followed by the class name in camel case, then finished with the `end` keyword. 

6. What is instantiation?

​		Objects created by classes are also called 'instances' of the class and so instantiation is creating a new class object. This is done by calling the `new` method on the class, which then prompts the `initialize` method to be invoked, regardless of whether it has been explicitly defined in the class or not. 

7. What is polymorphism?

   The ability for different types of data to respond to a common interface. For example a method might envoke a `move` method and we could pass that method objects from different classes as long as each class had its own `move` method. So polymorphism lets objects of different types respond to the same method invocation.

8. Explain two different ways to implement polymorphism.

​	Polymorphism could be implemented by Duck typing. This is objects of different classes responding to the same method name. For example by having three classes defining different animals, wherein each class has a `make_sound` method which returned a different string object, representing a different sound. Another class called `Animal` could then have a `make_sound` method which takes an array of animal objects as its argument, iterates through the array and calls `make_noise` on each object, printing the return value. The output would be the different strings of the different animal noises because the `Animal::make_noise` method would envoke a different class method on each object in the array.

​	A second way is by inheritance. So one could implement polymorphism by having sub-classes inherit from a super-class. For example the `Fish` class and the `octopus` class might inherit from a `Sea_Creature` class. In the super-class we could define a `swim` method and have the two other classes inherit from `Sea_Creatures` which would give the sub-classes access to the `swim` method and any other public methods in the superclass.

9. How does Polymorphism work in relation to the public interface?

   Polymorphism allows us to pass objects of different types, but with the same behaviour to a single method. Thus, the public interface lets us work with all of these types in the same way.

10. What is Duck-typing? How does it relate to Polymorphism? What problem does it solve?

​		Duck typing is passing objects of different, unrelated classes to a single method, where a common method name is called on the objects, coresponding to different methods from each objects class. The class of the objects is not important, but the behaviour is. If it has the coresponding method, then it is acceptable in the other class method of the same name.

11. What is inheritance ?

Inheritance is when one class has access to the methods and data of another class. Ruby classes can only inherit from one other class at a time and the relationship is described as super-class and sub-class. For example String is a subclass of Comparable. Inheritance allows programmers to define basic classes with large reusability and smaller sub-classes for more detailed behaviours.

12. What is the difference between a superclass and a subclass?

    A superclass and subclass describes two classes where one is inheriting from the other. Comparable is the subclass of Object, which is the subclass of Kernel. This makes Kernel the superclass of Object, which is the superclass of Comparable.

13. What is a module?

    A module is a place for storing methods that can be included in other classes. They are similar to classes in that they contain shatred behaviour, but they cannot create objects.  A module is included in a class with the `include` method. This is called a 'mixin'.

14. What is a mixin?

    'mixins' are modules included in classes. A module can be 'mixed in' to as many classes and the programmer needs.

15. When is it good to use inheritance?

    Inheritance allows programmers to define widely-used behaviours in super-classes and more detailed, specific behaviours in sub-classes. In other words it allows one to model heirarchical domains. 

16. In inheritance, when would it be good to override a method?

    (I can't find a LS explanation for this) It is appropriate to override a method

17. What is the method lookup path?

18. When defining a class, we usually focus on state and behaviours. What is the difference between these two concepts?

19. How do you initialize a new object?

20. What is a constructor method?

21. What is an instance variable, and how is it related to an object?

22. What is an instance method?

23. How do objects encapsulate state?

24. What is the difference between classes and objects?

25. How can we expose information about the state of the object using instance methods?

26. What is a collaborator object , and what is the purpose of using collaborator objects in OOP?

27. What is an accessor method?

28. What is a getter method?

29. What is a setter method?

30. What is attr_accessor?

31. How do you decide whether to reference an instance variable or a getter method?