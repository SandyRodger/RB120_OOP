=begin

Describe the distinction between modules and classes.

Objects can be instantiated from classes, but not from modules. Modules are used to group methods, which can then be used in different unrelated classes. Modules are also used for namespacing, ie grouping conceptually similar classes for clarity of design. Classes are defined with the class keyword, modules with the `module` keyword. Classes can inherit from other classes, but modules can only be mixed into a class with the `include` method.

=end