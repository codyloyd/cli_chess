require "./game/pieces/Pawn"

describe "Pawn" do
	subject(:pawn) { Pawn.new("white",[0,0]) } 
	describe "to_s" do 
		it "prints 'p' " do 
			expect(pawn.to_s).to eq("p")
		end
	end
end