class Move
	VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

	def initialize(value)
		@value = value
	end

	def scissors?
		@value == 'scissors'
	end

	def rock?
		@value == 'rock'
	end

	def paper?
		@value == 'paper'
	end

	def lizard?
		@value == 'lizard'
	end

	def spock?
		@value == 'spock'
	end

	def >(other_move)
		((rock? && other_move.scissors?)||(rock? && other_move.lizard?)) || 
			((paper? && other_move.rock?)||(paper? && other_move.spock?)) || 
			((scissors? && other_move.paper?)||(scissors? && other_move.lizard?))||
			((lizard? && other_move.paper?)||(lizard? && other_move.spock?)) ||
			((spock? && other_move.rock?)||(spock? && other_move.scissors?))
	end

	def <(other_move)
		((rock? && other_move.paper?)||(rock? && other_move.spock?)) ||
			((paper? && other_move.scissors?)||(paper? && other_move.lizard?)) ||
			((scissors? && other_move.rock?)||(scissors? && other_move.spock?))||
			((lizard? && other_move.rock?)||(lizard? && other_move.scissors?))||
			((spock? && other_move.lizard?)||(spock? && other_move.paper?))
	end

	def to_s
		@value
	end
end

class Rock < Move
	def initialize
		@value = 'rock'
	end
end

class Paper < Move
	def initialize
		@value = 'rock'
	end
end

class Scissors < Move
	def initialize
		@value = 'scissors'
	end
end

class Lizard < Move
	def initialize
		@value = 'lizard'
	end
end

class Spock < Move
	def initialize
		@value = 'spock'
	end
end

class Player
	attr_accessor :move, :name

	def initialize
		set_name
	end
end

class Human < Player
	def set_name
		n = ""
		loop do
			puts "What's your name?"
			n = gets.chomp
			break unless n.empty?
			puts "Sorry, must enter a value."
		end
		self.name = n
	end

	def choose
		choice = nil
		loop do
			puts "Please choose rock, paper, scissors, lizard or spock:"
			choice = gets.chomp
			break if Move::VALUES.include? choice
			puts "Sorry, invalid choice."
		end
		
		if choice == 'rock'
			self.move = Rock.new
		elsif choice == 'paper'
			self.move = Paper.new
		elsif choice == 'scissors'
			self.move = Scissors.new		
		elsif choice == 'lizard'
			self.move = Lizard.new
		elsif choice == 'spock'
			self.move = Spock.new
		end
	end
end

class Computer < Player
	def set_name
		self.name = ['R2D2', 'Hal', 'Chappie', 'Wallie', 'Number 5'].sample
	end

	def choose
		self.move = Move.new(Move::VALUES.sample)
	end
end

class RPSGame
	attr_accessor :human, :computer

	@@human_score = 0
	@@computer_score = 0
	@@winner = nil

	def initialize
		@human = Human.new
		@computer = Computer.new
	end

	def display_welcome_message
		puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
	end

	def display_goodbye_message
		puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
	end

	def display_moves
		puts "#{human.name} chose #{human.move}."
		puts "#{computer.name} chose #{computer.move}."
	end

	def determine_winner
		if human.move > computer.move
			@@winner = 'human'
			@@human_score += 1
		elsif human.move < computer.move
			@@winner = 'computer'
			@@computer_score += 1
		end
	end

	def display_winner
		if @@winner == 'human'
			puts "#{human.name} won!"
		elsif @@winner == 'computer'
			puts "#{computer.name} won!"
		else
			puts "It's a tie!"
		end
	end

	def tally_score
		puts "#{human.name}'s score is #{@@human_score}."
		puts "#{computer.name}'s score is #{@@computer_score}."
	end

	def play_again?
		answer = nil
		loop do
			puts "Would you like to play again? (y/n)"
			answer = gets.chomp
			break if ['y', 'n'].include? answer.downcase
			puts "Sorry, must be y or n"
		end
		return true if answer == 'y'
		return false
	end

	def play
		display_welcome_message
		loop do
			human.choose
			computer.choose
			display_moves
			determine_winner
			tally_score
			display_winner
			break unless play_again?
		end
		display_goodbye_message
	end
end

RPSGame.new.play