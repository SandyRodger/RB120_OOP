require 'byebug'
require 'colorize'

class Move
	attr_reader :value

	VALUES = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']
	OUTCOMES = {
		scissors_paper: "Scissors cuts Paper",
		paper_rock: "Paper covers rock",
		rock_lizard: "Rock crushes lizard",
		lizard_spock: "Lizard poisons Spock",
		spock_scissors: "Spock smashes scissors",
		scissors_lizard: "Scissors decapitates lizard",
		lizard_paper: "Lizard eats paper",
		paper_spock: "Paper disproves Spock",
		spock_rock: "Spock vaporises rock",
		rock_scissors: "Rock crushes scissors",
		tie: "It's a tie"
}

	def initialize(value)
		@value = value
	end

	def scissors?
		@value == 'Scissors'
	end

	def rock?
		@value == 'Rock'
	end

	def paper?
		@value == 'Paper'
	end

	def lizard?
		@value == 'Lizard'
	end

	def spock?
		@value == 'Spock'
	end

	def >(other_move)
		(rock? && (other_move.scissors? || other_move.lizard?)) || 
			(paper? && (other_move.rock?|| other_move.spock?)) || 
			(scissors? && (other_move.paper? ||other_move.lizard?))||
			(lizard? && (other_move.paper? || other_move.spock?)) ||
			(spock? && (other_move.rock?||other_move.scissors?))
	end

	def <(other_move)
		(rock? && (other_move.paper?|| other_move.spock?)) ||
			(paper? && (other_move.scissors?|| other_move.lizard?)) ||
			(scissors? && (other_move.rock?|| other_move.spock?))||
			(lizard? && (other_move.rock?|| other_move.scissors?))||
			(spock? && (other_move.lizard?|| other_move.paper?))
	end

	def to_s
		@value
	end
end

class Rock < Move
	def initialize
		@value = "#{self.class}"
	end
end

class Paper < Move
	def initialize
		@value = "#{self.class}"
	end
end

class Scissors < Move
	def initialize
		@value = "#{self.class}"
	end
end

class Lizard < Move
	def initialize
		@value = "#{self.class}"
	end
end

class Spock < Move
	def initialize
		@value = "#{self.class}"
	end
end

class Player
	attr_accessor :move, :name

	CHOICES = [Rock.new, Paper.new, Scissors.new, Lizard.new, Spock.new]

	def initialize
		set_id
	end
end

class Human < Player
	def set_id
		n = ""
		loop do
			puts "What's your name?".green
			n = gets.chomp.capitalize.red
			break unless n.empty?
			puts "Sorry, must enter a value."
		end
		self.name = n
	end

	def choose
		choice = nil
		loop do
			puts "Please choose (1)rock, (2)paper, (3)scissors, (4)lizard or (5)spock:".green
			choice = gets.to_i
			break if (1..5).include? choice
			puts "Sorry, invalid choice."
		end
		self.move = CHOICES[choice-1]
	end
end

class Computer < Player
	def name
		@name.yellow
	end

	def choose(_)
		self.move = Move.new(Move::VALUES.sample)
	end
end

class R2D2 < Computer
	def initialize
		@name = 'R2D2'
	end

	def choose(_)
		self.move = Move.new('Rock') # Always chooses Rock
	end
end

class Hal < Computer
	def initialize
		@name = 'Hal'
	end

	def choose(_)
		self.move = Move.new(['Rock', 'Paper', 'Scissors', 'Spock', 'Spock', 'Spock'].sample) # half of the time chooses Spock, never chooses Lizard
	end
end

class Chappie < Computer
	def initialize
		@name = 'Chappie'
	end

	def choose(human) # always wins
		case human.move.value
		when "Lizard"
			self.move = Move.new('Scissors') 
		when "Spock"
			self.move = Move.new('Paper') 
		when "Paper"
			self.move = Move.new('Lizard') 
		when "Scissors"
			self.move = Move.new('Rock') 
		when "Rock"
			self.move = Move.new('Scissors') 
		end
	end
