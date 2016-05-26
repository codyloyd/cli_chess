require "./game/Player"

describe "Player" do
	subject(:player_1) { Player.new("cody","white") } 
	it "initializes correctly" do  
		expect(player_1.name).to eql("cody")
	end

end