module GamePiece
	class Pawn 
		attr_accessor :color, :pos, :moves
		def initialize(color,pos,board)
			@color = color
			@pos = pos
			@board = board
			@moves = get_moves
		end

		def get_moves
			moves = []
			if @color == "white"
				if @pos[0] == 6 
					moves << [@pos[0]-1,@pos[1]] if @board.game_array[@pos[0]-1][@pos[1]] == nil
					moves << [@pos[0]-2,@pos[1]] if @board.game_array[@pos[0]-2][@pos[1]] == nil
				else
					moves << [@pos[0]-1,@pos[1]] if @board.game_array[@pos[0]-1][@pos[1]] == nil
				end
				moves << [@pos[0]-1,@pos[1]- 1] if @board.game_array[@pos[0]-1][@pos[1]-1] != nil && @board.game_array[@pos[0]-1][@pos[1]-1].color != @color
				moves << [@pos[0]-1,@pos[1]+ 1] if @board.game_array[@pos[0]-1][@pos[1]+1] != nil && @board.game_array[@pos[0]-1][@pos[1]+1].color != @color
			else
				if @pos[0] == 1 
					moves << [@pos[0]+1,@pos[1]] if @board.game_array[@pos[0]+1][@pos[1]] == nil
					moves << [@pos[0]+2,@pos[1]] if @board.game_array[@pos[0]+2][@pos[1]] == nil
				else
					moves << [@pos[0]+1,@pos[1]] if @board.game_array[@pos[0]+1][@pos[1]] == nil
				end
				moves << [@pos[0]+1,@pos[1]-1] if @board.game_array[@pos[0]+1][@pos[1]-1] != nil && @board.game_array[@pos[0]+1][@pos[1]-1].color != @color
				moves << [@pos[0]+1,@pos[1]+1] if @board.game_array[@pos[0]+1][@pos[1]+1] != nil && @board.game_array[@pos[0]+1][@pos[1]+1].color != @color
			end
			moves
		end

		def to_s
			if @color == "white"
				return Rainbow("♟").blue
			else
				return Rainbow("♟").red
			end
		end
	end
end
