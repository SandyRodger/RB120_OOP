<u>Lecture 2: Classes and objects:</u>

<u>Example 2:</u> A nifty way to initialize first and last names when the argument may not contain a last name.

```ruby
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    part = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
end
```

 More nifty code:

```ruby
class Person
	attr_accessor :first_name, :last_name

	def initialize(full_name)
		parse_full_name(full_name)
	end

	def name
		"#{first_name} #{last_name}".strip
	end

	def name=(full_name)
		parse_full_name(full_name)
	end

	private

	def parse_full_name(full_name)
		parts = full_name.split
		@first_name = parts.first
		@last_name = parts.size > 1 ? parts.last : ''
	end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
```

4. <u>Lecture: Inheritance</u>

   Class based inheritance is for hierarchical domains.

   

   6. <u>Lecture: polymorphism</u>

   through inheritance:

Every object in the array is a different animal, but the client code doesn't care what object it is.

Through Ducktyping: 

Here is a nifty way to use Duck-typing (sans inheritance):

```ruby
class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_wedding(self)
    end
  end
end

class Chef
  def prepare_wedding(wedding)
    prepare_food(wedding.guests)
  end

  def prepare_food(guests)
    #implementation
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end

  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end

  def prepare_performance(songs)
    #implementation
  end
end
```

Note: In the following code, we call `self` in the `change_nickname` method because Ruby requires private setter methods to be prepended with self

```ruby
class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny") # changed nickname to "barny"
puts dog.greeting # Displays: Barny says Woof Woof!
```

- we can only call private methods with the current object. This is a key difference between private and protected.
- Instance variables do not exist prior to the instantiation of the object.
- Attribute and instance variables are not interchangeable terms. Within the context of a class definition, `@name` would be an attribute signifier. Then within the context of the instantiated class object it would be an instance variable.
- While inheritance is a relationsdhip of 'is a', collaboration is a relationship of 'has a'. Ie a library has books.
- Single inheritance v multiple inheritance. The latter exists in other languages, but not Ruby.
- The more flexible your code, the more indirection you'll introduce by way of more classes. There's likely an optimal tradeoff on that spectrum for your application somewhere, but that place will likely change as your application matures. This is the source of never-ending debate and discussion in the software development field, but it really comes down to that tradeoff. 
- repetitive nouns in a spike is a sign that you're missing a class.
- ABC size compliant is a tricky Rubocop issue to deal with and delved into in lesson 2: 20 in great detail.
- ...the alternative is to use `# rubocop:disable` and `# rubocop:enable` comments in your code to silence Rubocop.
