require "./game/Player"
require "./game/GameBoard"

describe "Player" do
	subject(:player_1) { Player.new("cody","white") } 
	describe "initialize" do 
		it "initializes name" do 
			expect(player_1.name).to eql("cody") 
		end
		it "intitializes color" do 
			expect(player_1.color).to eql ("white") 
		end
	end
	describe "input_to_array" do
		it "returns correct arrays" do 
			expect(player_1.input_to_array("a2,a3")).to eql([[1,0],[2,0]]) 
		end
	end
end