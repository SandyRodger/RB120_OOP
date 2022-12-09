=begin

https://launchschool.com/exercises/a1938086

In the previous two exercises, you developed a Card class and a Deck class. You are now going to use those classes to create and evaluate poker hands. Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand. If you've never played poker before, you may find this overview of poker hands useful.

You should build your class using the following code skeleton:

=end


require 'byebug'

# Include Card and Deck classes from the last two exercises.

class PokerHand
	attr_accessor :hand

	ROYAL_FLUSH = ["Ace", "King", "Queen", "Jack", 10]
	STANDARD_SEQUENCE = ["Ace", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King"]
	ACE_HIGH_SEQUENCE = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]

  def initialize(cards)
		if cards.is_a?(Array)
			@hand = cards
		else
			@hand = []
			5.times {hand << cards.cards.pop}
		end
  end

  def print
		puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

	def all_one_suit?
		hand.map{|card|card.suit}.sort == hand.map{|card|card.suit}
	end

	def ranks
		hand.map{|card| card.rank}
	end

	def check_ranks_against(poker_hand)
		poker_hand.map{|card_value| ranks.include? card_value }.all?(true)
	end

	def ranks_in_sequence?
		sequence = contains_ace? ? ACE_HIGH_SEQUENCE : STANDARD_SEQUENCE
		arr = ranks_in_sequence(sequence)
		sequence.index(arr[0]) == (sequence.index(arr[-1]) - 4) 
	end

	def contains_ace?
		ranks.include?("Ace")
	end

	def duplicates
		ranks.map{|rank| ranks.count(rank)}
	end

	def ranks_in_sequence(sequence)
		arr = []
		sequence.each do |rank|
			if ranks.include?(rank)
				arr << rank
			end
		end
		arr
	end

  def royal_flush?
			all_one_suit? && check_ranks_against(ROYAL_FLUSH)
  end

  def straight_flush?
		all_one_suit? && ranks_in_sequence?
  end

  def four_of_a_kind?
		duplicates.max == 4
  end

  def full_house?
		duplicates.max == 3 && duplicates.min == 2
  end

  def flush?
		all_one_suit?
  end

	def no_duplicates?
		duplicates.max == 1
	end

  def straight?
		ranks_in_sequence? && no_duplicates?
  end

  def three_of_a_kind?
		duplicates.max == 3
  end

  def two_pair?
		count = duplicates.count{|n|n > 1}
		count == 4
  end

  def pair?
		count = duplicates.count{|n|n > 1}
		count == 2
  end
end

class Deck
	attr_accessor :cards
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

	def initialize
		@cards = reset_deck
	end

	def reset_deck
		@cards = new_deck.shuffle
	end

	def new_deck
		new_deck = []
		SUITS.each do |suit|
			RANKS.each do |rank|
				new_deck << Card.new(rank, suit)
			end
		end
		new_deck
	end

	def draw
		reset_deck if cards.empty?
		cards.pop
	end
end

class Card
  attr_reader :rank, :suit
	include Comparable

	CARD_VALUES = {
		"Jack" => 11,
		"Queen" => 12,
		"King" => 13,
		"Ace" => 14
	}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

	def to_s
		"#{rank} of #{suit}"
	end

	def value
		(2..10).include?(rank) ? rank : CARD_VALUES[rank]
	end

	def <=>(other_card)
		value <=> other_card.value
	end

end

deck = Deck.new
# LS tests:

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate


# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'


hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'