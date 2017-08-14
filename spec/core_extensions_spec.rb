require "spec_helper"

RSpec.describe Array do

	let(:empty_array) {["","","","","","",""]}
	let(:test_connected_four) {["RED","RED","RED","RED","YELLOW","YELLOW","YELLOW"]}
	let(:test_unconnected_four) {["RED", "YELLOW", "RED", "RED", "RED", "", "YELLOW"]}

	describe "#all_empty?" do
		context "checks for empty elements in array" do
			it "returns true if all elements are empty strings" do
				expect(empty_array.all_empty?).to be true
			end
		end
	end

	describe "#four_connected?" do
		context "checks whether four adjacent elements in array are same" do
			it "returns true if the condition is met" do
				expect(test_connected_four.four_connected?).to be true
			end

			it "returns false if the array is empty" do
				expect(empty_array.four_connected?).to be false
			end

			it "returns false if there are four same elements but they are not connected" do
				expect(test_unconnected_four.four_connected?).to be false
			end
		end
	end

	describe "#any_empty?" do
		context "checks whether any cells are empty" do
			it "returns true for an empty array" do
				expect(empty_array.any_empty?).to be true
			end

			it "returns true for an array with one empty element" do
				expect(test_unconnected_four.any_empty?).to be true
			end

			it "returns false if all cells are populated" do
				expect(test_connected_four.any_empty?).to be false
			end
		end
	end

	describe "#none_empty?" do
		context "checks whether all cells are full" do
			it "returns false for an empty array" do
				expect(empty_array.none_empty?).to be false
			end

			it "returns false for an array with one empty cell" do
				expect(test_unconnected_four.none_empty?).to be false
			end

			it "returns true for a fully populated array" do
				expect(test_connected_four.none_empty?).to be true
			end
		end
	end

	let(:grid) { [[1,2,3],[1,2,3],[1,2,3]] }

	describe "#diagonals" do
		context "collects all possible diagonals of a 2d array as arrays" do
			it "returns a 2d array of diagonals" do
				expect(grid.diagonals).to eq [[1, 2], [1, 2, 3], [2, 3], [3, 2], [3, 2, 1], [2, 1]]
			end
		end
	end

end