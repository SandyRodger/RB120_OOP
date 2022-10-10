require 'pry'
class Board
  attr_accessor :vulnerable_square

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

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

  def has_two_x_and_an_empty_in_a_row?
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_squares_in_a_line_x?(squares) && one_square_in_a_line_empty?(squares)
        return true
      end
    end
    false
  end

  def two_squares_in_a_line_x?(squares)
    markers = squares.select(&:human?).collect(&:marker)
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
    (1..9).each { |key| @squares[key] = Square.new(key) }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
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
end

class Player
  attr_reader :marker
	attr_accessor :name

  def initialize(marker, name)
    @marker = marker
		@name = name
  end
end

class TTTGame
  HUMAN_MARKER = "X"
	HUMAN_NAME = "Human"
  COMPUTER_MARKER = "O"
	COMPUTER_NAME = "Computer"
  FIRST_TO_MOVE = HUMAN_MARKER

  @@computer_wins = 0
  @@human_wins = 0

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER, HUMAN_NAME)
    @computer = Player.new(COMPUTER_MARKER, COMPUTER_NAME)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
		choose_name
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

	def choose_name
		puts "What's your name?"
		answer = gets.chomp.capitalize
		human.name = answer
		puts "And what are we naming the computer?"
		answer = gets.chomp.capitalize
		computer.name = answer
	end

  def five_wins?
    @@human_wins == 5 || @@computer_wins == 5
  end

  def player_move
    loop do
      current_player_moves
      count_win
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
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

  def display_board
    puts "#{human.name} is a #{human.marker}. #{computer.name} is a #{computer.marker}."
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

    board[square] = human.marker
  end

  def computer_moves
    if board.has_two_x_and_an_empty_in_a_row?
      computer_block(board.vulnerable_square)
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def computer_block(_vulnerable_square)
    board[board.vulnerable_square] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      @@human_wins += 1
      puts "#{human.name} won!"
      display_score
    when computer.marker
      @@computer_wins += 1
      puts "#{computer.name} won!"
      display_score
    else
      puts "It's a tie!"
      display_score
    end
  end

  def display_score
    puts "The score is #{@@human_wins} to #{human.name}, #{@@computer_wins} to #{computer.name}."
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
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
