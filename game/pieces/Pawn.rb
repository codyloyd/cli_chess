module GamePiece
	class Pawn 
		attr_accessor :color, :position, :moves
		def initialize(color,position,game_board)
			@color = color
			@position = position
			@game_board = game_board
			@moves = get_moves
		end

		def get_moves
			# return all available moves in an array of possible positions
			# format[[2,3],[4,3]] etc.
			# pawns can move forward one.  If it's the first move they can move two.  they can only capture at an angle
			# move forward one: if white: starting position [6,x] finishing position [5,x]
			# if black :  starting position [1,x] finishing position [2,x]
			# need to check if it's position is on it's starting row in order to see if it can move two.  
			# white start on row 6 and black start on row 1
			moves = []
			if @color == "white"
				if @position[0] == 6 
					moves << [@position[0]-1,@position[1]] if @game_board.game_array[@position[0]-1][@position[1]] == nil
					moves << [@position[0]-2,@position[1]] if @game_board.game_array[@position[0]-2][@position[1]] == nil
				else
					moves << [@position[0]-1,@position[1]] if @game_board.game_array[@position[0]-1][@position[1]] == nil
				end
			else
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
