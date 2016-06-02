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
		#returns true/false and the color that is in check
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

	def validate_moves(moves)
		validated_moves = []
		moves.each do |move| 
			local_game_array = @board.game_array.dup
			@board.move_piece([@pos,move],local_game_array)
			check = @board.is_check?(local_game_array)
			unless check[1] == @color 
				validated_moves << move
			end
		end
		validated_moves
	end

	def get_and_validate_moves
		moves = validate_moves(get_moves)
	end
end