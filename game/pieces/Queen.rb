module GamePiece
	class Queen < GamePiece
		def initialize(color,pos,board)
			super(color, pos, board)
			@char = "♛"
		end

		def get_moves
			# return all available moves in 2d array
			# queen can move in any direction.. like the rook + the bishop
			moves = []
			moves
		end

	end
end