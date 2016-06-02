require './game/GameBoard'
require './game/pieces/game_piece_helper'

describe "GameBoard" do 
	let(:game) {GameBoard.new}

	describe "place_game_pieces" do 
		it "places the pawns in the correct place" do
			game.place_game_pieces
			game.game_array[1].each do |x|
				expect(x).to be_a GamePiece::Pawn
			end
		end
		it "fills the bottom row with pieces" do
			game.place_game_pieces
			expect(game.game_array[0].none? {|x| x == nil}).to eq(true)
		end
	end

	describe "move_piece" do
		before do 
			game.place_game_pieces
			game.move_piece([[1,0],[3,0]])
		end
		it "moves piece" do
			#expect an input of 2 array positions to move a peice from the first to the second
			expect(game.game_array[3][0]).to be_a GamePiece::Pawn
		end
		it "clears the -from- space" do 
			expect(game.game_array[1][0]).to eql(nil)
		end 
		it "updates the piece's position" do
			expect(game.game_array[3][0].pos).to eql([3,0])
		end
	end

	describe "checkmate?" do 
		it "returns false if no checkmate" do 
			expect(game.checkmate? "white").to eql(false)
		end

		it "returns true if checkmate" do
			#empty game_array
			game.game_array = Array.new(8) {Array.new(8) {nil}}

			#add pieces: King in checkmate (attacked by rook and bishop)
			game.game_array[0][0] = King.new("white",[0,0],game)
			game.game_array[0][2] = Rook.new("black",[0,2],game)
			game.game_array[2][0] = Rook.new("black",[2,0],game)
			game.game_array[2][2] = Bishop.new("black",[2,2],game)
			
			expect(game.checkmate? "white").to eql(true)
		end
	end
end