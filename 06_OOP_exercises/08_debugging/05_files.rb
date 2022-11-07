=begin

https://launchschool.com/exercises/a43d46df

You started writing a very basic class for handling files. However, when you begin to write some simple test code, you get a NameError. The error message complains of an uninitialized constant File::FORMAT.

What is the problem and what are possible ways to fix it?

=end
require 'byebug'

class File
  attr_accessor :name, :byte_content, :format

  def initialize(name, format)
    @name = name
		@format = format
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{format}"
  end
end

class MarkdownFile < File
	FORMAT = :md
	def initialize(name)
  	super FORMAT, name
	end
end

class VectorGraphicsFile < File
	FORMAT = :SVG
	def initialize
  	super FORMAT
	end
end

class MP3File < File
	FORMAT = :mp3

	def initialize
  	super FORMAT
	end
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

=begin

The error message:

05_files.rb:30:in `to_s': uninitialized constant File::FORMAT (NameError)

						tells us that the blog_post variable does not have a FORMAT constant within its variable scope
As a MarkdownFile object the call stack first calls #puts, which causes #to_s to be called. It looks for #to_s and finds it in File class. There is no FORMAT constant in File class or any of its superclasses and the call stack does not search File's subclasses. For this reason Ruby cannot find the constant and raises an exception.

Possible solutions:

1) We can print out the object 'blog_post' in line 56 if we pass blog_post to the #p method instead of puts.

2) Another solution could be to add .name or .byte_content to blog_post as this would return the values of these instance variables to be printed.

3) We can write an initialize method for each subclass, pass in FORMAT to a #super method and initialize @format as an instance variable which can be called within the File class. Output:

md.Adventures_in_OOP_Land

LS discussion:

Discussion
The error occurs when we use the File#to_s method. The reason is our use of the constant FORMAT. When Ruby resolves a constant, it looks it up in its lexical scope, in this case in the File class as well as in all of its ancestor classes. Since it doesn't find it in any of them, it throws a NameError.

There are several ways to fix this. For example, instead of defining to_s in the File class, we could define it in each of the subclasses, in which the FORMAT constant is defined. But this would duplicate the exact same method, so the DRY principle advises us against it.

Alternatively, we can add explicit namespacing, as we do in our solution, by prepending the class name. Which class? This will be determined by the subclass from which we are calling to_s. We can reference this subclass as self.class - the class of the caller of the method (blog_post in our example). Using self.class offers the same flexibility that we use on line 12 when creating a new instance of the subclass from which we are calling new.

Another option is to not use a constant but, for example, a method:

class File
  # code omitted

  def to_s
    "#{name}.#{format}"
  end
end

class MarkdownFile < File
  def format
    :md
  end
end

class VectorGraphicsFile < File
  def format
    :svg
  end
end

class MP3File < File
  def format
    :mp3
  end
end

Of course, you could also use an instance variable to store the format, although this doesn't convey the fact that the format of a particular file is fixed and cannot change. Which option you pick is mainly a design choice.

Finally, note that this example is only for illustration purposes. Ruby has a File class, and there's really no good reason to write one ourselves.

Further Exploration
If you aren't familiar with Module#alias_method, take a moment to view Ruby's documentation. You don't need to memorize this method, but get in the habit of referring to documentation when you see code you aren't familiar with.

=end