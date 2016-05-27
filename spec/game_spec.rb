require "./game/Game"

describe "Game" do 
	let(:game) {Game.new}
	it "player can move pieces" do 
		game.game_board.move_piece(game.player_1.input_to_array("a2,a3"))
		expect(game.game_board.game_array[2][0]).to be_a GamePiece::Pawn
	end
end