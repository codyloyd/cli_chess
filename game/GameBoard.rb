require './game/pieces/game_piece_helper'
require 'rainbow'

class GameBoard
	include GamePiece
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
		@game_array[1].fill { |x| Pawn.new("white",[1,x]) }
		@game_array[0][0] = Rook.new("white",[0,0])
		@game_array[0][7] = Rook.new("white",[0,7])
		@game_array[0][1] = Knight.new("white",[0,1])
		@game_array[0][6] = Knight.new("white",[0,6])
		@game_array[0][2] = Bishop.new("white",[0,2])
		@game_array[0][5] = Bishop.new("white",[0,5])
		@game_array[0][3] = Queen.new("white",[0,3])
		@game_array[0][4] = King.new("white",[0,4])
		#then the black....
		@game_array[6].fill { |x| Pawn.new("black",[1,x]) }
		@game_array[7][0] = Rook.new("black",[0,0])
		@game_array[7][7] = Rook.new("black",[0,7])
		@game_array[7][1] = Knight.new("black",[0,1])
		@game_array[7][6] = Knight.new("black",[0,6])
		@game_array[7][2] = Bishop.new("black",[0,2])
		@game_array[7][5] = Bishop.new("black",[0,5])
		@game_array[7][4] = Queen.new("black",[0,3])
		@game_array[7][3] = King.new("black",[0,4])
	end

	def draw_gameboard
		#this method draws the CLI gameboard.  
		#should iterate through the game_array and draw the correct
		#piece on the board depending on the type and color of the piece
		@game_array.each.with_index(1) do |ary,i|
			nils_removed = ary.map { |x| x == nil ? x = "x" : x.to_s }
			puts Rainbow("#{i} ").yellow + nils_removed.join(" ")
		end
		puts Rainbow("  a b c d e f g h").yellow
	end

	def move_piece(array)
		from = array[0]
		to = array[1]
		@game_array[to[0]][to[1]] = @game_array[from[0]][from[1]]
		@game_array[from[0]][from[1]] = nil
	end
end

