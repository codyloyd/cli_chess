require "./game/pieces/Pawn"
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
					expect(pawn.get_moves).to eql([])
				end
			end

			context "starting position" do
				it "returns both 1 and 2 space moves" do
					pawn = game_board.game_array[6][4]
					expect(pawn.get_moves).to eql([[5,4],[4,4]])
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
					game_board.game_array[5][3] = Pawn.new("white",[5,3],game_board)
					expect(pawn.get_moves).to include([5,3])
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
end