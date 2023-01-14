# # Given the two classes defined below, implement the necessary methods to get the expected results.
# require 'byebug'
# class Library
#   attr_accessor :books

#   def initialize
#     @books = {}
#   end

#   def << (other)
#     books[other.author] = other.title
#   end

#   def checkout_book(title, author)
#     books.delete(author)
#   end

# end

# class Book
#   attr_reader :title, :author

#   def initialize(title, author)
#     @title = title
#     @author = author
#   end

#   def to_s
#     "#{title} by #{author}"
#   end
# end

# lib = Library.new

# lib << Book.new('Great Expectations', 'Charles Dickens')
# lib << Book.new('Romeo and Juliet', 'William Shakespeare')
# lib << Book.new('Ulysses', 'James Joyce')

# # p lib.books

# # lib.books.each { |book| puts book }
# #   # => Great Expectations by Charles Dickens
# #   # => Romeo and Juliet by William Shakespeare
# #   # => Ulysses by James Joyce

# lib.checkout_book('Romeo and Juliet', 'William Shakespeare')
#   # deletes the Romeo and Juliet book object from @books and returns it
#   # i.e. returns #<Book:0x0000558ee2ffcf50 @title="Romeo and Juliet", @author="William Shakespeare">

# # lib.books.each { |book| puts book }
# #   # => Great Expectations by Charles Dickens
# #   # => Ulysses by James Joyce

# # lib.checkout_book('The Odyssey', 'Homer')
# #   # => The library does not have that book

# Ginni's solution:
# class Library
#   attr_accessor :books

#   def initialize
#     @books = []
#   end

#   def <<(book)
#     books.push(book)
#   end

#   def checkout_book(title, author)
#     book = Book.new(title, author)
#     if books.include?(book)
#       books.delete(book_to_checkout)
#     else
#       puts "The library does not have that book"
#     end
#   end
# end

# class Book
#   attr_reader :title, :author

#   def initialize(title, author)
#     @title = title
#     @author = author
#   end

#   def to_s
#     "#{title} by #{author}"
#   end

#   def ==(other)
#     title == other.title && author == other.author
#   end
# end

# lib = Library.new

# lib << Book.new('Great Expectations', 'Charles Dickens')
# lib << Book.new('Romeo and Juliet', 'William Shakespeare')
# lib << Book.new('Ulysses', 'James Joyce')

# lib.books.each { |book| puts book }
#   # => Great Expectations by Charles Dickens
#   # => Romeo and Juliet by William Shakespeare
#   # => Ulysses by James Joyce

# lib.checkout_book('Romeo and Juliet', 'William Shakespeare')
#   # deletes the Romeo and Juliet book object from @books and returns it

# lib.books.each { |book| puts book }
#   # => Great Expectations by Charles Dickens
#   # => Ulysses by James Joyce

# lib.checkout_book('The Odyssey', 'Homer')
#   # => The library does not have that book

