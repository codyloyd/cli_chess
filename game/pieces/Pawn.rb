require "./game/pieces/gamepiece"
module GamePiece
	class Pawn < GamePiece
		attr_accessor :char
		def initialize(color,pos,board)
			super(color, pos, board)
			@char = "♟"
		end

		def get_moves
			moves = []
			if @color == "white"
				# if it's s on the home row
				if @pos[0] == 6 
					moves << [@pos[0]-1,@pos[1]] if @board.game_array[@pos[0]-1][@pos[1]] == nil
					moves << [@pos[0]-2,@pos[1]] if @board.game_array[@pos[0]-2][@pos[1]] == nil
				else
					moves << [@pos[0]-1,@pos[1]] if @board.game_array[@pos[0]-1][@pos[1]] == nil
				end
				#it can attack diagonally
				moves << [@pos[0]-1,@pos[1]- 1] if @board.game_array[@pos[0]-1][@pos[1]-1] != nil && @board.game_array[@pos[0]-1][@pos[1]-1].color != @color
				moves << [@pos[0]-1,@pos[1]+ 1] if @board.game_array[@pos[0]-1][@pos[1]+1] != nil && @board.game_array[@pos[0]-1][@pos[1]+1].color != @color
			else
				#if it's on the home row
				if @pos[0] == 1 
					moves << [@pos[0]+1,@pos[1]] if @board.game_array[@pos[0]+1][@pos[1]] == nil
					moves << [@pos[0]+2,@pos[1]] if @board.game_array[@pos[0]+2][@pos[1]] == nil
				else
					moves << [@pos[0]+1,@pos[1]] if @board.game_array[@pos[0]+1][@pos[1]] == nil
				end
				#it can attack diagonally
				moves << [@pos[0]+1,@pos[1]-1] if @board.game_array[@pos[0]+1][@pos[1]-1] != nil && @board.game_array[@pos[0]+1][@pos[1]-1].color != @color
				moves << [@pos[0]+1,@pos[1]+1] if @board.game_array[@pos[0]+1][@pos[1]+1] != nil && @board.game_array[@pos[0]+1][@pos[1]+1].color != @color
			end
			# make sure none of the moves end with own king in checkmate:
			moves
		end

		# def get_and_validate_moves
		# 	moves = validate_moves(get_moves)
		# end

	end
end
