class ConnectFour
	attr_accessor :board


	def initialize
		puts self.write_instructions
		@board = self.make_board

	end

	def write_instructions
		instructions = ""

		instructions = "Hello, and welcome to ConnectFour!\n"
		instructions += "The rules are simple:\n"
		instructions += "Choose a column to drop your piece down\n"
		instructions += "The piece will go down as far as it can\n"
		instructions += "Do your best to make it connect 4 pieces in:\n"
		instructions += "  A row\n"
		instructions += "  A column\n"
		instructions += "  Or diagonally\n"
		instructions += "And you win!\n"
		instructions += "Goodluck =)\n"
		return instructions
	end

	def check_coord(coord)
		if coord >= 0 && coord < 6
			return true
		else
			return false
		end
	end

	def check_if_free(coord)
		return @board[5][coord] == "."
	end

	def make_board
		board = Hash[(0..5).map { |row| [row, [".",".",".",".",".",".","."]]}]
		return board
	end


	def make_move(coord)
		i = 0
		while i < 6
			if @board[i][coord] == "."
				@board[i][coord] == "X"
				return [i, coord]
			end
			i += 1
		end
		return false

	end

	def draw_board
		board = ""
		i = 5
		while i >= 0
			board += @board[i].join(" ") + "\n"
			i -= 1
		end
		return board
	end


	def check_for_win



	end


end

game = ConnectFour.new

puts game.draw_board