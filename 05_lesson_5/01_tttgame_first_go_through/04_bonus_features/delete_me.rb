class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals


	def detect_threat(vulnerable_square)
		WINNING_LINES.each do |line|
			line_match = []
			index_counter = 1
			@squares.each do |square|
				if square[index_counter] == nil
					next
				elsif square[index_counter].marker == 'X'
					line_match << index_counter
				end
				index_counter += 1
			end
			if line_match.size < 1
				binding.pry
				return (line - line_match)[0]
			end
		end
		nil
	end

	detect_threat(nil)