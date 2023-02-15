1. <u>Object Oriented Programming:</u> a programming model which attempts to contain the complexity of software systems within seperate units of code that interact in a controlled way. The aim is to prevent unintended consequences of one part of the code effecting other parts, for instance by variable reassignment.  This is done by defining classes containing behaviours and states and instantiating  objects of them. These objects interact on a controlled way to prevent entanglement.

   

2. <u>Object</u>: An object is a product of a class which has access to the behaviours defined within the class and contains states stored in variables. Each object has its own unique memory address.

   

3. <u>Class:</u> A class is a basic blueprint of behaviours and states. An object is instantiated from a class which has access to the classes methods and data, but contains its own data.

4. <u>Class Constants:</u> These are references to data which should not be changed and are available to all objects of their class. They are created by writing the constant name in all capitals.

5. <u>Encapsulation</u>: Is a programming model wherein objects are created that are limited in their access to the public interface. This is to prevent unitended interaction between parts of the code.

6. <u>Polymorphism:</u> Is the ability for different types of data to respond to the same method invocation.

7. <u>Inheritance</u>: Is the relationship between two classes in Ruby where a subclass has access to the methods and data of a superclass.

8. <u>Instantiation:</u> Is the creation of objects from their classes. This is done by calling the #new method on a Class.

9. <u>Modules</u> : are containers for methods, which can be included in any class by using a mixin. This allows for inheritance where it is not directly hierarchical. 

10. <u>Method Look up (path)</u>: Is the order in which Ruby will search for  a method definition when it is invoked. This involves traversing different classes and modules until a matching method name is found.

11. <u>Accessor methods:</u>  These are syntactical sugar provided by Ruby which are an alternative to writing getter and setter methods. THere are 3, they are attributes_reader, attributes_writer and attributes_accessor which is both the previous two combined.

12. <u>Self:</u> is a keyword we use to determine what the object of the method is. When self is called within an instance method refers to the object the method was called on. This prevents Ruby from initialializing a new local variable within the method. When called outside an instance method, but inside a class self refers to the class and can be prepended to method definitions to make class methods.

13. <u>Class Variables:</u> are defined with @@ and are variables which arte available to all objects to the class and subclasses. When altered in a subclass or class the variable is altered in all subclass/classes.

14. <u>Method overriding:</u> Ruby allows us to write methods with the same names as methods that which already exist. Because the Method Lookup Path finds these first, they envoke the method and do not continue looking for another (unless deliberately told to with the super keyword). We can use this to alter Ruby's behaviour. A common method to override is #to_s, which we can adapt to change the way data is printed via #puts. 

15. <u>super</u>: is a Ruby keyword which calls the method name of the method inside which it is invoked, causing Ruby to search up the Method Lookup Path for the next Method with that name. When invoked without arguments it automatically passes any arguments. When invoked with arguments, it passes up ionly the arguments specified. When invoked with empty brackets it passes up no arguments. 

16. <u>Namespacing:</u> Is when you group classes within a module. This is done for the purposes of encapsulation, to clarify exactly what type the class is. For instance to distinguish between `Work::Asset.new` and `Leisure::Asset.new`.

17. <u>Method Access Control</u>: (protected, private, public (access modifiers)are 3 methods Ruby uses to determine whether a method is available to the public interface. All methods within a class are by default public (except #new, which is private), which means they can be called by objects of that class. Private methods can only be called within other methods of the class. Protected methods allow other objects of the same class to call them as collaborator objects from within the class.

18. <u>Abstraction</u>: is the principle of designating more detailed tasks to the computer, multiple times thereby allowing the programmer to design from a macro-perspective. For instance a programmer can plan how to organise a database, because they do not need to worry about how specific methods are implemented. This goes from the user interface of the computer down to the level of the computer parsing 0s and 1s.