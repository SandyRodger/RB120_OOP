=begin

https://launchschool.com/exercises/9bb05e87

Deck of Cards
Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
end

The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

Examples:

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always true

Note that the last line should almost always be true; if you shuffle the deck 1000 times a second, you will be very, very, very old before you see two consecutive shuffles produce the same results. If you get a false result, you almost certainly have something wrong.

=end

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
drawn = []
52.times { drawn << deck.draw}
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always true