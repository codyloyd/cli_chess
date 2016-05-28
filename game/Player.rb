require "./game/GameBoard"

class Player
	attr_accessor :name, :color
	def initialize(name, color)
		@name = name
		@color = color
	end

	def input_to_array(input_string)
		#this method will convert the user's string (example a1,b3)
		#into an appropriate input for GameBoard.move_piece ([0,1],[1,3])
		array = input_string.split(",").map{ |x| x.scan(/./)}
		array.map{ |x,y| [8 - y.to_i, x.ord - 97] }
	end

	def check_if_own_piece
		#this method should check if the Player has selected one of their own pieces to move
	end	

	def user_input

	end
end