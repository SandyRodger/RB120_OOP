=begin

https://launchschool.com/exercises/e50996f7

Number Guesser Part 2
In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:

Math.log2(size_of_range).to_i + 1
Examples:

game = GuessingGame.new(501, 1500)
game.play

You have 10 guesses remaining.
Enter a number between 501 and 1500: 104
Invalid guess. Enter a number between 501 and 1500: 1000
Your guess is too low.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 1250
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 1375
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 80
Invalid guess. Enter a number between 501 and 1500: 1312
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 1343
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 1359
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 1351
Your guess is too high.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 1355
That's the number!

You won!

game.play
You have 10 guesses remaining.
Enter a number between 501 and 1500: 1000
Your guess is too high.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 750
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 875
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 812
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 843
Your guess is too high.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 820
Your guess is too low.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 830
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 835
Your guess is too low.

You have 2 guesses remaining.
Enter a number between 501 and 1500: 836
Your guess is too low.

You have 1 guess remaining.
Enter a number between 501 and 1500: 837
Your guess is too low.

You have no more guesses. You lost!
Note that a game object should start a new game with a new number to guess with each call to #play.
=end

class GuessingGame
	attr_reader :guess, :hidden_num, :low_band, :high_band
	attr_accessor :guesses_remaining

	def initialize(low_band, high_band)
		@low_band = low_band
		@high_band = high_band
		@hidden_num = Random.new.rand(@low_band..@high_band)
		@guesses_remaining = Math.log2(high_band - low_band).to_i + 1
	end

	def play
		loop do
			display_guesses
			return winning_message if evaluateguess(player_guesses)
			return losing_message if guesses_remaining == 0
		end
	end

	private

	def display_guesses
		puts "You have #{guesses_remaining} guesses remaining."
	end

	def player_guesses
		loop do
			puts "Enter a number between #{low_band} and #{high_band}:"
			answer = gets.to_i
			self.guesses_remaining -= 1
			return answer if (low_band..high_band).include?(answer)
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
			return true
		end
	end
end

game = GuessingGame.new(500,1000)
game.play