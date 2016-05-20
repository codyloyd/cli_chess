require './GameBoard'
require './game/pieces/game_piece_helper'

describe "GameBoard" do 
	subject(:game) {GameBoard.new}
	describe "create_game_array" do
		it "creates the correct array" do
			expect(game.game_array).to eql([[nil,nil,nil,nil,nil,nil,nil,nil],
											[nil,nil,nil,nil,nil,nil,nil,nil],
											[nil,nil,nil,nil,nil,nil,nil,nil],
											[nil,nil,nil,nil,nil,nil,nil,nil],
											[nil,nil,nil,nil,nil,nil,nil,nil],
											[nil,nil,nil,nil,nil,nil,nil,nil],
											[nil,nil,nil,nil,nil,nil,nil,nil],
											[nil,nil,nil,nil,nil,nil,nil,nil]])
		end
	end

	describe "place_game_pieces" do 
		subject(:game) { GameBoard.new() }
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
end