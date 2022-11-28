=begin

https://launchschool.com/exercises/e4b17f84

Number Guesser Part 1

Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!

Note that a game object should start a new game with a new number to guess with each call to #play.

=end

class GuessingGame
	attr_reader :guess, :hidden_num
	@@guesses_remaining = 7

	def initialize
		@hidden_num = Random.new.rand(100)
	end

	def play
		loop do
			display_guesses
			return winning_message if evaluateguess(player_guesses) == :win
			return losing_message if @@guesses_remaining == 0
		end
	end

	private

	def display_guesses
		puts "You have #{@@guesses_remaining} guesses remaining."
	end

	def player_guesses
		loop do
			puts "Enter a number between 1 and 100:"
			answer = gets.chomp.to_i
			@@guesses_remaining -= 1
			return answer if (1..100).include?(answer)
			puts "Invalid guess"
		end
	end

	def winning_message
		puts "You won!"
	end

	def losing_message
		puts "You have no more guesses. You lost!"
	end

	def evaluateguess(guess)
		if guess > hidden_num
			puts "Your guess is too high."
		elsif guess < hidden_num
			puts "Your guess is too low."
		else
			puts "That's the number!"
			return :win
		end
	end
end

game = GuessingGame.new
game.play