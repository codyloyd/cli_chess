require "./game/pieces/game_piece_helper"
require "rainbow"
require "./game/GameBoard"
include GamePiece

describe "Pawn" do
	describe "to_s" do 
		subject(:pawn) {Pawn.new("white",[0,0],GameBoard.new)}
		it "prints '♟' " do 
			expect(pawn.to_s).to eq(Rainbow("♟").blue)
		end
	end
	
	describe "get_moves" do
		subject(:game_board) {GameBoard.new}
		context "white" do
			context "not starting position" do
				subject(:pawn) {Pawn.new("white",[4,4],game_board)}
				it "returns correct space" do 
					expect(pawn.get_moves).to eql([[3,4]])
				end
				it "returns empty array if space is blocked" do
					game_board.game_array[3][4] = Pawn.new("black",[3,4],game_board)
					expect(pawn.get_and_validate_moves).to eql([])
				end
			end

			context "starting position" do
				it "returns both 1 and 2 space moves" do
					pawn = game_board.game_array[6][4]
					expect(pawn.get_and_validate_moves).to eql([[5,4],[4,4]])
				end
				it "returns correctly if the 2nd space is blocked" do 
					pawn = game_board.game_array[6][4]
					game_board.game_array[4][4] = Pawn.new("white",[4,4],game_board)
					expect(pawn.get_moves).to eql([[5,4]])
				end
			end
			context "capturing" do 
				it "returns the move if there is a piece to capture" do 
					pawn = game_board.game_array[6][4]
					game_board.game_array[5][3] = Pawn.new("black",[5,3],game_board)
					expect(pawn.get_moves).to include([5,3])
				end
			end
			context "own king in check" do 
				before do 
					#blank game board
					@game_board = GameBoard.new
					@game_board.game_array = Array.new(8) {Array.new(8) {nil}}
					#add pieces: King in check (attacked by rook) and a pawn
					@game_board.game_array[5][5] = King.new("white",[5,5],@game_board)
				    @game_board.game_array[3][5] = Rook.new("black",[3,5],@game_board)
					@game_board.game_array[6][0] = Pawn.new("white",[6,0],@game_board)
				end
				it "returns no moves if king is in check" do
					expect(@game_board.game_array[6][0].get_and_validate_moves).to eql([]) 
				end
			end
		end 
		context "black" do
			context "not starting position" do
				subject(:pawn) {Pawn.new("black",[4,4],game_board)}
				it "returns correct space" do 
					expect(pawn.get_moves).to eql([[5,4]])
				end
				it "returns empty array if space is blocked" do
					game_board.game_array[5][4] = Pawn.new("black",[5,4],game_board)
					expect(pawn.get_moves).to eql([])
				end
			end

			context "starting position" do
				it "returns both 1 and 2 space moves" do
					pawn = game_board.game_array[1][4]
					expect(pawn.get_moves).to eql([[2,4],[3,4]])
				end
				it "returns correctly if the 2nd space is blocked" do 
					pawn = game_board.game_array[1][4]
					game_board.game_array[3][4] = Pawn.new("white",[3,4],game_board)
					expect(pawn.get_moves).to eql([[2,4]])
				end
			end
			context "capturing" do 
				it "returns the move if there is a piece to capture" do 
					pawn = game_board.game_array[1][4]
					game_board.game_array[2][3] = Pawn.new("white",[2,3],game_board)
					expect(pawn.get_moves).to include([2,3])
				end
			end
		end
	end

	describe "check?" do
		subject(:game_board) {GameBoard.new}
		before do 
			game_board.game_array[5][4] = King.new("black",[5,4],game_board)
		end 
		it "returns true if check" do
			expect(game_board.game_array[6][5].check?).to eql([true,"black"])
		end	
		it "returns false if not check" do 
			expect(game_board.game_array[6][7].check?).to eql([false,nil])
		end

	end
end

describe "King" do
	describe "get_moves" do
		subject(:king) {King.new("black",[4,4],GameBoard.new)}
		it "returns the correct array" do
			expect(king.get_moves).to eql([[5, 4], [4, 5], [3, 4], [4, 3], [5, 5], [5, 3], [3, 3], [3, 5]]) 
		end
	end
end