=begin

What happens if the board is 5x5 instead of 3x3? What about a 9x9 board?
	
=end
require 'colorize'
require 'pry'
class Board
  attr_accessor :vulnerable_square

  WINNING_LINES = [[1, 2, 3], [2, 3, 4], [3, 4, 5]] + # rows 1
									[[6, 7, 8], [7, 8, 9], [8, 9, 10]] + # rows 2
									[[11, 12, 13], [12, 13, 14], [13, 14, 15]] + # rows 3
                  [[16, 17, 18], [17, 18, 19], [18, 19, 20]] + # rows 4
									[[21, 22, 23], [22, 23, 24], [23, 24, 25]] + # rows 5
									[[1, 6, 11], [6, 11, 16], [11, 16, 21]] + # cols 1
									[[2, 7, 12], [7, 12, 17], [12, 17, 22]] + # cols 2
									[[3, 8, 13], [8, 13, 18], [13, 18, 23]] + # cols 3
									[[4, 9, 14], [9, 14, 19], [14, 19, 24]] + # cols 4
									[[5, 10, 15], [10, 15, 20], [15, 20, 25]] + # cols 5
									[[1, 7, 13], [2, 8, 14], [3, 9, 15]] + # \ diag 1 
                  [[6, 12, 18], [7, 13, 19], [8, 14, 20]] + # \ diag 2
									[[11, 17, 23], [12, 18, 24], [13, 19, 25]] + # \ diag 2
									[[3, 7, 11], [4, 8, 12], [5, 9, 13]] + # / diag 1
									[[8, 12, 16], [9, 13, 17], [10, 14, 18]] + # / diag 2
									[[13, 17, 21], [14, 18, 22], [15, 19, 23]] # / diag 3

  def initialize
    @squares = {}
    @vulnerable_square = nil
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

	def square_five_is_empty?
		target = @squares.values_at(5)
		target[-1].marker == ' '
	end

	def square_three_is_empty?
		target = @squares.values_at(3)
		target[-1].marker == ' '
	end

  def has_two_and_an_empty_in_a_row?(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_squares_in_a_line_match?(squares,marker) && one_square_in_a_line_empty?(squares)
        return true
      end
    end    
		false
  end

  def two_squares_in_a_line_match?(squares, marker)
		if marker == "X"
    	markers = squares.select(&:human?).collect(&:marker)
		elsif marker == "O"
			markers = squares.select(&:computer?).collect(&:marker)
		elsif marker == "*"
			markers = squares.select(&:computer_two?).collect(&:marker)
		end
    return false if markers.size != 2
    true
  end

  def one_square_in_a_line_empty?(squares)
    key = squares.select(&:unmarked?).collect(&:key)
    if key.size != 1
      false
    else
      @vulnerable_square = squares.select(&:unmarked?).collect(&:key)[0]
      true
    end
  end

  def reset
    (1..25).each { |key| @squares[key] = Square.new(key) }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "1    |2    |3    |4    |5"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  |  #{@squares[4]}  |  #{@squares[5]}  "
    puts "     |     |     |     |"
    puts "-----+-----+-----+-----+-----"
    puts "6    |7    |8    |9    |10"
    puts "  #{@squares[6]}  |  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  |  #{@squares[10]}  "
    puts "     |     |     |     |"
    puts "-----+-----+-----+-----+-----"
    puts "11   |12   |13   |14   |15"
    puts "  #{@squares[11]}  |  #{@squares[12]}  |  #{@squares[13]}  |  #{@squares[14]}  |  #{@squares[15]}"
    puts "     |     |     |     |"
    puts "-----+-----+-----+-----+-----"
		puts "16   |17   |18   |19   |20"
    puts "  #{@squares[16]}  |  #{@squares[17]}  |  #{@squares[18]}  |  #{@squares[19]}  |  #{@squares[20]}  "
    puts "     |     |     |     |"
    puts "-----+-----+-----+-----+-----"
		puts "21   |22   |23   |24   |25"
    puts "  #{@squares[21]}  |  #{@squares[22]}  |  #{@squares[23]}  |  #{@squares[24]}  |  #{@squares[25]}  "
    puts "     |     |     |     |"

  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker, :key

  def initialize(key)
    @key = key
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def human?
    marker == 'X'
  end

	def computer?
		marker == 'O'
	end

	def computer_two?
		marker == '*'
	end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
	COMPUTER_TWO_MARKER = "*"

  @@computer_wins = 0
  @@human_wins = 0
	@@computer_two_wins = 0

  attr_reader :board, :human, :computer, :computer_two

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
		@computer_two = Player.new(COMPUTER_TWO_MARKER)
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      player_move
      display_result
      break if five_wins?
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def five_wins?
    @@human_wins == 5 || @@computer_wins == 5
  end

  def player_move
		# ask_computer_first_player
    loop do
      current_player_moves
      count_win
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

	def ask_computer_first_player
		answer = [1, 2].sample
		if answer == 2
			@current_marker = COMPUTER_MARKER
		end				
	end

	def ask_first_player
		answer = nil
		loop do
			puts "Who will take the first turn? (you = 1, computer = 2)"
			answer = gets.chomp.to_i
			break if [1, 2].include?(answer)
			puts "that is not a valid answer"
		end
		if answer == 2
			@current_marker = COMPUTER_MARKER
		end
	end

  def count_win
    if board.someone_won? == HUMAN_MARKER
      @@human_wins += 1
    elsif board.someone_won? == COMPUTER_MARKER
      @@computer_wins += 1
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

	def computer_turn?
		@current_marker == COMPUTER_MARKER
	end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker.red
  end

  def computer_moves
    if board.has_two_and_an_empty_in_a_row?(computer.marker) #computer's about to win
			player_fill_empty(computer.marker, board.vulnerable_square)  # computer fills in 3rd square
		elsif
			board.has_two_and_an_empty_in_a_row?(human.marker) # Human's about to win...
      player_fill_empty(computer.marker, board.vulnerable_square)   # computer blocks
		elsif 
			board.square_three_is_empty?
			board[3] = computer.marker.green
		elsif
			board.square_five_is_empty?
			board[5] = computer.marker.green
		else
      board[board.unmarked_keys.sample] = computer.marker.green
    end
  end

	def computer_two_moves
    if board.has_two_and_an_empty_in_a_row?(computer_two.marker) #computer's about to win
			player_fill_empty(computer_two.marker, board.vulnerable_square)  # computer fills in 3rd square
		elsif
			board.has_two_and_an_empty_in_a_row?(human.marker) # Human's about to win...
      player_fill_empty(computer_two.marker, board.vulnerable_square)   # computer blocks
		elsif 
			board.square_three_is_empty?
			board[3] = computer_two.marker.yellow
		elsif
			board.square_five_is_empty?
			board[5] = computer_two.marker.yellow
		else
      board[board.unmarked_keys.sample] = computer_two.marker.yellow
    end
	end

  def player_fill_empty(player, vulnerable_square)
    board[board.vulnerable_square] = player.green
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
		elsif computer_turn?
      computer_moves
      @current_marker =  COMPUTER_TWO_MARKER
		else 
			computer_two_moves
			@current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker.red
      @@human_wins += 1
      puts "You won!"
      display_score
    when computer.marker.green
      @@computer_wins += 1
      puts "Computer won!"
      display_score
		when computer_two.marker.yellow
			@@computer_two_wins += 1
			puts "Computer two won!"
			display_score
    else
      puts "It's a tie!"
      display_score
    end
  end

  def display_score
    puts "The score is:
		YOU:        #{@@human_wins}
		COMPUTER:   #{@@computer_wins}
		COMPUTER_2: #{@@computer_two_wins}"
  end

  def joinor(arr)
    case arr.size
    when 1
      arr[0]
    when 2
      "#{arr[0]} or #{arr[1]}"
    else
      arr_2 = arr.join("; ")
      arr_2.insert(-3, " and")
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
