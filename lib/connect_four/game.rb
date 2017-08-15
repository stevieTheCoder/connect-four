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

    private

    def human_move_to_coordinate(human_move)
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