end

class Wallie < Computer
	def initialize
		@name = 'Wallie'
	end
end

class Number_5 < Computer 
	def initialize
		@name = 'Number_5'
	end

	def choose(human) # always loses
		case human.move.value
		when "Lizard"
			self.move = Move.new('Paper') 
		when "Spock"
			self.move = Move.new('Rock') 
		when "Paper"
			self.move = Move.new('Spock') 
		when "Scissors"
			self.move = Move.new('Lizard') 
		when "Rock"
			self.move = Move.new('Scissors') 
		end
	end
end

class RPSGame
	attr_accessor :human, :computer

	@@human_score = 0
	@@computer_score = 0
	@@winner = nil
	@@moves = ""
	@@turn_number = 1

	def initialize
		@human = Human.new
		@computer = [R2D2.new, Chappie.new, Number_5.new, Hal.new, Wallie.new].sample
	end

	def display_welcome_message
		puts "Welcome #{human.name} to Rock, Paper, Scissors, Lizard, Spock!"
	end

	def display_goodbye_message
		puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
	end

	def display_moves
		puts "#{human.name} chose #{human.move}."
		puts "#{computer.name} chose #{computer.move}."
		outcome_parser(human.move.value, computer.move.value)
	end

	def determine_winner
		if human.move > computer.move
			@@winner = 'human'
			@@human_score += 1
		elsif human.move < computer.move
			@@winner = 'computer'
			@@computer_score += 1
		else
			@@winner = 'neither player'
		end
	end

	def display_round_winner
		if @@winner == 'human'
			puts "#{human.name} won this round!"
		elsif @@winner == 'computer'
			puts "#{computer.name} won this round!"
		elsif @@winner == 'neither player'
			puts Move::OUTCOMES[:tie]
		end
	end

	def tally_score
		puts "#{human.name}'s score is #{@@human_score}."
		puts "#{computer.name}'s score is #{@@computer_score}."
	end

	def outcome_parser(move1, move2)
		puts Move::OUTCOMES[case [move1, move2].sort
		when ["Paper", "Scissors"]
			:scissors_paper 
		when ["Lizard", "Rock"] 
			:rock_lizard 
		when ["Lizard", "Spock"] 
			:lizard_spock 
		when ["Scissors", "Spock"] 
			:spock_scissors
		when ["Lizard", "Scissors"]
			:scissors_lizard
		when ["Lizard", "Paper"]
			:lizard_paper 
		when ["Paper", "Spock"]
			:paper_spock 
		when ["Rock", "Spock"] 
			:spock_rock 
		when ["Rock", "Scissors"] 
			:rock_scissors 
		when move1 == move2 
			:tie 
		end]
	end

	def archive_moves
		@@moves<< "Turn #{@@turn_number}: #{human.name} chose #{human.move} and #{computer.name} chose #{computer.move} resulting in a win for #{@@winner}. Score is #{human.name} : #{@@human_score} / #{computer.name} : #{@@computer_score}.\n"
		@@turn_number += 1
	end

	def play_again?
		answer = nil
		loop do
			puts "Would you like to play again? (y/n)".green
			answer = gets.chomp
			break if ['y', 'n'].include? answer.downcase
			puts "Sorry, must be y or n"
		end
		return true if answer == 'y'
		return false
	end

	def display_archive
		puts "Archive:"
		puts @@moves
	end

	def display_overall_winner
		if @@human_score > @@computer_score
			winner = human.name
		elsif @@computer_score > @@human_score
			winner = computer.name
		else
			puts "It's a tie"
			return nil
		end
		puts "#{winner} has won the whole game!"
	end

	def play
		display_welcome_message
		loop do
			human.choose
			computer.choose(human)
			display_moves
			determine_winner
			display_round_winner
			tally_score
			archive_moves
			break unless play_again?
		end
		display_archive
		display_overall_winner
		display_goodbye_message
	end
end

RPSGame.new.play

