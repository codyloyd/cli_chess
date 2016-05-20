module GamePiece
	class King
		def initialize(color,position)
			@color = color
			@position = position
			@moves = get_moves
		end

		def get_moves
			# return all available moves in graph
			# should make graph accessible so that it can be 
			# called by the user when they are trying to make a move
		end
	end
end