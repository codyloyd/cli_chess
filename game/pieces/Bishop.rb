module GamePiece
	class Bishop < GamePiece
		def initialize(color,pos,board)
			super(color, pos, board)
			@char = "♝"
		end

		def get_moves
			# return all available moves in 2d array
			# bishops can move diagonally until they run into another piece
			#down to the right:
			moves = []
			if @pos[0] < 7 && @pos[1] < 7
				1.upto(7) do |x|
					if pos[0]+x <= 7 && pos[1]+x <= 7
						if @board.game_array[pos[0]+ x][pos[1]+x] == nil
							moves << [pos[0]+x,pos[1]+x]
						else
							if @board.game_array[pos[0]+ x][pos[1]+x].color != @color
								moves << [pos[0]+x,pos[1]+x] 
							end
							break
						end
					else
						break
					end
				end
			end
			#up to the left
			if @pos[0] > 0 && @pos[1] > 0
				1.upto(7) do |x|
					if pos[0]-x >= 0 && pos[1]-x >= 0
						if @board.game_array[pos[0]- x][pos[1]-x] == nil
							moves << [pos[0]-x,pos[1]-x]
						else
							if @board.game_array[pos[0]- x][pos[1]-x].color != @color
								moves << [pos[0]-x,pos[1]-x] 
							end
							break
						end
					else
						break
					end
				end
			end
			#down to the left
			if @pos[0] > 0 && @pos[1] < 7
				1.upto(7) do |x|
					if pos[0]+ x <= 7 && pos[1]-x >= 0
						if @board.game_array[pos[0]+ x][pos[1]-x] == nil
							moves << [pos[0]+x,pos[1]-x]
						else
							if @board.game_array[pos[0] +x][pos[1]-x].color != @color
								moves << [pos[0]+x,pos[1]-x] 
							end
							break
						end
					else
						break
					end
				end
			end
			# up to the right
			if @pos[0] > 0 && @pos[1] < 7
				1.upto(7) do |x|
					if pos[0] - x >= 0 && pos[1] + x <= 7
						if @board.game_array[pos[0] - x][pos[1] + x ] == nil
							moves << [pos[0]-x, pos[1]+x]
						else
							if @board.game_array[pos[0]- x][pos[1]+x].color != @color
								moves << [pos[0]-x,pos[1]+x] 
							end
							break
						end
					else
						break
					end
				end
			end
			moves
		end
	end
end