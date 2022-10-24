=begin

https://launchschool.com/lessons/97babc46/assignments/819bf113

=end
require 'byebug'
require 'colorize'

module Common_Methods
	def brief_pause
		sleep 2
	end

	def question_and_answer(question)
		puts question
		answer = gets.chomp.capitalize
	end
end

class Deck
	SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
	VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

	attr_reader :cards

	include Common_Methods
	
  def initialize
		@cards = self.create
  end

	def write_cards
		SUITS.product(VALUES).shuffle
	end 

	def new_card(player)
		new_card = nil
			loop do
				new_card = self.cards.sample
				break if !player.cards.include?(new_card)
			end
			new_card
	end

	def create
		card_data =	self.write_cards
		card_data.each_with_object([]) do |card_data, deck_arr|
			deck_arr << Card.new(card_data)
		end
	end

  def deal_a_card
			@cards.sample
  end

	def deal_two_cards(player)
		puts "Dealer gives #{player.name} 2 cards..."
		brief_pause
		2.times do 
			player.cards << deal_a_card
		end
	end

end

class Game < Deck
	attr_reader :deck, :current_player
	attr_accessor :human_player, :computer_player

	TURN_ENDING_RESULTS = ["bust","stay","win"]

	include Common_Methods
	
	def initialize
		@deck = Deck.new
		@human_player = Player.new("Human", "player")
		@computer_player = Player.new("Computer", "dealer", false)
		@current_player = @human_player
	end

  def start
		welcome_message
		main_game
		final_message
	end

	def welcome_message
		brief_pause
		puts "Welcome to Twenty One!".red
		human_player.ask_name
		brief_pause
		computer_player.ask_name
	end

	def main_game
		result = nil
		deck.deal_two_cards(human_player)
		brief_pause
		deck.deal_two_cards(computer_player)
		initial_show_cards
		loop do
			loop do
				result = current_player.take_turn(deck)
				if current_player.got_exactly_21?
					puts "#{current_player.name} has got exactly 21!"
					return "win"
				end
				break if TURN_ENDING_RESULTS.include?(result)
			end
			break if ["win","bust"].include?(result)
			change_player
			break if both_players_played?
		end
		compare_hands
	end

	def compare_hands
		if ((computer_player.total > human_player.total) && (computer_player.total < 22))
			puts "#{computer_player.name} has beaten you!"
		elsif human_player.busted?
			puts "in a sense #{human_player.name}, you have beaten yourself"
		else
			puts "#{human_player.name} wins!"
		end
	end

	def change_player
		current_player.is_human ? @current_player = @computer_player : @current_player = @human_player
	end

	def final_score
		"Human: #{human_player.total} , Computer #{computer_player.total}"
	end

	def final_message
		puts final_score
		puts "Thank you for playing. Bye!"
	end

	def both_players_played?
		!@computer_player.cards.empty? && !@human_player.cards.empty?
	end

	def initial_show_cards
		computer_card = computer_player.cards.map do |card|
			[card.value, card.suit]
		end
		human_player.show_cards
		puts "#{computer_player.name} has a #{computer_card[0][0]} of #{computer_card[0][1]} and something else"
	end
end

class Player < Game
	attr_accessor :cards, :total, :name
	attr_reader :is_human

	include Common_Methods 

	def initialize(name, role, is_human=true)
		@name = name
		@role = role
		@cards = []
		@total = 0
		@is_human = is_human
	end
	
	def ask_name
		self.name = question_and_answer("What is #{self.name}'s name?")
		if self.is_human 
			self.name = self.name.blue
		else
			self.name = self.name.yellow
		end
	end

	def take_turn(deck)
		loop do
			if self.busted?
				self.busted_message
				return "bust"
			end
			case self.hit_or_stay
				when "hit"
					puts "#{self.name} hit."
					brief_pause
					self.cards << deck.deal_a_card
					self.show_cards
					return "hit"
				when "stay"
					return "stay"
			end
		end
	end

	def got_exactly_21?
		self.total == 21
	end

  def busted?
		self.total > 21
  end

	def busted_message 
		puts "#{self.name}'s score has exceeded 21. That is a bust"
	end

	def winning_message
		puts "you got 21 exactly, well done!"
	end

	def hit_or_stay_human
		loop do
			case question_and_answer("hit(1) or stay(2)?")
			when "1"
				brief_pause
				return "hit"
			when "2"
				brief_pause
				return "stay"
			else
				puts "invalid input"
			end
		end
	end

	def show_cards
		puts "#{self.name} has #{self.cards.map do |card|
				"a #{card.value} of #{card.suit}"
			end.join(", ")}"
		puts "This scores as #{self.total}"
	end

	def hit_or_stay_computer
		loop do
			if self.total < 17
				brief_pause
				return "hit"
			else 
				brief_pause
				return "stay"
			end
		end
	end

	def hit_or_stay
		if self.is_human
			hit_or_stay_human
		else
			hit_or_stay_computer
		end
	end

	def ace?(card_symbol)
		card_symbol == "Ace"
	end
	
	def face_card?(card_symbol)
		card_symbol.to_i == 0
	end
	
  def total
		sum = 0
		@cards.map {|card| card.value}.each do |card_symbol|
			if ace?(card_symbol)
				sum += 11
			elsif face_card?(card_symbol) # J, Q, K
				sum += 10
			else
				sum += card_symbol.to_i
			end
		end
		sum
  end
end

class Card
	attr_reader :suit, :value

  def initialize(card_data)
    @suit = card_data[0]
		@value = card_data[1]
  end
end

Game.new.start