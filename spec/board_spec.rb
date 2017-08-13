require "spec_helper"

module ConnectFour
	RSpec.describe Board do

		let(:blank) {Player.new({})}
		let(:steve) {Player.new({ name: "steve", colour: "RED" })}
		let(:board) {Board.new}

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

	end
end