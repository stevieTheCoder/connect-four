module ConnectFour
  RSpec.describe Game do
    let(:steve) { Player.new(name: 'steve', colour: 'red') }
    let(:rebecca) { Player.new(name: 'rebecca', colour: 'yellow') }

    describe "#initialize" do
      context "creating a new game" do
        it "randomly selects a new player" do
          allow_any_instance_of(Array).to receive(:shuffle).and_return([steve, rebecca])
          game = Game.new([steve, rebecca])
          expect(game.current_player).to eq steve
        end

        it "randomly selects an other player" do
          allow_any_instance_of(Array).to receive(:shuffle).and_return([steve, rebecca])
          game = Game.new([steve, rebecca])
          expect(game.other_player).to eq rebecca
        end
      end
    end
  end
end
