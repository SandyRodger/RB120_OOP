=begin

https://launchschool.com/lessons/97babc46/assignments/819bf113

=end
require 'pry'

class Player
	attr_accessor :cards, :total
	def initialize(name, role)
		@name = name
		@role = role
		@cards = []
		@total = 0
	end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
		values = @cards.map {|card| card.value}
		sum = 0
		values.each do |card|
			if ace?(card)
				sum += 11
			elsif face_card?(card) # J, Q, K
				sum += 10
			else
				sum += card.to_i
			end
		end
		sum
  end
end

def ace?(card)
	card == "Ace"
end

def face_card?(card)
	card.to_i == 0
end

class Deck
	SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
	VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

	attr_reader :cards

  def initialize
		@cards = self.create
  end

	def write_cards
		SUITS.product(VALUES).shuffle
	end 

	def create
		card_data =	self.write_cards
		card_data.each_with_object([]) do |card_data, deck_arr|
			deck_arr << Card.new(card_data)
		end
	end

  def deal_a_card(player)
			player.cards << @cards.sample
  end
end

class Card
	attr_reader :suit, :value

  def initialize(card_data)
    @suit = card_data[0]
		@value = card_data[1]
  end
end

class Game
	attr_reader :deck, :human_player, :computer_player

	@@current_player = "Human"

	def initialize
		@deck = Deck.new
		@human_player = Player.new("Human", "player")
		@computer_player = Player.new("Computer", "dealer")
	end

  def start
		loop do
			deck.deal_a_card(human_player)
			show_cards
			player_turn(@@current_player)
			show_cards
			break
			dealer_turn
			show_result
		end
  end

	def player_turn(player)
		case player
		when "Human"
			if draw?
				new_card = nil
				loop do
					new_card = deck.cards.sample
					break if !human_player.cards.include?(new_card)
				end
				human_player.cards << new_card
			else
				nil
			end
		when "Computer"
			nil
		end
		if @@current_player == "Human"
			@@current_player = "Computer"
		else
			@@current_player = "Human"
		end
	end

	def draw?
		answer = nil
		loop do
			puts "draw(1) or fold(2)?"
			answer = gets.chomp
			break if "12".include?(answer)
		end
		answer == "1"
	end

	def show_cards
		puts "You have #{
			human_player.cards.map do |card|
				"a #{card.value} of #{card.suit}"
			end.join(", ")
		}"
		puts "your total score is #{human_player.total}"
		if !computer_player.cards.empty?
			puts "Computer has #{
				computer_player.cards.map do |card|
					"a #{card.value} of #{card.suit}"
				end.join(", ")
			}"
		puts "Computer's score is total score is #{computer_player.total}"
			end
	end
end

Game.new.start