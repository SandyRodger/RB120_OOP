=begin

How does Ruby find the #jab instance method definition once it's invoked on line 28? Describe how Ruby goes about this process, both in general and with specific reference to the given code example.

=end
module RegionalChampMoves
  def jab; end
end

module StateChampMoves
  def hook; end
end

module NationalChampMoves
  def uppercut; end
end

class Boxer; end

class Amateur < Boxer
  include RegionalChampMoves
end

class Novice < Amateur
  include StateChampMoves
end

class Professional < Novice
  include NationalChampMoves
end

boxer = Professional.new
boxer.jab
=begin
Your Answer
When the #jab method is called Ruby starts the method lookup path by searching the object class, which is Professional. Not finding it follows this method lookup path:

Professional < NationalChampMoves < Novice < StateChampMoves < Amateur < RegionalChampMoves

This is because the method lookup path will search a class for a method, then search all included modules (beginning at the bottom of the class), then move on to the parent class and repeat the process. Here the method is eventually found in RegionalChampMoves. The Boxer class is not reached, but if it was an the method was not found there Ruby would go on to search in Object, Kernel, BasicObject and return a NoMethod Error when it was not defined there.

Responses

Clare MacAdie (TA)
about 5 hours ago
Excellent
=end