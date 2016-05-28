module GamePiece
	class Knight
		attr_accessor :color, :position, :moves
		def initialize(color,position,board)
			@color = color
			@position = position
			@moves = get_moves
			@board = board
		end

		def get_moves
			# return all available moves in 2d array
			# legal moves = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[-2,1],[2,-1],[-2,-1]] 
			# knights can move in any direction so long as their move is on the 
			# board and it's not landing on one of their own pieces
			# moves should equal @position manipulated by the above array...
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