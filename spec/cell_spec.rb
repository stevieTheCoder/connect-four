require "spec_helper"

module ConnectFour
	RSpec.describe Cell do

		let(:cellBlank) {Cell.new}
		let(:cellValue) {Cell.new("RED")}

		describe "#initialize" do
			context "initialize with no input" do
				it "is initialized with a value of '' by default" do
					expect(cellBlank.value).to eq ''
				end
			end

			context "initialize with a value" do
				it "creates a cell with the passed value" do
					expect(cellValue.value).to eq "RED"
				end
			end
		end
	end
end
