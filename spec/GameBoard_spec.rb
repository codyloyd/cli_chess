require './GameBoard'

describe "GameBoard" do 
	subject(:game) {GameBoard.new}
	describe "create_game_array" do
		it "creates the correct array" do
			expect(game.game_array).to eql([[" "," "," "," "," "," "," "," "],
											[" "," "," "," "," "," "," "," "],
											[" "," "," "," "," "," "," "," "],
											[" "," "," "," "," "," "," "," "],
											[" "," "," "," "," "," "," "," "],
											[" "," "," "," "," "," "," "," "],
											[" "," "," "," "," "," "," "," "],
											[" "," "," "," "," "," "," "," "]])
		end
	end

	describe "place_game_pieces" do 
		subject(:game) { GameBoard.new() }
		it "places the pieces in the correct place" do
			game.place_game_pieces
			expect(game.game_array[0][0]).to eql("?")
		end
	end
end