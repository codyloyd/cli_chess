require './game/pieces/game_piece_helper'
require 'rainbow'
include GamePiece

class GameBoard
	
	attr_accessor :game_array

	def initialize
		@game_array = create_game_array
		place_game_pieces
	end

	def create_game_array
		#chess board is a 8x8 2d array initially filled with nils
		Array.new(8) {Array.new(8) {nil}}
	end

	def place_game_pieces
		# white pieces first
		@game_array[1].fill { |x| Pawn.new("black",[1,x],self) }
		@game_array[0][0] = Rook.new("black",[0,0],self)
		@game_array[0][7] = Rook.new("black",[0,7],self)
		@game_array[0][1] = Knight.new("black",[0,1],self)
		@game_array[0][6] = Knight.new("black",[0,6],self)
		@game_array[0][2] = Bishop.new("black",[0,2],self)
		@game_array[0][5] = Bishop.new("black",[0,5],self)
		@game_array[0][3] = Queen.new("black",[0,3],self)
		@game_array[0][4] = King.new("black",[0,4],self)
		#then the black....
		@game_array[6].fill { |x| Pawn.new("white",[6,x],self) }
		@game_array[7][0] = Rook.new("white",[7,0],self)
		@game_array[7][7] = Rook.new("white",[7,7],self)
		@game_array[7][1] = Knight.new("white",[7,1],self)
		@game_array[7][6] = Knight.new("white",[7,6],self)
		@game_array[7][2] = Bishop.new("white",[7,2],self)
		@game_array[7][5] = Bishop.new("white",[7,5],self)
		@game_array[7][4] = Queen.new("white",[7,3],self)
		@game_array[7][3] = King.new("white",[7,4],self)
	end

	def draw_gameboard
		system "clear"
		@game_array.each_with_index do |ary,i|
			nils_removed = ary.map { |x| x == nil ? x = Rainbow("☐").silver : x.to_s }
			puts Rainbow("#{8-i} ").yellow + nils_removed.join(" ")
		end
		puts Rainbow("  a b c d e f g h").yellow
		if is_check?[0] 
			puts "#{is_check?[1].upcase} is in CHECK!"
		end
	end

	def move_piece(array)
		from = array[0]
		to = array[1]
		if @game_array[from[0]][from[1]].get_moves.include?(to)
			@game_array[to[0]][to[1]] = @game_array[from[0]][from[1]]
			@game_array[from[0]][from[1]] = nil
			@game_array[to[0]][to[1]].pos = to
		end
	end

	def is_check?
		@game_array.each do |row|
			row.each do |space|
				if space != nil
					if space.check?[0] == true
						return space.check?
					end
				end
			end
		end
		return [false,nil]
	end
end

