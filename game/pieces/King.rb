module GamePiece
	class King < GamePiece
		def initialize(color,pos,board)
			super(color, pos, board)
			@char = "♚"
		end

		def get_moves
			# return all available moves in 2d array 
			# king can move one space in any direction, 
			moves = []
			legal_moves = [[1,0],[0,1],[-1,0],[0,-1],[1,1],[1,-1],[-1,-1],[-1,1]]
			legal_moves.each do |x|
				move = [pos[0]+x[0],pos[1]+x[1]]
				if move[0].between?(0,7) && move[1].between?(0,7)
					space = @board.game_array[pos[0]+x[0]][pos[1]+x[1]]
					if space == nil
						moves << move
					else
						if space.color != @color
							moves << move
						end
					end
				end
			end
			moves
		end
	end
end