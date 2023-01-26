MARWAN:
	
What are some of the characteristics of instance variables?
 
They cannot be accessed outside of the class without defining methods to interact with them (however, as Alex Scout pointed out, you can still indirectly access them by using #instance_variable_get)

Flexible and do not need to be initialized — in which case they would return nil.

Dynamically appended to an object upon assignment/initialization.

Belong to the object — each object gains its own copy of every instance variable defined in a class.

Their values are not inheritable — modifying one value in a particular instance does not affect other instances.

Scoped at the object level and accessible in all instance methods, i.e., they do not need to be passed in as arguments prior to being referred to.