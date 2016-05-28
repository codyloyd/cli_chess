module GamePiece
	class Rook < GamePiece
		def initialize(color,pos,board)
			super(color, pos, board)
			@char = "♜"
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

	end
end