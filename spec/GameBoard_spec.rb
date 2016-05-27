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
	end
end