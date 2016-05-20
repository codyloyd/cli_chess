require './game'

describe "GameBoard" do 
	subject(:game) {GameBoard.new}
	describe "create_game_array" do
		it "creates the correct array" do
			game.create_game_array
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
end