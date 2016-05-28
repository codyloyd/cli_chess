module GamePiece
	class Knight
		attr_accessor :color, :pos
		def initialize(color,pos,board)
			@color = color
			@board = board
			@pos = pos
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
		def to_s
			#this determines how the piece will be printed
			if @color == "white"
				return Rainbow("♞").blue
			else
				return Rainbow("♞").red
			end
		end
	end
end