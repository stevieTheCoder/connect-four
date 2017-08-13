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
			context "variables can be accessed" do
				it "returns the name" do
					expect(steve.name).to eq "steve"
				end
			end
		end
	end
end