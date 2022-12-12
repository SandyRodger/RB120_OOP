=begin

Describe the distinction between modules and classes.

Objects can be instantiated from classes, but not from modules. Modules are used to group methods, which can be used in multiple unrelated classes. Modules are also used for namespacing, ie grouping conceptually similar classes. Classes are defined with the class keyword, modules with the `module` keyword. Classes can inherit from other classes, but modules can only be mixed into a class with the `include` method.

=end