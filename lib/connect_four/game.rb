module ConnectFour
  class Game
    attr_accessor :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "#{current_player.name} please make your move by entering a number between 1 and 7."
    end

    def get_move(human_move = gets.chomp)
      human_move_to_coordinate(human_move)
    end

    def game_over_message
			return "#{current_player.name} won!" if board.game_over == :winner
			return "The game ended in a draw" if board.game_over == :draw
		end

    def play
			puts "#{current_player.name} has randomly been selected as the first player"
			while true
				board.formatted_grid
				puts ""
				puts solicit_move
				x, y = get_move
				board.set_cell(x, y, current_player.colour)
				if board.game_over
					puts game_over_message
					board.formatted_grid
					return
				else
					switch_players
				end
			end
		end

    private

    def human_move_to_coordinate(input)
      human_move = input.to_i
      coordinate = [human_move - 1, 0]
      columns_array = board.grid.transpose[human_move - 1]
      columns_array.each_with_index do |cell, index|
        if cell.value == ''
          coordinate.pop
          coordinate << index
        end
      end
      coordinate
    end

  end
end
