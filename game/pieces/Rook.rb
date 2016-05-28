module GamePiece
	class Rook
		attr_accessor :color, :pos
		def initialize(color,pos,board)
			@color = color
			@pos = pos
			@board = board
		end

		def get_moves
			moves = []
			if @pos[0]< 7
				(@pos[0]+1).upto(7) do |x|
					if @board.game_array[x][pos[1]] == nil
						moves << [x,pos[1]]
					else
						if @board.game_array[x][pos[1]].color != @color
							moves << [x,pos[1]] 
						end
						break
					end
				end
			end
			if @pos[0] > 0
				(@pos[0]-1).downto(0) do |x|
					if @board.game_array[x][pos[1]] == nil
						moves << [x,pos[1]]
					else
						if @board.game_array[x][pos[1]].color != @color
							moves << [x,pos[1]] 
						end
						break
					end
				end
			end
			if @pos[1]< 7
				(@pos[1]+1).upto(7) do |x|
					if @board.game_array[pos[0]][x] == nil
						moves << [pos[0],x]
					else
						if @board.game_array[pos[0]][x].color != @color
							moves << [pos[0],x]
						end
						break
					end
				end
			end
			if @pos[1] > 0
				(@pos[1]-1).downto(0) do |x|
					if @board.game_array[pos[0]][x] == nil
						moves << [pos[0],x]
					else
						if @board.game_array[pos[0]][x].color != @color
							moves << [pos[0],x] 
						end
						break
					end
				end
			end
			moves
		end
		def to_s
			#this determines how the piece will be printed
			if @color == "white"
				return Rainbow("♜").blue
			else
				return Rainbow("♜").red
			end
		end
	end
end