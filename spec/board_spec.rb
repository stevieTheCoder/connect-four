require "spec_helper"

module ConnectFour
	RSpec.describe Board do

		let(:board) {Board.new}
		let(:boardGridTest) {Board.new(grid: "test")}

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

	end
end