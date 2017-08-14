module ConnectFour
	class Board

		attr_reader :grid

		def initialize(input = {})
			@grid = input.fetch(:grid, default_grid)
		end

		def get_cell(x ,y)
			grid[y][x]
		end

		def set_cell(x, y, value)
			get_cell(x, y).value = value
		end

		def game_over
			return :winner if winner?
			return :draw if draw?
			false
		end

		private

		def draw?
			grid.flatten.map { |cell| cell.value }.none_empty?
		end

		def winner?
      		winning_positions.each do |winning_position|
        		next if winning_position_values(winning_position).all_empty?
        		return true if winning_position_values(winning_position).four_connected?
      		end
        	false
    	end

	    def winning_position_values(winning_position)
	    	winning_position.map { |cell| cell.value }
	    end
 
	    def winning_positions
	    	grid + # rows
	    	grid.transpose + #columns
	    	grid.diagonals
	    end

		def default_grid
			Array.new(6) { Array.new(7) {Cell.new} }
		end
	end
end
