require "spec_helper"

module ConnectFour
	RSpec.describe Player do

		let(:blank) {Player.new({})}
		let(:steve) {Player.new({ name: "steve", colour: "RED" })}

		describe "#initialize" do
			context "initialize with no input" do
				it "raises an exception" do
					expect{ blank }.to raise_error KeyError
				end
			end

			context "can be initialized with a name and colour" do
				it "accepts input hash" do
					expect{ steve }.to_not raise_error
				end
			end
		end

		describe "#name" do
			context "name variable can be accessed" do
				it "returns the player name" do
					expect(steve.name).to eq "steve"
				end
			end
		end

		describe "#colour" do
			context "colour variable can be accessed" do
				it "returns the player colour" do
					expect(steve.colour).to eq "RED"
				end
			end
		end

	end
end