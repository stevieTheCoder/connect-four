require "spec_helper"

module ConnectFour
	RSpec.describe Board do

		let(:board) {Board.new}
		let(:boardGridTest) {Board.new(grid: "test")}
		let(:exampleGrid) {Board.new(grid: [["","",""], ["","test",""]])}

		describe "#initialize" do
			context "creating a grid of blank cells" do
				it "creates a board with 6 rows" do
					expect(board.grid.size).to eq 6
				end

				it "creates a board of 7 columns" do
					board.grid.each do |row|
						expect(row.length).to eq 7
					end
				end
			end
		end

		describe "#grid" do
			context "attr_reader is working" do
				it "returns the value of the grid" do
					expect(boardGridTest.grid).to eq "test"
				end

			end
		end

		describe "#get_cell" do
			context "nested array y,x to x,y standard" do
				it "returns the cell based on the x, y coordinate" do
					expect(exampleGrid.get_cell(1,1)).to eq "test"
				end
			end
		end

		describe "#set_cell" do
			context "setter for grid cells" do
				it "changes the value of a cell" do
					test = board
					test.set_cell(1, 1, "RED")
					expect(test.get_cell(1, 1).value).to eq "RED"
				end
			end
		end

		describe "#game_over" do
			context "when there is a winner" do
				it "returns :winner if winner? is true" do
					allow(board).to receive(:winner?) { true }
					expect(board.game_over).to eq :winner
				end
			end

			context "where there is no winner" do
				it "returns :draw if draw? is true" do
					allow(board).to receive(:winner?) { false }
					allow(board).to receive(:draw?) { true }
					expect(board.game_over).to eq :draw
				end
			end

			context "when the game is in progress" do
				it "returns false" do
					allow(board).to receive (:winner?) { false }
					allow(board).to receive (:draw?) { false }
					expect(board.game_over).to be false
				end
			end
		end

		TestCell = Struct.new(:value)
		let(:red) { TestCell.new("RED") }
		let(:yellow) { TestCell.new("YELLOW") }
		let(:empty) { TestCell.new }
		
		describe "#winner?" do
			context "determines if a player has won the game" do
				it "returns true if four horizontal cells have the same value" do
					horizontal_test_grid = [
						[empty, empty, empty, empty, empty, empty, empty],
						[empty, empty, empty, empty, empty, empty, empty],
						[empty, empty, empty, empty, empty, empty, empty],
						[red, yellow, yellow, yellow, yellow, red, red],
						[red, yellow, yellow, red, yellow, red, red]
					]
					board = Board.new(grid: horizontal_test_grid)
					expect(board.game_over).to eq :winner
				end
			end
		end
	end
end