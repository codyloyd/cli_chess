require "./game/GameBoard"
require "./game/Player"

class Game
	attr_accessor :game_board, :player_1, :player_2
	def initialize
		@game_board = GameBoard.new
		@player_1 = Player.new("player 1","white")
		@player_2 = Player.new("player 2", "black")
	end

	def get_input(player)
		puts "#{player.name}, please enter your move"
		puts "format: a2,a3 (from,to)"
		input = gets.chomp
	end

	def player_turn(player)
		input = get_input(player)
		move_array = player.input_to_array(input)
		moves = @game_board.game_array[move_array[0][0]][move_array[0][1]].get_moves
		if moves.include?(move_array[1])
			@game_board.move_piece(move_array)
		else
			puts "invalid move"
			player_turn(player)
		end
	end

	def game_loop
		loop do
			@game_board.draw_gameboard 
			player_turn(player_1)
			@game_board.draw_gameboard
			player_turn(player_2)
		end
	end

end

game = Game.new
game.game_loop