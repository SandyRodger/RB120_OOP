=begin
Lines 15-17 should return true if two books have the same author. What is actually happening on lines 15-17, and why? Update the code so that lines 15-17 output the correct values and explain why you implemented the code that you did.

=end

class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end
end

kindred = Book.new('Kindred', 'Octavia E. Butler')
fledgling = Book.new('Fledgling', 'Octavia E. Butler')
imposter = Book.new('Imposter', 'Philip K. Dick')
minority_report = Book.new('Minority Report', "Philip K. Dick")

p kindred == fledgling        # should output true
p fledgling == imposter       # should output false
p imposter == minority_report # should output true

=begin
Your Answer
In this code the #== method is implementing as defined in the BasicObject class. Sio it is comparing the object_ids of both objects essentially asking are these two objects the same object as found in the computer's memory. This outputs false three times. For the code to compare authors the #== method should be overridden as follows:

=end
def ==(other)
    self.author == other.author
end
=begin
This ensures that when each Book object calls the #== method the method lookup path finds Book#== and compares the values returned by the #author getter method. As this method returns an instance variable referring to the same string it will return true twice and false once.

Responses

Clare MacAdie (TA)
about 5 hours ago
Be careful to use inline code formatting to make your answers clearer 😉.