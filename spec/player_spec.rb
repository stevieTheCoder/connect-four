require "spec_helper"

module ConnectFour
	RSpec.describe Player do

		let(:blank) {Player.new({})}
		let(:steve) {Player.new("steve", "RED")}
		let(:rebecca) {Player.new("Rebecca", "YELLOW")}

		describe "#initialize" do
			context "initialize with no input" do
				it "raises an exception" do
					expect{ blank }.to raise_error KeyError
				end
			end
		end
	end
end