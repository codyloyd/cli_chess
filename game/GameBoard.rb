class GameBoard
	attr_accessor :game_array
	def initialize
		@game_array = create_game_array
	end

	def create_game_array
		#chess board is a 8x8 2d array
		Array.new(8) {Array.new(8) {" "}}
	end

	def place_game_pieces
		#this method will create and place
		#the game pieces in the game array
	end
end