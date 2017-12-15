require "connect_four.rb"


describe "ConnectFour" do

	subject(:game) {ConnectFour.new()}

	let(:empty_board) {Hash[(0..5).map { |row| [row, [".",".",".",".",".",".","."]]}]}
	let(:full_board) {Hash[(0..5).map { |row| [row, ["O","O","O","O","O","O","O"]]}]}
	let(:empty_board_string) {". . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n"}

	describe ".initialize" do
		it "it sets up an empty board" do
			expect(game.board).to eql(empty_board)
		end
	end

	describe ".write_instructions" do
		it "writes instructions for the game" do
			expect(game.write_instructions).to be_is_a(String)
		end
	end

	describe ".check_coord" do
		context "given a valid coordinate" do
			it "returns true" do
				expect(game.check_coord(3)).to eql(true)
			end
		end
		context "given an invalid, positive coordinate" do
			it "returns false" do
				expect(game.check_coord(10)).to eql(false)
			end
		end
		context "given an invalid, negative coordinate" do
			it "returns false" do
				expect(game.check_coord(-5)).to eql(false)
			end
		end
	end

	describe ".check_if_free" do
		context "with an empty board" do
			it "returns true" do
				game.board = empty_board
				expect(game.check_if_free(3)).to eql(true)
			end
		end
		context "with a full column" do
			it "returns false" do
				game.board = Hash[(0..5).map { |row| [row, ["O","","","","",""]]}]
				expect(game.check_if_free(0)).to eql(false)
			end
		end
	end

	describe ".make_move" do
		context "add piece to empty board" do
			it "returns the position of the piece" do
				game.board = empty_board
				expect(game.make_move(4)).to eql([0,4])
			end
		end
		context "add piece to non-empty board with empty space" do
			it "returns the position of the piece" do
				game.board[0] = ["O", "O", ".", ".", "O", ".", "."]
				game.board[1] = ["O", "O", ".", ".", "O", ".", "."]
				game.board[2] = ["O", "O", ".", ".", "O", ".", "."]
				game.board[3] = [".", "O", ".", ".", ".", ".", "."]
				expect(game.make_move(3)).to eql([0,3])
			end
		end
		context "add piece to full board" do
			it "returns false" do
				game.board = full_board
				expect(game.make_move(4)).to eql(false)
			end
		end

		describe ".draw_board" do
			context "given an empty board" do
				it "returns a string of a empty board" do
					game.board = empty_board
					expect(game.draw_board).to eql(empty_board_string)
				end
			end

		end

	end
		
end