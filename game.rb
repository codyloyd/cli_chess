class GameBoard
	attr_accessor :game_array
	def initialize
	end

	def create_game_array
		#chess board is a 8x8 2d array
		@game_array = Array.new(8) {Array.new(8) {" "}}
	end
end