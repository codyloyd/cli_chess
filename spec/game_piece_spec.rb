require "./game/pieces/Pawn"
require "rainbow"
include GamePiece

describe "Pawn" do
	describe "to_s" do 
		subject(:pawn) {Pawn.new("white",[0,0])}
		it "prints '♟' " do 
			expect(pawn.to_s).to eq(Rainbow("♟").blue)
		end
	end
end