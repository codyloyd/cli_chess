module GamePiece
	class Knight < GamePiece
		def initialize(color,pos,board)
			super(color, pos, board)
			@char = "♞"
		end

		def get_moves
			legal_moves = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[-2,1],[2,-1],[-2,-1]] 
			moves = []
			legal_moves.each do |x,y|
				move = [@pos[0]+ x, @pos[1]+y]
				if move[0].between?(0,7) && move[1].between?(0,7)
					if @board.game_array[move[0]][move[1]] != nil
						moves << move if @board.game_array[move[0]][move[1]].color !=  @color
					else
						moves << move
					end
				end
			end
			moves
		end
	end
end