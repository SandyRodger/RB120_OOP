=begin

https://launchschool.com/lessons/97babc46/assignments/819bf113

=end
require 'byebug'
require 'colorize'

module Formatable
  def brief_pause
    sleep 0.5
  end

  def print_and_pause(text)
    puts text
    brief_pause
  end

  def question_and_answer(question)
    print_and_pause(question)
    gets.chomp.capitalize
  end
end

class Deck
  SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
  VALUES = ("2".."10").to_a + ['Jack', 'Queen', 'King', 'Ace']

  attr_reader :cards

  include Formatable

  def initialize
    @cards = create
  end

  def deal_a_card
    cards.sample
  end

  def deal_two_cards(player)
    print_and_pause "Dealer gives #{player.name} 2 cards..."
    2.times { player.cards << deal_a_card }
  end

  private

  def write_cards
    SUITS.product(VALUES).shuffle
  end

  def new_card(player)
    loop do
      new_card = cards.sample
      return new_card unless player.cards.include?(new_card)
    end
  end

  def create
    write_cards.each_with_object([]) { |card, arr| arr << Card.new(card) }
  end
end

class Game
  attr_reader :deck, :current_player
  attr_accessor :human_player, :dealer_player, :player_won

  include Formatable

  def initialize
    @deck = Deck.new
    @human_player = Player.new("Human")
    @dealer_player = Player.new("Dealer", false)
    @current_player = @human_player
    @player_won = false
  end

  def start
    welcome_message
    main_game
    final_message
  end

  private

  def reset
    @human_player.reset
    @dealer_player.reset
    @current_player = @human_player
  end

  def welcome_message
    print_and_pause "Welcome to Twenty One!"
    human_player.ask_name
    dealer_player.ask_name
  end

  def main_game
    loop do
      initial_deal
      # insert_test_hand
      twenty_one_protocol if turn == "21"
      compare_hands(dealer_player.total, human_player.total)
      final_score
      break unless play_again?
      reset
    end
  end

  def insert_test_hand
    fake_cards = [Card.new(["Spades", "Ace"]), Card.new(["Hearts", "Jack"])]
    human_player.cards = fake_cards
  end

  def twenty_one_protocol
    @player_won = true
    exactly_twenty_one_message
  end

  def turn
    loop do
      announce_turn
      return "21" if current_player.choice(deck) == "21"
      return "busted" if current_player.busted?
      @current_player = change_player
      break if both_players_played?
    end
  end

  def initial_deal
    deck.deal_two_cards(human_player)
    deck.deal_two_cards(dealer_player)
    dealer_player.show_a_card
  end

  def exactly_twenty_one_message
    print_and_pause "#{current_player.name} got 21 exactly, well done!"
  end

  def play_again?
    loop do
      answer = question_and_answer("Would you like to play again? (y/n)")
      return true if answer  == "Y"
      return false if answer == "N"
      print_and_pause "invalid input, try again."
    end
  end

  def announce_turn
    print_and_pause "#{current_player.name}'s turn:"
  end

  def compare_hands(c, h)
    if c == h
      print_and_pause "It's a tie!"
    elsif (c > h && c < 22) || h > 21
      print_and_pause "#{dealer_player.name} wins!"
    else
      print_and_pause "#{human_player.name} wins!"
    end
  end

  def change_player
    current_player.is_human ? @dealer_player : @human_player
  end

  def final_score
    print_and_pause "Human: #{human_player.total}"
    print_and_pause "Dealer: #{dealer_player.total}"
  end

  def final_message
    print_and_pause "Thank you for playing. Bye!"
  end

  def both_players_played?
    @dealer_player.played && @human_player.played
  end
end

class Card
  attr_reader :suit
  attr_accessor :value

  def initialize(card_data)
    @suit = card_data[0]
    @value = card_data[1]
  end
end

class Player < Card
  attr_accessor :cards, :name, :played
  attr_reader :is_human

  include Formatable

  def initialize(name, is_human=true)
    @name = name
    @cards = []
    @total = 0
    @is_human = is_human
    @played = false
  end

  def ask_name
    new_name = question_and_answer("What is #{name}'s name?")
    @name = is_human ? new_name.blue : new_name.yellow
  end

  def show_a_card
    cards.map do |card|
      print_and_pause "#{name} has a #{card.value} and an unknown card"
      break
    end
  end

  def choice(deck)
    loop do
      result = take_turn(deck)
      return "21" if result == "21"
      return result if result != "hit"
    end
  end

  def busted?
    total > 21
  end

  def total
    cards.map(&:value).map do |card_symbol|
      if ace?(card_symbol)
        ace_value(card_symbol)
      elsif face_card?(card_symbol)
        10
      else
        card_symbol.to_i
      end
    end.sum
  end

  def reset
    @cards = []
    @played = false
  end

  private

  def take_turn(deck)
    @played = true
    show_cards
    return check_for_bust if busted?
    return "21" if got_exactly_21?
    action = hit_or_stay
    return hit_protocol(deck) if action == "hit"
    return stay_protocol if action == "stay"
  end

  def check_for_bust
    if busted? && high_ace_present?
      @total = recalculate_total
      recalculate_message
    elsif busted?
      busted_message
    end
  end

  def recalculate_message
    print_and_pause "Your score has exceeded 21..."
    print_and_pause "we're now valuing an Ace as 1 instead of 11"
    total == "21" ? (return "21") : (return "hit")
  end

  def recalculate_total
    ace = cards.select { |c| c.value == "Ace" }
    ace[0].value = "(low) ace"
    @total = total
  end

  def high_ace_present?
    cards.map(&:value).include?("Ace")
  end

  def stay_protocol
    print_and_pause "#{name} stayed."
    "stay"
  end

  def hit_protocol(deck)
    print_and_pause "#{name} hit."
    cards << deck.deal_a_card
    "hit"
  end

  def got_exactly_21?
    total == 21
  end

  def busted_message
    print_and_pause "#{name}'s score has exceeded 21."
    "bust"
  end

  def show_cards
    print_and_pause "#{name} has #{cards.map do |card|
			                                  "a #{card.value} of #{card.suit}"
		                                 end.join(', ')}"
    print_and_pause "This scores as #{total}"
  end

  def ace?(card_symbol)
    card_symbol == "Ace" || card_symbol == "(low) ace"
  end

  def face_card?(card_symbol)
    card_symbol.to_i == 0
  end

  def ace_value(card_symbol)
    return 11 if card_symbol == "Ace"
    1
  end

  def low_ace?(symbol)
    symbol == "(low) ace"
  end

  def hit_or_stay
    is_human ? hit_or_stay_human : hit_or_stay_dealer
  end

  def hit_or_stay_human
    loop do
      case question_and_answer("hit(1) or stay(2)?")
      when "1"
        return "hit"
      when "2"
        return "stay"
      else
        print_and_pause "invalid input"
      end
    end
  end

  def hit_or_stay_dealer
    if total < 17
      print_and_pause "because the points add up to less than 17..."
      "hit"
    else
      print_and_pause "because the points add up to 17 or more..."
      "stay"
    end
  end
end

Game.new.start
