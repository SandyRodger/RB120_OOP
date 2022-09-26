=begin
https://launchschool.com/lessons/97babc46/assignments/7dcb53f1

1. Write a description of the problem and extract the major nouns and verbs.

2. Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.

3. Optional - when you have a better idea of the problem, model your thoughts into CRC cards.

Description:

Tic Tac Toe is a 2-player board came played on a 3x3 grid. Players take turns marking a square. The first player to mark 3 squares in a row wins.

Nouns: board, player, square, grid.
Verbs: play, mark

Board
Square
Player
- mark
- play

=end

require 'pry' 
	
class Board
	INITIAL_MARKER = " "
	def initialize
		@squares = {}
		(1..9).each {|key| @squares[key] = Square.new(INITIAL_MARKER)}
	end

	def get_square_at(key)
		@squares[key]
	end
end

class Square
	def initialize(marker)
		@marker = marker
	end

	def to_s
		@marker
	end
end

class Player
	attr_reader :marker
	def initialize(marker)
		@marker = marker
	end

	def mark
	end

	def play
	end
end	

class TTTGame
	attr_reader :board, :human, :computer

	def initialize
		@board = Board.new
		@human = Player.new("X")
		@computer = Computer.new("O")
	end

	def display_welcome_message
		puts "Welcome to Tic Tac Toe!"
		puts ""
	end

	def display_goodbye_message
		puts "Thanks for playing Tic Tac Toe! Goodbye!"
	end

	def display_board
		puts ""
		puts "     |     |"
		puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
		puts "     |     |"
		puts "-----|-----|-----"
		puts "     |     |"
		puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
		puts "     |     |   "
		puts "-----|-----|-----"
		puts "     |     |"
		puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
		puts "     |     |"
		puts ""
	end

	def human_moves
		puts "choose a square between 1 and 9:"
		loop do
			square = gets.comp.to_i
			break if (1..9).include?(square)
			puts "Sorry, that's not a valid choice."
		end

		binding.pry
		board.set_square_at(square, human.marker)
	end

	def computer_moves()
		board.set_square_at((1..9).to_asample), computer.marker)
	end

	def play
		display_welcome_message
		loop do
			display_board
			human_moves
			display_board
			computer_moves
			display_board
			first_player_moves
			break if someone_won? || board_full?

			second_player_moves
			break if someone_won? || board_full?
		end
		# display_result
		display_goodbye_message
	end
end

game = TTTGame.new
game.play