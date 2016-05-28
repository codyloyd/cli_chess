require "./game/GameBoard"
require "./game/Player"

class Game
	attr_accessor :game_board, :player_1, :player_2
	def initialize
		@game_board = GameBoard.new
		@player_1 = Player.new("player 1","white")
		@player_2 = Player.new("player 2", "black")
		@game_over = false
	end

	def get_input(player)
		puts "#{player.name}, please enter your move"
		puts "format: a2,a3 (from,to)"
		input = gets.chomp
		if input == "resign"
			@game_over = true
			input
		else
			input
		end
	end

	def player_turn(player)
		input = get_input(player)
		return if input == "resign"
		move_array = player.input_to_array(input)
		moves = @game_board.game_array[move_array[0][0]][move_array[0][1]].get_moves
		if moves.include?(move_array[1])
			@game_board.move_piece(move_array)
		else
			puts "invalid move"
			player_turn(player)
		end
		if @game_board.is_check?[0] == true && @game_board.is_check?[1] == player.color
			puts "invalid move"
			@game_board.move_piece([move_array[1],move_array[0]])
			player_turn(player)
		end
	end

	def game_loop
		loop do
			@game_board.draw_gameboard 
			player_turn(player_1)
			break if @game_over == true
			@game_board.draw_gameboard
			player_turn(player_2)
			break if @game_over == true
		end
		puts "Game Over!"
	end
end

game = Game.new
game.game_loop