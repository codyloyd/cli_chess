require "./game/pieces/game_piece_helper"
module GamePiece
	class GamePiece
		attr_accessor :color, :pos
		def initialize(color,pos,board)
			@color = color
			@pos = pos
			@board = board
		end
	end

	def check?
		moves = get_moves
		moves.each do |x|
			if @board.game_array[x[0]][x[1]].class == King
				return [true,@board.game_array[x[0]][x[1]].color]

			end
		end
		return [false,nil]
	end

	def to_s
		if @color == "white"
			return Rainbow(@char).blue  
		else
			return Rainbow(@char).red
		end
	end
end